--�ܼ� view������ �Լ��� ����ϰų�, ������� ����ϸ� select�� ������ dml �Ұ���

create or replace view emp_view as
( select empno, ename, sal, sal+nvl(comm,0) total from emp);

--view ��ȸ
select * from user_views;

--���Ǽ� ��� : ������ �ۼ��� �Ź� ���� �ڵ带 �ۼ����� �ʾƵ� �ȴ�.
select *
from emp_view;

--dml �Ұ���
insert into emp_view(empno, ename, sal, ) values(1111,'����',3000,3300);

update emp_view
 total=3300
where empno=7788;

--�������̺� dml�� �߻��Ǹ� view���� �ٷ� ����ȴ�.
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(1111,'����', 'MANAGER', 7698, sysdate, 3200, 320, 10);

select * from emp;
select * from emp_view;
rollback;

--with read only ����
create or replace view cp_3 as (select * from cp_emp3) with read only;

select * from user_views;

--delete
delete from cp_3;

--���� view----
--���� ���� ���̺��� ����(union, join)�Ͽ� ������ view
--cp emp3. cp_dept�� ������ view
create or replace view multi_view as
(
select cd.deptno, cd.dname, cd.loc, ce.empno, ce.ename, ce.job, ce.sal, ce.hiredate,
row_number() over(order by hiredate desc) rnum
from cp_dept cd, cp_emp ce
where ce.deptno = cd.deptno
);


--join�� ����Ͽ� ���� �並 �����Ͽ��� ������ ������ �� �ʿ䰡 ����
select * from multi_view
where to_char(hiredate,'yyyy')='1981';
