/*���*/-- PK����
-- �÷� ���� �������
drop table primary_column2;
purge recyclebin;
create table primary_column2(
-- id varchar2(16) primary key, ������׸��� �ڵ� �����ȴ�.(SYS_00000)
id varchar2(16) constraint pk_primary_column2 primary key,
 name varchar2(30)
);

select * from user_constraints
where table_name = 'PRIMARY_COLUMN2';
select * from user_constraints
where CONSTRAINT_TYPE = 'P';


--PK ������� �׽�Ʈ
-- �߰� ����
-- ���� �Է�
insert into primary_column2(id,name) values('kim', '�����');
--���̵� �ߺ����� �ʴ� ���
insert into primary_column2(id,name) values('kim1', '�����');
insert into primary_column2(id,name) values('lee', '�̴ܱ�');
select * from PRIMARY_COLUMN2;

--�߰� ����
--�ߺ��� ���̵� �ԷµǴ� ���
insert into primary_column2(id,name) values('kim', '������');

--null �Է��ϴ� ���
--varchar2 �÷��� ����
insert into primary_column2(name) values( '������');
--varchar2,char ' '�߰�
insert into primary_column2(id, name) values('', '������');

insert into dept(deptno, dname, loc) values(10, '���ߺ�', '����');

--���̺���� �������
create table primary_table2(
id varchar2(20),
name varchar2(30),
constraint pk_primary_table2 primary key(id)
);

select * from user_constraints;

--���� ���� �÷��� �ϳ��� PK�� ����
--���̺� ���� ����������θ� ����
CREATE TABLE PRIMARY_MULTI2(
ITEM_NO CHAR(8),
ITEM VARCHAR2(50),
ITEM_INFO VARCHAR2(4000),
PRD_DATE CHAR(7),
CONSTRAINT PK_PRIMARY_MULTI2 PRIMARY KEY(ITEM_NO, PRD_DATE)
);

--dd�˻�
--���̺� ������ ��������� ����, Ȱ��ȭ ���� ��
select * from user_constraints
where table_name='PRIMARY_MULTI2';
--���̺� �÷���, ������, ũ�� , ������ �� ����
select * from user_tab_cols
where table_name='PRIMATY_MULTI2';
--���̺� �÷��� ����� �������
select * from user_cons_columns
where table_name='PRIMARY_MULTI2';






--�߰� ����
--���� �Է�
select * from PRIMARY_MULTI2;

INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('I_000001', 'Ű����', '���� Ű����� ���ڴ� û������!!', '2023-01');

--�߰� ����
INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('', '�����', '���� �Ƿ��ؿ� �ּ�', '2023-01');
INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('I_000001', 'CPU', 'CPU����', '2023-02');

