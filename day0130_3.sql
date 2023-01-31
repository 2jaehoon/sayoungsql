--inner join : ���� ���̺� ������ ���ڵ尡 �������� �� �˻�
-- ����� �����ϴ� �μ��� ���� �μ���ȣ, �μ���, ��ġ(dept)�μ���ȣ(emp)�����ȣ, �����,����, �Ի��� �˻�.

--ANSI
-- �÷��� �ĺ��Ǹ� ���̺���� �����Ͽ� ����� �� �ִ�. ( �÷��� � ���̺� �����ϴ� �� �� �� ����. )
select dname, loc, dept.deptno, empno, ename, sal, hiredate
from dept
inner join emp
on emp.deptno=dept.deptno;


-- �÷��� � ���̺� �����ϴ��� �˼� �ֵ��� ���̺��.�÷������� ���
--(�������� �������)
select dept.dname, dept.loc, dept.deptno, emp.empno, emp.ename, emp.sal, emp.hiredate
from dept
inner join emp
on emp.deptno=dept.deptno;


--���̺�� alias �ο� : ���̺���� ����� �� ���� alias�θ� ���
select d.dname, d.loc, d.deptno, e.empno, e.ename, e.sal, e.hiredate
from dept d
inner join emp e
on e.deptno=d.deptno;

--Oracle
select dname, loc, d.deptno, empno, ename, sal, hiredate
from dept d, emp e
where e.deptno=d.deptno;

-- ������, ������, �𵨸� �˻�
select cc.COUNTRY, cc.MAKER, cm.MODEL
from CAR_COUNTRY cc, CAR_MAKER cm
where cm.MAKER = cc.MAKER;

select * from user_indexes
where table_name='CAR_COUNTRY';

select rowid, country
from car_country;

--��� �μ��� �ٹ��ϴ� ��� ������ ��ȸ
-- �˻� �÷�, �μ���, ��ġ, �μ���ȣ, �����ȣ, �����, ������ �˻�
select d.dname, d.loc, d.deptno, e.empno, e.ename, e.sal
from dept d , emp e
where e.deptno(+)=d.deptno;


-- �����簡 ������ ��� ������ ������, �𵨸�, �ɼ�, ��� �˻�
select cma.MAKER, cma.MODEL, cmo.MODEL, cmo.CAR_OPTION, cmo.CAR_YEAR
from CAR_MAKER cma, CAR_MODEL cmo
where cmo.model(+) = cma.model and maker = '����';







select * from emp;
select * from dept;


