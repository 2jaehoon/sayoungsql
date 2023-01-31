--단순 view일지라도 함수를 사용하거나, 연산식을 사용하면 select을 제외한 dml 불가능

create or replace view emp_view as
( select empno, ename, sal, sal+nvl(comm,0) total from emp);

--view 조회
select * from user_views;

--편의성 향상 : 쿼리문 작성에 매번 연산 코드를 작성하지 않아도 된다.
select *
from emp_view;

--dml 불가능
insert into emp_view(empno, ename, sal, ) values(1111,'김사원',3000,3300);

update emp_view
 total=3300
where empno=7788;

--실제테이블에 dml이 발생되면 view에도 바로 적용된다.
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(1111,'김사원', 'MANAGER', 7698, sysdate, 3200, 320, 10);

select * from emp;
select * from emp_view;
rollback;

--with read only 적용
create or replace view cp_3 as (select * from cp_emp3) with read only;

select * from user_views;

--delete
delete from cp_3;

--복합 view----
--여러 개의 테이블을 조합(union, join)하여 생성한 view
--cp emp3. cp_dept를 조합한 view
create or replace view multi_view as
(
select cd.deptno, cd.dname, cd.loc, ce.empno, ce.ename, ce.job, ce.sal, ce.hiredate,
row_number() over(order by hiredate desc) rnum
from cp_dept cd, cp_emp ce
where ce.deptno = cd.deptno
);


--join을 사용하여 복합 뷰를 생성하였기 때문에 조인을 할 필요가 없다
select * from multi_view
where to_char(hiredate,'yyyy')='1981';
