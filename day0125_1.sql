-- �׷캰 ����
-- ��� ���̺���, �μ� ��ȣ, �μ��� ��� ���� ��ȸ

select deptno, count(ename), count(comm), count(*)
/* empno : group by�� ���Ե��� ���� �÷��� ���Ǹ� error */
from emp
group by deptno
order by deptno;

-- ������̺��� �μ��� �ְ� ����, ��� ����, ���� ����, ���� ���� ��ȸ
select deptno, max(sal), trunc(avg(sal),0), min(sal), sum(sal)
from emp
group by deptno;

-- ������̺��� �Ŵ����� �ְ� ����, ���� ���� ��ȸ
-- �� �Ŵ����� ���� ����� ��ȸ���� �ʴ´�.
select mgr, max(sal), sum(sal), count(*)
from emp
where mgr is not null
group by mgr
--having mgr is not null
order by mgr;


select max(sal), min(sal), sum(sal)
from emp;

--�Ұ�� �հ��� ���
--������̺��� �μ��� ������, ������ �˻�



--rollup : ������ ���߿� �˻�
 select deptno, sum( sal )
 from emp
 group by rollup(deptno);




--cube : ������ ���� �˻�
 select deptno, sum( sal )
 from emp
 group by cube(deptno);

--�׷����� ���� �÷��� ���� ���� ���
--������̺��� �μ��� �ش��ϴ� ������ ��� ��
select deptno, job, count(empno), sum(sal)
from emp
group by rollup( deptno , job );




select deptno, job, count(empno), sum(sal)
from emp
group by cube( deptno , job );


-- �׷����� ���� ����
-- ��� ���̺��� �μ��� ��� ��, ���� ���� ��ȸ
-- ��, �μ��� ��� ���� 3���� �ʰ��ϴ� �μ��� �׷����� ��� ��ȸ
select deptno, count( * ), sum( sal )
from emp
group by deptno
having count( * ) > 3;

-- ���� �Լ�
-- ������̺��� ��� ��ȣ, �����, ����, ���� ������ ��ȸ

-- �ߺ� ������ ǥ��
select empno, ename, sal, rank() over( order by sal )
from emp;


-- �ߺ� ������ ǥ��x
select empno, ename, sal, row_number() over( order by sal )
from emp;

--������̺��� ������ ����, ���� ������ ��ȸ
--���� ����
select job, sal, rank() over (partition by job order by sal)
from emp;

--������̺��� ������ ����, ���� ������ ��ȸ
--���� ����x
select job, sal, row_number() over (partition by job order by sal)
from emp;



--zipcode ���̺��� ����ÿ� �ش��ϴ� ���� ���� ���� ��ȸ
select sido, gugun, count(*)
from zipcode
where sido = '����'
group by sido, gugun;
