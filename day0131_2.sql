select * from dba_role_privs
where grantee = 'SCOTT';

--���� ��ȸ : dba_users

select *
from dba_users;

--���� ����


--1. _ORACLE_SCRIPT�� ����ϵ��� ����
alter session set "_ORACLE_SCRIPT"=true;

--2. ��������
create user ljh identified by 1234;

select * from dba_users;
-- ���� Ȯ�� : dba_role_privs

select * from dba_role_privs
where grantee='LJH';

--���� �ο�
-- ���� ����
grant connect to ljh;
--DBF���� ��� ���� : table �����Ǵµ� tablespace�� ����� �� ����.
grant resource to ljh;
--tablespace ������ �ο�
alter user ljh default tablespace users quota unlimited on users;


create sequence seq
increment by 1
start with 1
maxvalue 9999999;



-- ���� ȸ��
-- c##�� ������ ���� ������ ����Ϸ��� _ORACLE_SCRIPT�� ����ؾ� �Ѵ�.
alter session set "_ORACLE_SCRIPT"=true;

revoke connect from ljh;

select * from dba_role_privs
where grantee='LJH';

grant connect to ljh;

--���� ����
-- �������� ������ ������ �� ����.
drop user ljh cascade;

select * from user_tab_columns;
select * from user_tab_cols;

select * from user_synonyms;


select * from dba_sys_privs
where grantee = 'SCOTT';

--synonym ���� ���� �ο�
grant create synonym to scott;

--synonym �������� ȸ��
revoke create synonym from scott;

--scott ����
--�ó�� ����
create synonym zip for zipcode;
create synonym ce for cp_emp3;

--������ �ó�� Ȯ��
select * from user_synonyms;

--�ó�� �� ���
select * from Ce;
select * from zip;
--���� ���̺� �� ���
select * from cp_emp3;


insert into ce(empno, ename, deptno)
values(1111,'������', 20);

--�ó�� ����
drop synonym ce;

select * from user_synonyms;

--�ó�� ���� ȸ��( ������ )
revoke create synonym from scott;


select * from dba_sys_privs
where grantee = 'SCOTT';

--���� ȸ���� �Ǿ����� �����Ǿ� �ִ� �ó���� ����� �� �ִ�.
select * from zip;

drop synonym zip;

-- ������ �ִ� ������ view ����
create view ce as (select empno, ename, job from cp_emp3);


--���Ѻο� : ������ ������ ����

grant create view to scott;

select * from dba_sys_privs
where grantee='SCOTT';

--scott ����
-- �ܼ� view ���� : �ϳ��� ���̺��� ����� view,
-- �Լ��� ������ ������� �ʰ� ����� view ( ����� ���̺�� view ���� => dml ����)

-- ���� �̸��� view�� �����ϸ� error
create view ce as (select * from cp_emp3);

-- ���� �̸��� view�� �����ϸ� ġȯ ����
create or replace view ce as (select * from cp_emp3);

--DD :  user_views

select * from user_views;

--view DML ���� �ܼ� view�̱⿡
select * from ce;

--view�� ���� insert : view�� insert�� �����ϸ� ����� ���̺� ���ڵ尡 �߰��ȴ�.
insert into ce(empno, ename, deptno) values(2222, '�׽�Ʈ', 10);
commit;

-- view�� ���� update :
--view�� update�� �����ϸ� ����� ���̺� ���ڵ尡 ����ȴ�.
update ce
set ename = '�͸�', job='MANAGER', sal = 3000
where empno = 2222;
commit;

--view�� ���� delete :
--view�� delete�� �����ϸ� ����� ���̺� ���ڵ尡 �����ȴ�.
delete
from ce
where empno=2222;
commit;

--���� ���̺� �ݿ�
select * from cp_emp3;


--view ����
drop view ce;

select * from user_views;
