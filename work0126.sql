
select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;
--1.�������̺��� �����ɼǿ� ��ABS���� ���ԵǾ��ִ� ��� ������ �𵨸�, ����,�ɼ�,
--  �̹���, �Է���,������ ��ȸ �ϼ���.
--  ��, ����� ������ ������������ ���� ���� �� 4~8��° ���ڵ常 ��ȸ�ϼ���.
--    �Է����� ����-��-�� �б⡱�� �������� ����մϴ�.
select MODEL, CAR_YEAR, CAR_OPTION, CAR_IMG, input_day, price
from (select MODEL, CAR_YEAR, CAR_OPTION, CAR_IMG, row_number() over(order by price desc) rnum,
			PRICE, to_char(sysdate,'mm-dd-yyyy q"�б�"') input_day
			from car_model
--			where car_option like '%ABS%')  --like ��   instr �� �����غ�����
			where instr(upper(car_option), 'ABS')>0)
where rnum between 4 and 8;


rollback;
--2.�Ʒ��� �����͸� �Է� �� �� �ִ� ���̺��� �����ϰ�, �����ϴٰ� �ǴܵǴ� �÷���
-- primary key��  �ο��ϼ���.
-- -- ���̺����, �÷�����(�ּ����� ó��)  2������ �ۼ�.
--�����Ǵ� ���̺��� ��ȣ, ���̵�, �̸�, ����, �μ���ȣ, ��ȭ��ȣ, �����ȣ, �ּҸ�  ������ �� �ֽ��ϴ�.
create table work(
num varchar2(15),   -- constraint pk_work primary key, �÷������� �÷��ϳ����� �ο�����
id varchar2(30),   -- ���� ���� ���� �ÿ��� ���̺� ������ ó��
name varchar2(30),
age number(3),
deptnum varchar2(20),
phonenum varchar2(15),
addressnum varchar2(30),
address varchar2(100),
constraint pk_work primary key(num, id)
);

commit;

--3.���� ���̺��� ����Ͽ� ��������� �����ϴ� ������ ��������� �������� �ʴ�
--��� ������ ����� ������.
select * from WORK;

--ù ����
 insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(1,'��', '�蹫��',25,25,'010-1234-5678','365-626','û�ֿ� ����');
COMMIT;
 --������� ����
--�����Ǵ� �� �⺻Ű�� ����ִ� �÷��� ����� �ƿ� �ϳ��� �ߺ��� �ȵǴ� ���
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(2,'��', '�ڹ̻�',27,24,'010-2424-7678','645-621','���￪');
COMMIT;
-- �⺻Ű�� ����ִ� �÷��� ������ 2�� �̻��� �� �÷��� ���� �ϳ� �̻� �ٸ� ���
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'��', '�̴ް�',22,21,'010-1616-1278','151-123','��� ������ ��');
COMMIT;
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'�Ǿ�', '�̾Ǿ�',122,71,'010-5256-1278','521-123','��� ������');
COMMIT;

--������� ����X
--�ߺ��� ����־

insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'��', '���ߺ�',56,31,'010-1355-1154','263-123','õ��');
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(2,'��', '���ߺ�',57,32,'010-8215-6521','166-123','����');
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(1,'��', '���ߺ�',58,33,'010-1744-7826','821-123','���� ���?');

