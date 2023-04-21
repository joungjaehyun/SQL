


-- DEPT MANAGER

-- 1. List

select * from dept;

-- 2. search

select * from dept where deptno=10;
--select * from dept where deptno=?;
select * from dept where dname ='ACCOUNTING';
--select * from dept where dname =?;

-- 3. insert
insert into dept values (50, 'TEST', 'SEOUL');
--insert into dept values (?, ?, ?)
rollback;

-- 4. 수정 update
update dept set dname = 'AAA', loc = 'BBB' where deptno = 60;
-- update dept set dname =?,loc =? where deptno =?;