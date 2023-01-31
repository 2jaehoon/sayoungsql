--�����뺸��
show recyclebin;

drop table student;

drop table test1;

--�����뿡 �ִ� ���̺� ����
flashback table test1 to before drop;

select * from test1;

--������ ����
purge recyclebin;


----------------alias ���------------
------��� ���̺��� �����ȣ, �����, �Ŵ�����ȣ�� ��ȸ
select EMPNO as employee_number, ENAME emp_name, MGR manager_number
from emp;

--��� ���̺��� �����(�����ȣ)�� ������ xxx$�Դϴ�.�� �������� ��ȸ
--��, ��µǴ� �÷����� OutPut���� �����Ͽ� ��ȸ�� ��

--DBMS���� ������� �ʰ� ��µǴ� ���ڿ��� ���ؼ��� "�� ����� �� �ִ�.
select ENAME||'('||EMPNO||')�� ������'||SAL||'$�Դϴ�.' "OutPut"
from emp;

--alias�� ����� where������ ����� �� ����.
select ename, sal, empno eno
from emp
where empno=7788;

--������̺��� �����ȣ, �����, ����,���� �˻�
-- ��, ������ ������ 3.3�����̴�.
--������ alias�� ó���Ͽ� �˻�
select EMPNO, ENAME, SAL, sal*0.033 tax
from emp;

 --------where�� ���-----------------
 --���迬����, <, <, >=, <=, =, != (<>)

--������̺��� ������ 2450�� �ʰ��ϴ� ������� �����ȣ,
-- �����, ����, �Ŵ�����ȣ, �Ի����� �˻�
 select EMPNO, ENAME, SAL, MGR, HIREDATE
 from emp
 where sal>2450;


 --������̺��� ������ 'clerk'�� �����
 -- ����, ����, ���ʽ� , �μ���ȣ ��ȸ
 select  *
 from emp
 where ename = 'CLRK';


  select  *
 from emp;

 select *
 from emp
 where mgr!=7698;

 select *
 from emp
 where ename = 'BLAKE';


 -----��������----------------------
 --and, or
--and ���װ� ������ ��� �´� ��쿡�� �˻�
--or ���װ� ������ �ϳ��� ������ �˻�

--������̺��� �����ȣ�� 7788�̸鼭 �������  scott��
--����� �����ȣ��, �����, ������ �˻�
select EMPNO, ENAME, JOB
from emp
where empno = 7788 and ename='SCOTT';

--������̺��� ������ 1100~2450 ������ �������
--�����ȣ, �����, ����, ����, �Ŵ��� ��ȣ �˻�
select EMPNO, ENAME, JOB, SAL, MGR
from emp
where sal between 1100 and 2450;


--������̺���  SALESMAN, MANAGER,  ANALYST�� �������
--�����, ����, �����ȣ, �Ŵ�����ȣ, ������ ��ȸ

--�÷��� in(��,,,,);

select ENAME, JOB, EMPNO, MGR, SAL
from EMP
where job not in('SALESMAN','MANAGER','ANALYST');



--��� ���̺��� �Ŵ����� 7788,7698�Ŵ����� �����ϴ� �������
--�����ȣ, �����, �Ŵ��� ��ȣ, �Ի����� ��ȸ�Ͻÿ�.
select ename, ENAME, MGR, HIREDATE
from emp
where MGR not in(7788, 7698);


select distinct * from TEST1;


--������̺��� ���ʽ��� �������� �ʴ� �������
--�����ȣ, �����, ���ʽ� , �Ի����� ��ȸ

--null�� ���迬���ڷ� ���� �� ����. ( =, !=)

select EMPNO, ENAME, COMM, HIREDATE
from EMP
where comm is null;

--������̺��� ���ʽ��� �����ϴ� �������
--�����ȣ, �����, ���ʽ� , �Ի����� ��ȸ

select EMPNO, ENAME, COMM, HIREDATE
from EMP
where comm is not null;


--------------like---------
--���ڿ� �� �Ϻκ��� �˾Ƶ� �˻��� ����
--like�� %, _�� �Բ� ����Ѵ�.
--% �� _�� �Բ� ������� ������ =�� ������ ����� �˻��Ѵ�.

--������̺��� ������� 'SCOTT'�� ����� �����ȣ, �����, �Ի���, �μ���ȣ�� �˻�

select EMPNO, ENAME, HIREDATE, EMPNO
from emp
where ename like '%AKE';


--char, varchar2�� �÷�ũ�⿡ byte�� ���� �� �ִ�.
create table like_test(
name varchar2(30byte),
addr varchar2(200)
);

insert into like_test(name,addr) values('�����','����� ������ ���ﵿ');
insert into like_test(name,addr) values('��Թ�','����� ���ʱ� ���ʵ�');
insert into like_test(name,addr) values('��ΰ�','����� ���빮�� ���빮��');
insert into like_test(name,addr) values('������','��⵵ ������ ������ ���ﵿ');
insert into like_test(name,addr) values('�̱���','������ ���ʱ� ��ź��');
insert into like_test(name,addr) values('���¿�','��õ�� ���빮�� ���빮��');
insert into like_test(name,addr) values('�������','���ֽ� �̵���');
insert into like_test(name,addr) values('������','��û���� ����� ���ʸ�');


commit;

select * from LIKE_TEST;

select *
from LIKE_TEST
where addr like '%������%';

--%��� ���ڿ�
--����ÿ� �����ϴ� ����� �̸��� �ּҸ� ��ȸ
select NAME, ADDR
from LIKE_TEST
where addr like '�����%';

--���ﵿ�� �����ϴ� ����� �̸��� �ּҸ� ��ȸselect NAME, ADDR
select name, addr
from LIKE_TEST
where addr like '%���ﵿ';

--�ּҿ� '����'�� ����ִ� ��� ���ڵ带 ��ȸ
select addr
from LIKE_TEST
where addr like '%����%';


--������̺��� ����� 'A'�� ��������鼭 ������ 2000�̻��� �����
--�����ȣ, �����, ����, ���ʽ�, �μ���ȣ
select EMPNO, ENAME, SAL, COMM, DEPTNO
from emp
where ename like '%A%' and sal>=2000;


select EMPNO, ENAME, SAL, COMM, DEPTNO
from emp
where ename like '_LAKE' and sal>=2000;


--������̺��� 'L'�� �ΰ� ����ִ� ����� �����, �����ȣ�� ��ȸ
select  ENAME, EMPNO
from emp
where ename like '%L%L%';



-----�����ּ� ���� ���̺�
create table zipcode(
zipcode char(7),
sido char(6),
gugun varchar2(25),
dong varchar2(200),
bunji varchar2(25),
seq number
);


 commit;



 alter table zipcode
 rename column gugu to gugun;


 select * from zipcode;

 truncate table zipcode;


 --zipcode ���̺��� ����Ͽ� �ڽ��� ��� �ִ� ���� �˻�
 --�����ȣ, �õ�, ����,�� ��, ������ ��� �ּҷ� ǥ��
 select ZIPCODE||SIDO||GUGUN||DONG||BUNJI
 from zipcode
 where dong like '%���ϵ�%��渮����2��___';

 select * from TEST1;

select * from LIKE_TEST;



--�̸��� 3������ ����� ���ڵ� �˻�
select name
from LIKE_TEST
where name like '____';

 --�̸��� 3������ ��� �׻���� ���ڵ� �˻�
select name
from LIKE_TEST
where name like '_��_';














