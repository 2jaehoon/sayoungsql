--�����Լ�
--count : null�� �÷��� ���迡 �������� �ʴ´�.

--������̺��� �� ���� ���ڵ尡 �����ϴ� ��?
select count(empno), count(mgr), count(comm)
from emp;

--������̺��� ���ʽ��� ���� ����� �� �˻�
select count(ename)
from emp
where comm is null;

select * from emp;

--������̺��� ���ʽ��� �������� �ʴ� ����� �� ��ȸ
select count(*)-count(comm)
from emp;

--������̺��� ������, �������
select sum(sal), avg(sal)
from emp;


	--������̺��� ��տ������� ���� �޴� ����� �����ȣ, �����, ����, �Ի��� ��ȸ
	select ename
	from emp
	group by ename
	having sal>avg(sal);



select * from emp;

