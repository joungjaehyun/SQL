--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.

--(5) 박지성이구매한도서의출판사수

select count(b.publisher)
from book b join orders o
    on b.bookid= o.bookid
            join customer c
    on o.custid=c.custid
    where o.custid=1;
    
--(6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select b.bookname ,b.price, b.price- o.saleprice as difference
from book b join orders o
    on b.bookid= o.bookid
            join customer c
    on o.custid=c.custid
    where o.custid=1;

--(7) 박지성이구매하지않은도서의이름
select b.bookname 
from book b where b.bookname not in (select b.bookname 
from book b join orders o
    on b.bookid= o.bookid
            join customer c
    on o.custid=c.custid
    where o.custid=1);
    
--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

--(8) 주문하지않은고객의이름(부속질의사용)
select cs.name
            from customer cs
         where cs.custid not in (select o.custid 
         from orders o , customer cs
         where o.custid=cs.custid);
   
       
--(9) 주문금액의총액과주문의평균금액
select sum(saleprice) as total,avg(saleprice) as avg
from orders;
--(10) 고객의이름과고객별구매액
select (select cs.name
        from customer cs
        where cs.custid = o.custid) as name,
        sum(saleprice)
        from orders o
        group by o.custid;
--(11) 고객의이름과고객이구매한도서목록
select cs.name,  b.bookname
from customer cs join orders o
            on cs.custid= o.custid
            join book b
            on o.bookid=b.bookid
            order by cs.name asc;
--(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select *
from book b join orders o
on b.bookid = o.bookid
where b.price - o.saleprice =
(select max(b.price - o.saleprice)
from orders o join book b
on o.bookid=b.bookid);


--(13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름
select cs.name , avg(o.saleprice)
from customer cs , orders o
where cs.custid= o.custid 
having avg(o.saleprice) > (select avg(saleprice) from orders)
group by cs.name;

--3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.

--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select cs.name 
from customer cs 
            join orders o
            on cs.custid = o.custid
            join book b
            on o.bookid = b.bookid
            where cs.name  !='박지성' and b.publisher in (
            select b.publisher
            from book b join orders o
            on b.bookid= o.bookid
            where o.custid =1);
            
--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select cs.name
from customer cs join orders o
                on cs.custid = o.custid
                join book b
                on o.bookid = b.bookid
                group by cs.name
                having count(distinct b.publisher)>=2
                order by cs.name asc;