--insert : �ܼ��� subquery
--cp_emp ���̺� �����ȣ : 1111, ����� : ������, ���� : ������
-- ���� : ������̺� �����ȣ 7788�� ����� ������ ���� �������� �߰�
-- �Ի����� �������� .
insert into cp_emp(empno, ename, job, sal, hiredate)
values(1111, '������', '������', (select sal from emp where empno = 7788), sysdate );



select * from CP_EMP

--�ܼ��� �ڸ��� ������ ��ȸ�Ǹ� error

insert into cp_emp(empno, ename, job, sal, hiredate)
values(1111, '�����', '������', (select sal from emp), sysdate );


-- ���� ���� �÷��� ���� �Ǵ��� ����
insert into cp_emp(empno, ename, job, sal, hiredate)
values(1113, '�����', '������', (select sal, comm from emp where empno = 7788), sysdate );


--������ ��������
create table cp_emp3 as
(select EMPNO, ENAME, DEPTNO, JOB, SAL
from emp where 1=0);

--emp ���̺��� 10�� �μ��� �ٹ��ϴ� ��� ����� �����ȣ, �����,
--�μ���ȣ, ����, ������ cp_emp3���̺� �߰�

--�÷��� ����
insert into cp_emp3(
select empno, ename, deptno, job, sal
from emp
where deptno=10);

//�÷��� ��� ����
insert into cp_emp3(empno, ename, deptno, job)
(select empno, ename, deptno, job
from emp
where deptno=20);


create table block_user(
id varchar2(30),
last_conn date,
input_date date
);


insert into block_user(id, last_conn)
(select id, LOGIN_DATE
from test_date
where months_between ( sysdate, LOGIN_DATE ) > 2);

--test_date ���̺��� �α����� ������ �α��� ��¥��
--2���� �ʰ��� ���̵�� ��¥�� �˻��Ͽ� block_user ���̺� �߰�

select * from TEST_DATE;


select * from CP_EMP3;
select * from BLOCK_USER;


---update subquery--------
--�ܼ��ุ ����
--cp_emp ���̺��� �����ȣ�� 1111�� ����� ������
--cp_emp ���̺��� �����ȣ�� 7698�� ����� ������ ������ ����

update cp_emp
set job=(select job from cp_emp where empno=7698)
where empno=1111;

--cp_emp3 ���̺��� �μ���ȣ��
--emp ���̺��� ������� 'SCOTT'�� ����� �μ� ��ȣ��
--������ ��� ����� ������ 2000���� ���� '�Ϻ�� ����'

update cp_emp3
set sal = 2000, job = '�˹�'
where deptno=(select deptno
from emp
where ename = 'SCOTT');


select * from CP_EMP3;


--update ������ ��������
--cp_emp3 ���̺��� �μ���ȣ�� emp ���̺��� �����'CLARK'. 'SCOTT'��
--����� �μ���ȣ�� ���� �μ��� ��� ����� ������ 2500���� ����
update cp_emp3
set SAL = 2500
--IN�� ����ϸ� ������ ���������� ����� �� �ִ�.
where deptno IN(select deptno from emp where ename = 'CLARK'OR ENAME = 'SCOTT');
--where deptno = (select deptno from emp where ename = 'CLARK'OR ENAME = 'SCOTT');

select * from cp_emp3;

 commit;

--delete ������ ��������
--cp_emp3 ���̺��� emp ���̺��� �����ȣ�� 7788�� ����� ���� �μ���ȣ ��
--�ش��ϴ� ��� ��� ����
delete
from cp_emp3
where deptno = (select deptno from emp where empno = 7788);

select * from cp_emp3;
