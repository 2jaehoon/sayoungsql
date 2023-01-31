-- ������ ����
-- 1���� 9999���� 1�� �����ϴ� ������ ����
drop sequence seq_test;

create sequence seq_test
start with 1
maxvalue 9999
increment by 1;

-- ������ ��ȸ : user_sequences DD
select * from user_sequences;

-- ������ ���� ��ȣ ���(��������.currval)
-- currval : ������ ���ǿ� �ε�� �������� ���� ��ȣ ��´�.
-- 					 ������ ���ǿ� �������� �ε��� �� ����.
select seq_test.currval from dual;

-- nextval : ������ ���ǿ� �������� �ε�Ǿ� ���� �ʴٸ�
--		    		 File �������� Last_number�� �����ϰ� �����ڼ��ǿ�
--					   ������ ��ü�� �ε��� �� ���� ��ȣ�� ��´�.
--* ��������ü�� �����Ѵٸ� cache��ŭ�� �����ȿ��� ��ȣ�� ��´�.
--           cache ���� �ʰ��ϸ� File ������ Last_num��  ������ ��  �ٽ� �ε�
select seq_test.nextval from dual;

select * from user_sequences;

-- �÷��� ���� �������� ��ȣ�� insert�� ��
create table use_seq(
num number(4),
name varchar2(15),
num2 char(10)
);

insert into use_seq(num, name, num2) values(seq_test.nextval, '�׽�Ʈ2', '');
-- �������� ������ �߻��Ѵٸ� ���� ��쿡�� ������ ��ȣ�� ����
select * from use_seq;

-- 10������1000000���� 10�� �����ϴ� ������ ����
-- ��, ��ȣ�� ��� ����ϸ� �ݺ��Ǿ���Ѵ�.
drop sequence seq_test2;
create sequence seq_test2
increment by 10
start with 10
maxvalue 1000000
cache 40
cycle;


select * from user_sequences;

--���� ��ȣ ���
select seq_test2.currval from dual;
-- ���� ��ȣ ���
select seq_test2.nextval from dual;

-- use_seq ���̺� �Ʒ��� ���� ���� �߰�
-- 0,'�����', 'S_00000001'
-- 0,'��Թ�', 'S_00000002'
-- 0,'�躸��', 'S_00000003'
-- ��ȣ�� ������ ���̷� 1�� �����ϴ� ������ �߰�
truncate table use_seq;
select * from use_seq;
insert into use_seq(num, name, num2) values(0, '�����', concat('S_', lpad(seq_test.nextval,8,0)));

-- use_seq���̺� num2 �÷��� pk�� ����
alter table use_seq add constraint pk_use_seq primary key(num2);
