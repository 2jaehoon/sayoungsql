--�θ����̺� ���ڵ� �߰�(�л����� �߰� - �й��� ����)
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000001', '�����', 'test@test.com', '010-1234-5678', '����', sysdate);
commit;
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000002', '������', 'yoon@test.com', '010-1234-2222', '����', sysdate);
commit;
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000003', '������', 'lee@test.com', '010-1234-2222', '����', sysdate);
commit;
select * from TEST_STUDENT;
select * from TEST;
--��ϵ� �л��� ������ ����
--����� �л��� �ڹ� ������ �ô�.
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000001', 'Java', 90, sysdate);
--������ �л��� �ڹٽ����� �ô�.
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000002', 'Java', 90, sysdate);


--����� �л��� ����Ŭ ������ �ô�. (�� �л��� ���� ������ ���� �� �� �ִ�.)
 insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_O_000001','S_000001', 'Oracle', 89, sysdate);

--�� �л��� ���� ������ �� �� ���� �� �� ����(PK ����)
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000001', 'Java', 89, sysdate);

--�������� �ʴ� �л��� ������ �� �� ����.(FK ����)
 insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000004', 'Java', 89, sysdate);
commit;

-------------foreign key : ����----------------------
-- ���� ���� ���� ������ �ִٸ� �θ����̺��� �÷� ���� ���ƾ� �� ��
--FK�� �����ϴ� �÷��� �θ� ���̺��� �÷���� ���� �ʿ�� ����.
--��, �θ� ���̺��� ������ ���� �����ϴ� ���̴� ���������� ũ�⸸ ���� ���߸� �ȴ�.

drop table foreign_column2;

-- �÷� ����
create table foreign_column2(
	id varchar2( 16 ) constraint fk_foreign_column_id
	references primary_column2(id) on delete cascade ,
	age number(3)
);


select * from user_constraints;
purge recyclebin;

--�߰� ����
--�θ����̺� �����ϴ� ������ ���ڵ带 �߰�
select * from foreign_column2;
select * from primary_column2;
insert into foreign_column2(id,age)
values('kim', 20);
--���� ���̵�� ���� ���� ���ڵ� �߰�
insert into foreign_column2(id,age)
values('kim', 21);

insert into foreign_column2(id,age)
values('lee', 25);
commit;

--null�� ���
insert into foreign_column2(age)
values(30);
commit;

--error
--�θ����̺� ���� ������ �߰��ϴ� ���
insert into foreign_column2(id,age)
values('lee1', 25);





--���̺� ����
--�ڽ����̺��� �����ϴ� �÷���� �θ� ���̺��� �÷����� ���� �ʾƵ� �ȴ�.
create table foreign_table2(
	r_id varchar2(20),
	addr varchar2(500),
	constraint fk_foreign_table_r_id foreign key(r_id)
	references primary_table2(id)
);

select * from user_constraints
where table_name='FOREIGN_TABLE2';

--on delete cascade�� �����Ǿ� ���� ���� ��� �θ� ���̺� �����ϰ� �ִ�
--�ڽ� ���ڵ尡 �����ϸ� �θ� ���̺��� ���ڵ�� �������� �ʴ´�.
select * from primary_column2;
select * from foreign_column2;

--kim�� �ڽ� ���ڵ尡 �����ϱ� ������ �������� �ʴ´�.
delete from primary_column2 where id = 'kim';
--�����Ϸ��� �ڽ� ���ڵ带 ���� ������ �� �θ� ���ڵ带 ����
--1. �ڽ� ���ڵ� ����
delete from foreign_column2 where id = 'kim';
--2. �θ� ���ڵ� ����
delete from primary_column2 where id = 'kim';

--on delete cascade�� �����ϸ� �θ� ���̺��� ���ڵ尡 �����Ǹ�
--�ڵ����� �ڽ����̺��� ���ڵ尡 �����ȴ�.
delete from primary_column2 where id = 'lee';

--kim1�� �ڽ� ���ڵ尡 �������� �ʱ�  ������ �����ȴ�.
delete from primary_column2 where id = 'kim1';



