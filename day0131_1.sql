--ANSI outer join

-- ��� �μ��� �ٹ��ϴ� �μ���ȣ, �μ���, �����ȣ, �����, �Ի��� ��ȸ
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.hiredate
from emp e
right outer join dept d
on e.deptno=d.deptno;

--�����簡 ����, bmw�� ��� ������ ������, ������, �𵨸�, ����, ����, �ɼ� ��ȸ
select cc.country, cc.maker,
			 cma.model,
			 cmo.car_year, cmo.price, cmo.car_option
from CAR_COUNTRY cc
left outer join CAR_MAKER cma
on cma.maker = cc.maker
left outer join CAR_MODEL cmo
on cmo.model = cma.model
--���� ������ �߸� �����ϸ� ��� ���ڵ尡 ��������
-- ������ cartesion prodect�� �߻��Ѵ�. => ���x
where cc.maker in ('����','BMW');

--���̺��� ���ڵ� ������ ���� ���� �� ��� ���̺��� ������ �˻� full outer join
select cc.country, cc.maker,
			 cma.model,
			 cmo.car_year, cmo.price, cmo.car_option
from CAR_COUNTRY cc
full outer join CAR_MAKER cma
on cma.maker = cc.maker
full outer join CAR_MODEL cmo
on cmo.model = cma.model
--���� ������ �߸� �����ϸ� ��� ���ڵ尡 ��������
-- ������ cartesion prodect�� �߻��Ѵ�. => ���x
where cc.maker in ('����','BMW');

--������̺��� JONES���� ������ ���� �޴� ����� �����ȣ, �����, ����, ������ȣ ��ȸ
SELECT  EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='JONES');

select e1.EMPNO, e1.ENAME, e1.SAL, e1.DEPTNO
from emp e1, emp e2
where e1.sal > E2.sal and e2.ename = 'JONES';


drop table zipcode;
purge recyclebin;

drop sequence seq_test2;
