--��¥�� + ������ ����ϸ� ���ڰ� ��������.
select sysdate, sysdate + 1, sysdate + 2, sysdate + 30
from dual;



--�� ����
select sysdate, add_months(sysdate, 1), add_months(sysdate, 2), add_months(sysdate, 12)
from dual;

--��¥ ���� ���� ����
select sysdate, months_between (sysdate, '2022-12-25')
, months_between (sysdate, '2022-12-26')
from dual;



--������̺��� �����ȣ, �����, �Ի���, �ټ� ���� ���� ��ȸ
select EMPNO, ENAME, HIREDATE, trunc(months_between ( sysdate, hiredate ) , 0)
from emp;

create table test_date(
id varchar2( 20 ),
login_date date
);

insert into test_date(id, login_date) values('kim', sysdate);
insert into test_date(id, login_date) values('lee', sysdate-30);
insert into test_date(id, login_date) values('park', sysdate-32);
insert into test_date(id, login_date) values('test', sysdate-91);
insert into test_date(id, login_date) values('hong', sysdate-90);
insert into test_date(id, login_date) values('lee2', sysdate-100);
insert into test_date(id, login_date) values('kim3', sysdate-1);
insert into test_date(id, login_date) values('kim44', sysdate-101);


commit;
select * from TEST_DATE;

-- test_date ���̺��� �α����� ��¥�� 3������ �ʰ��ϴ� ���̵�,
-- �α����� ����, ���� ���� ��ȸ
select LOGIN_DATE, trunc(months_between ( sysdate, LOGIN_DATE ) , 1)
from test_date
group by LOGIN_DATE
having months_between ( sysdate, LOGIN_DATE ) > 3;



---------------------------------subquery----------------------------------------------
--create subquery : ���̺� ����
--dept ���̺��� ��� �˻��Ͽ� �˻��� ����� cp_dept��� ���̺��� ����


create table cp_dept as (select deptno, dname, loc from dept);

select * from CP_DEPT;

--DD (Data Dictionary) : DBMS���� ���� �������� �����ϴ� ���̺�
-- �����ڴ� select�� ����
select * from user_constraints;

select * from cp_dept;

--emp ���̺��� 10, 30�� �μ� �����ȣ, �����, ����, ����, �Ի����� ��ȸ�Ͽ�
-- ��ȸ����� cp_emp ���̺��� ����
create table cp_emp as (select deptno, empno, ENAME, JOB, SAL, HIREDATE from emp where deptno in (10, 30));
select * from CP_EMP;


--cp_emp2 ���̺��� �����ϴ� emp���̺� �����ȣ, �����, �Ŵ��� ��ȣ, �Ի���
-- ������ ������ ������ ���̺��� ����

--���ڵ尡 �˻����� �ʵ��� emp ���̺� �˻�
desc emp;

select EMPNO, ENAME, MGR, HIREDATE, JOB
from emp
where 1=2;

create table cp_emp2 as (select EMPNO, ENAME, MGR, HIREDATE, JOB
from emp
where 1=2);
, CP_EMP2
















