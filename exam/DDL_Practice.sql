-- 1. phoneInfo_basic 테이블의
-- SELECT, UPDATE, DELETE, INSERT 하는 SQL

--create
create table phoneInfo_basic(
    idx number(6) constraint PHONEBASIC_IDX_PK primary key,
    fr_name varchar2(20) not null,
    fr_phonenumber varchar2(20) not null,
    fr_email varchar2(20),
    fr_address varchar2(20),
    fr_regdate date default sysdate
    );

--insert
insert into phoneInfo_basic values 
(1,'손흥민','010-1111-2222','son@gmail.com','영국 런던','2023-4-18');
insert into phoneInfo_basic values 
(2,'박지성','010-3333-2222','park@gmail.com','대한민국 서울','2022-4-18');
insert into phoneInfo_basic values 
(3,'이강인','010-3333-4444','lee@gmail.com','스페인 ','2023-1-18');

--select 
select *from phoneinfo_basic;
select * from phoneinfo_basic where idx=1;

--update
update phoneinfo_basic
set fr_regdate ='2022-4-18'
where idx=1;

--delete
delete from phoneinfo_basic
where idx = 2;

-- 2. phoneinfo_univ 테이블의 
-- SELECT, UPDATE, DELETE, INSERT 하는 SQL
--create
create table phoneinfo_univ(
idx number constraint PHONEUNIV_IDX_PK primary key,
fr_u_major varchar2(20) default 'N' not null, 
fr_u_year number(1) default 1 check (fr_u_year between 0 and 5) not null,
fr_ref number(7) constraint PHONEUNIV_REF_FK REFERENCES 
phoneinfo_basic (idx) not null);

--insert 
insert into phoneinfo_univ(idx, fr_ref) values (1, 1);
insert into phoneinfo_univ(idx, fr_ref) values (2, 3);
insert into phoneinfo_univ(idx, fr_ref) values (3, 3);
--select
select * from phoneinfo_univ;

--update 
update phoneinfo_univ
set fr_u_major = 'SOCCER'
where idx=1;

--delete
delete from phoneinfo_univ
where idx=3;

-- 3. phoneinfo_com 테이블의 
-- SELECT, UPDATE, DELETE, INSERT 하는 SQL
create table phoneinfo_com(
idx number(6) constraint PHONECOM_IDX_PK Primary key,
fr_c_company varchar2(20) default 'N' not null,
fr_ref number(6) constraint PHONECOM_FRREF_FK 
references phoneinfo_basic(idx) not null);

--insert 
insert into phoneinfo_com values (1,'토트넘', 1);
insert into phoneinfo_com values (2,'마요르카', 3);

--select 
select * from phoneinfo_com;

--update
update phoneinfo_com
set fr_c_company ='토트넘 잔류'
where idx= 3;

--delete
delete from phoneinfo_com
where idx=3;

