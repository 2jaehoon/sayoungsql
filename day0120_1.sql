--���ڿ� ��ġ��

select '�ȳ�'||'�ϼ���', concat('�ȳ�', '�ϼ���')
from dual;

--������̺��� �����, ��� ��ȣ�� �ϳ��� �÷����� ��ȸ
select concat(ename, empno)
from emp;

--trim, ltrim, rtrim

select '['||trim('   A BC   ')||']',
				'['||Ltrim('   A BC   ')||']',
				'['||RTrim('   A BC   ')||']'
from dual;

--TRIM�� ���ڿ� �� �ڿ� Ư�����ڰ� ������ �ڸ� �� �ִ�.
--����
--TRIM('�ڸ� ���ڿ�' FROM '���ڿ�')

SELECT TRIM('A' FROM 'AAAAAAAORACLEAAAAAA')
FROM DUAL;

--replace : ���ڿ� �ٲٱ�
select replace('ABCDE','BCD','bcd'), replace('Java', 'a', 'kkk'),
			replace('������ �����,�Ͽ��� �Դϴ�.','�����,�Ͽ���','�p')
from dual;


--������̺��� ������� ��ȸ
--�� ����� 'A'�� �ִ� ����� �ҹ��� 'a'�� ����� ��
select replace(ename,'A','a')
from emp;

-- lpad : ���ڿ� �տ� ���� ä���
select lpad('ABCDE', 7, '#'),LPAD('ABCDE', 10, '$%'),
				lpad('ABCDE', 10, '��')
FROM DUAL;


--rpad : ���ڿ� �ڿ�(������) ���� ä���
  select rpad('ABCDE', 12, 'a'),rpad('ABCDE', 10, '$%'),
				rpad('ABCDE', 10, '��')
FROM DUAL;

--������̺��� ����� ��ȸ
--��, ������� 10�ڰ� �ƴ� ��� �տ� 0�� �ٿ��� SIST_000000WARD��
--�������� ����캸����
select concat('SIST_',lpad(ename,10,0))
from emp;

select lpad(ename, 15, 'SIST_000000')
from emp;


--null �߰�
create table test_null(
	num number,
	name varchar2(30),
	input_date date
);

--number���������� null�߰� insert�� �� �÷��� �����ϸ� null �Է�
insert into test_null(name, input_date) values('�׽�Ʈ', sysdate);
commit;

select * from TEST_NULL;

--date���������� null�߰� insert�� �� �÷��� �����ϸ� null �Է�
insert into test_null(num, name) values(1,'�����');
commit;

--varchar2 ���������� null�߰� insert�� �� �÷��� �����ϸ� null �Է�
insert into test_null(num, input_date) values(2,sysdate);
commit;


--varchar2 ���������� null�߰� insert�� �� �÷��� ����ϰ� ''�Է��ϸ� null�Է�
insert into test_null(NUM, NAME, INPUT_DATE) values(3,'',sysdate);
commit;

--null��ȯ �Լ�
--nvl(�÷���, null�� �� ������ ��)
--null�� �� ������ ���� ���������� �÷��� ���������� ��ġ�ؾ� �Ѵ�.

--test_null���̺��� ��ȣ, �̸�, �Է��� ��ȸ
--��, ��ȣ�� ���ٸ� 0�� �̸��� ���ٸ� '�͸�' ��¥�� ���ٸ� ���� ��ȸ ��������
--����� ��¥�� �˻��� ��
select nvl(NUM,0) num,nvl(name,'�͸�') NAME, nvl(INPUT_DATE, sysdate) INPUT_DATE
from TEST_NULL;

--error : �÷���� �����Ͱ� �ٸ��� ����
--number�� ���������� ���ڿ��� ���� �� �ִ�. ���ڿ��� ���� ���� ����.
select nvl(num, '100')    /*error nvl(num, '100��')*/
from test_null;

select nvl(name,'0��')
from TEST_NULL;

--������̺��� �����ȣ, �����, ����, ���ʽ�, �Ѽ��ɾ��� ��ȸ�ϼ���
--��, �� ���ɾ��� ������ ���ʽ��� �ջ��� �ݾ����� ����
select EMPNO, ENAME, SAL, nvl(COMM,0) comm, (sal+nvl(comm,0)) totalnumber
from emp;


--nvl2
--test_null���̺��� �̸��� �˻�
--�� �̸��� �ִٸ� '����', '���ٸ� null�̸� '����'���� ��ȸ
select nvl2(name, name||'����', name||'����')
from test_null;

--��� ���̺��� ��� ��ȣ, �����, ����, ���ʽ�, �� ���ɾ�
--��, ���ʽ��� �ִ� ����� ���ʽ��� �״�� �����ϰ�,
--���ʽ��� ���� ����� ������ 10���� ���ʽ��� �����Ͽ� �Ѽ��ɾ��� ���
select EMPNO, ENAME, SAL, nvl2(COMM, comm, sal*0.1) Bonus, sal+nvl2(COMM, comm, sal*0.1) totalmoney
from emp;
