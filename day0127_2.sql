--unique

--�÷� ����
create table unique_column2(
	name varchar2(15),
	card_num char(19) constraint ux_unique_column2_card_num unique
);
--���̺� ����
select * from user_constraints;


select * from UNIQUE_COLUMN2;
--�߰� ����
--���� �Է�
insert into unique_column2(name, card_num)
values('�����','1111-1111-1111-1111');
--�ٸ� ���� ���
insert into unique_column2(name, card_num)
values('�����','1111-1111-1111-1112');
insert into unique_column2(name, card_num)
values('�����','9490-1111-1111-1111');
--null�� ���  ( n���� ���ڵ带 �߰��� �� �ִ�.)
insert into unique_column2(name, card_num)
values('������', '');
insert into unique_column2(name)
values('�̴ܱ�');
--�߰� ����
--�ߺ����� �ԷµǴ� ���
insert into unique_column2(name, card_num)
values('����ȣ','9490-1111-1111-1111');

--���̺� ����
create table unique_table2(
name varchar2(15),
email varchar2(50),
constraint ux_unique_table2_email unique( email )

);

select * from user_constraints;

-- check, not null, default
create table other_constraints2(
name varchar2(30) not null,
age number(2) check (age between 20 and 29),
input_date date default sysdate
);

-- check, not null
select * from user_constraints
where table_name = 'OTHER_CONSTRAINTS2';
--default
select * from user_tab_columns
where table_name = 'OTHER_CONSTRAINTS2';


  select * from OTHER_CONSTRAINTS2;

--�߰� ����
--�̸��� �Էµǰ� ���̰� 20��鼭 ��¥�� �Է�
insert into other_constraints2(name, age, input_date)
values('�����', 28, sysdate);
--�̸��� �Էµǰ� ���̰� 20���̸鼭 �Է����� null�� ���
insert into other_constraints2(name, age)
values('������', 20);

--�߰� ����
--�̸��� null�� ���
 insert into other_constraints2(name, age, input_date)
values('', 28, sysdate);

insert into other_constraints2(age, input_date)
values( 28, sysdate);

--check : ���̰� 20�밡 �ƴ� ���
insert into other_constraints2(name, age, input_date)
values('������', 19, sysdate);



select * from user_constraints
WHERE TABLE_NAME = 'TABLE_CONSTRAINTS';

--alter : ���̺� ����
create table test_alter(
name varchar2(30),
age number(3),
addr number
);

--�÷��� ����
alter table test_alter rename column neam to name;

insert into test_alter(name, age, addr) values('�׽�Ʈ', 20, 1234);
commit;
select * from TEST_ALTER;
--�÷� �������� ����
--���ڵ尡 �����ϸ� ���� ������������ ũ�⸸ ����

--���ڵ尡 �����ϹǷ� �������� ��ü�� ������ �� ����.
alter table test_alter modify addr varchar2(30);

alter table test_alter modify age number(4);

truncate table test_alter;
--���ڵ尡 �������� �����Ƿ� �������� ��ü�� ������ �� �ִ�.
alter table test_alter modify addr varchar2(300);

--�÷� �߰�
--�߰��Ǵ� �÷��� ���� �������� �߰��ȴ�.
alter table test_alter add id varchar2(20) constraint pk_test_alter primary key;

insert into test_alter(name, age, addr, id)
values('������',20,'����� ������','test');


 select * from TEST_ALTER;
 --�÷� ����
 alter table test_alter drop column age;

 --���̺�� ���� : test_alter => test_alter2
 rename test_alter to test_alter2;

 --������� ����
 drop table test_alter2;
purge recyclebin;

create table test_alter(
 name varchar2(30)
);

alter table test_alter add id varchar2(20);

--������� �߰�
--id�÷��� PK �߰�
alter table test_alter add constraint pk_test_alter primary key(id);

select * from user_constraints
where table_name = 'TEST_ALTER';

--������� ���� üũ
insert into test_alter(name,id) values('test','kim');

--������� ����
alter table test_alter drop constraint pk_test_alter;

select * from user_constraints
where table_name = 'TEST_ALTER';

--���� ���̵� �߰��� �� �ִ�.
insert into test_alter(name,id) values('test1','kim');

--�ߺ����� �����Ѵ�.
delete from test_alter where name = 'test1';
--�ߺ��� ���̵� �����ϹǷ� ��������� �߰��� �� ����.
select * from TEST_ALTER;
alter table test_alter add constraint pk_test_alter primary key(id);

--��������� Ȱ��ȭ�Ǿ� �߰��� �� ����
insert into test_alter(name,id) values('test1', 'kim'(;

--������� ��Ȱ��ȭ
alter table test_alter disable constraint pk_test_alter;

select * from user_constraints
where table_name = 'TEST_ALTER';
--������׿� ����Ǵ� ���� �߰��� �� �ִ�.
insert into test_alter(name,id) values('test1','kim');

--������� Ȱ��ȭ
 alter table test_alter enable constraint pk_test_alter;
 --�ߺ��� ���� ��
delete from test_alter where name = 'test1';

--���� ��й�ȣ ����
show user;
alter user scott identified by tiger;

--�����ڰ������� dba_users DD�� ����ϸ� ������ ������ Ȯ��
select * from dba_users
where username = 'SCOTT';

--���� ��ױ�
alter user scott account lock;

--���� ����
alter user scott account unlock;
