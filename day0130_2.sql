-- ����(emp), ����(cp_emp)
-- ����� ���翡 �ٹ����� ��� ��� ������ ��ȸ
-- ��ȸ�÷� : �����ȣ, �����, ����, ����, �Ի���

select empno, ename, job, sal, hiredate
from emp
union
 select empno, ename, job, sal, hiredate
from cp_emp
order by empno;


-- �÷��� ���� ���������� ������ ������ �߻����� �ʴ´�.
select empno, ename, job, sal, hiredate
from emp
union
 select  sal, job, ename, empno, hiredate
from cp_emp
order by empno;

--�÷��� ���� ��ġ���� ������ error
select empno, ename, job, sal, hiredate
from emp
union
 select  sal, job, ename, empno
from cp_emp
order by empno;

--���������� ��ġ���� ������ error
select empno, ename, job, sal, hiredate
from emp
union
 select  ename, empno, job, sal, hiredate
from cp_emp
order by empno;



select * from emp;
select * from cp_emp;
