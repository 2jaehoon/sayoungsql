--scalar subquery
--�ٸ� ���̺��� �÷� ���� �Բ� ��ȸ
-- �����ȣ, �����, �μ���ȣ������ emp ���̺�, �μ��� dept ���̺��� �˻�
select empno, ename, deptno, (select dname from dept where dept.deptno=emp.deptno) dname
from emp;

select * from CAR_COUNTRY;--������, ������
select * from CAR_MAKER;--������, ��
select * from CAR_MODEL;--�𵨺� ���� ����

--������, �𵨸�, ����, car_option�� �˻�
select (select maker from car_maker where car_maker.model=car_model.model),model, car_year, car_option
from car_model;

-- select ������ ��������
-- ����)
-- ��� ���̺��� �����ȣ, �����, ����, �Ŵ��� ��ȣ, �Ի����� ��ȸ
-- ��, �Ի�⵵�� 1981���� ����� �˻�

/*2. ����ȸ : �ٱ� ���������� ���� ���̺��� �÷��� ����� �� ����. */
/* alias�� �ο��Ǹ� alias�θ� ���ȴ�.*/
select eno, ename, job, mgr, hiredate/*, sal ���� ���̺��� �÷�x*/
from ( select empno eno, ename, job, mgr, to_char(hiredate,'yyyy') hiredate
from emp ) /*1. inline view�� �����*/
where hiredate = '1981';

select * from EMP;

--rownum
-- ������̺��� ��ȣ, �����ȣ, ����� �˻�
select * from EMP;

select rownum, empno, ename
from emp
order by empno desc;

--�μ����̺��� �μ���ȣ, �μ���, ��ġ, ��ȣ
select DEPTNO, DNAME, LOC, rownum
from dept;

-- where������ ���Ǹ� 1������ �˻��� �ǳ�, �׷��� ������ �˻����� �ʴ´�.
-- ������̺��� ��ȣ�� 1~5�� ������ ��� �˻� (�� ���� ��ȣ�� ���۵Ǹ� �˻�x)
-- �˻��÷��� ��ȣ, �����ȣ, �����, �Ի���
select rownum, EMPNO, ENAME, HIREDATE
from emp
where rownum >=1 and rownum <=5;
--where rownum between 1 and 5;

-- rownum�� orderby���� ���� ���� ( order by�� �Բ� ���Ǹ� ��ȣ�� ���δ�. )
select rownum, empno, ename, sal
from emp
order by sal desc;

--������̺��� ���� �������� �Ի��� ������� 5���� ���ڵ带 ��ȸ
--��ȸ �÷��� �����ȣ, �����, ����, �Ի���

--subquery���� �ٱ� �������� �÷��� inline view���� ������ �÷��� ����ϳ�
--rownum�� select������ �����ǰ� ���ȴ�.
select HIREDATE, ENAME, SAL, empno, rownum
from
(select  hiredate, ename, sal, empno
from emp order by hiredate desc)
where rownum between 1 and 5;

--������̺��� ���� �������� �Ի��� ����  ������� 5���� ���ڵ带 ��ȸ
--��ȸ �÷��� �����ȣ, �����, ����, �Ի���

select rnum, empno, ename, sal, hiredate      /*alias�� �Ϲ� �÷����� �ν��ϱ� ���� subquery�� �� �ۼ�*/
	from(select HIREDATE, ENAME, SAL, empno, rownum rnum       	/*2. �� ���ĵ� �����Ϳ� �� ��ȣ�� ����*/
	from(select  hiredate, ename, sal, empno, rownum     /*1. �� ���ĵ� ������*/
			from emp
			where hiredate < '1987-05-23'
			order by hiredate desc))
	where rnum between 2 and 6;

	--row_number() over()�� ���
	 select EMPNO, ENAME, SAL, HIREDATE, rnum
	from (select EMPNO, ENAME, SAL, HIREDATE, row_number() over(order by hiredate desc) rnum
				from emp)
				where rnum between 2 and 6;


-- car_model ���̺��� ��ⷮ�� ������������ �˻� ���� �� 5~15��° ������ �˻�
-- �˻� �÷��� �𵨸�, ����, ����, �ɼ�, ������ȣ5~10, 1������ ��ȣ��

select * from CAR_MODEL;

select MODEL, CAR_YEAR, PRICE, CAR_OPTION, rnum,cc, rownum
from(select MODEL, CAR_YEAR, PRICE, CAR_OPTION,cc, row_number() over(order by cc desc) rnum
	from car_model)
	where rnum between 5 and 15;

  select * from DEPT;
  select DISTINCT DEPTNO from EMP;






















