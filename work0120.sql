

--����
--1. ������̺��� �����ȣ, �����,����, �Ŵ�����ȣ,����,
--   �Ի����� ��ȸ�ϼ���.
-- ��, �Ի����� ����-��-�� ���ϡ��� �������� ����ϼ���.
--    ������ 3�ڸ����� ,�� �־� ����ϼ���.
select EMPNO, ENAME, JOB, MGR,
to_char(SAL,'9,999') sal, to_char(HIREDATE,'mm-dd-yyyy-day') hiredate
from emp;

--2. ������̺��� �μ���ȣ, �����ȣ, ����, ���ʽ�, �Ѽ��ɾ�, �Ǽ��ɾ�, ����
-- �Ի����� ��ȸ�ϼ���.
--   ��. �� ���ɾ��� '����+���ʽ�'�� �ջ��� �ݾ����� ��ȸ�ϼ���.
--       �� ���ɾ��� ������+���ʽ��� �ջ��� �ݾ׿��� 3.3%�� ������ �ݾס����� ��ȸ,
--     ������ ������ 12�� ���� ���� ������ �����Ͽ� ��ȸ�ϼ���.
select DEPTNO, EMPNO, SAL, COMM, (sal+nvl(comm,0)) totalmoney,
(sal+nvl(comm,0))-((sal+nvl(comm,0))*0.033) silmoney, round((sal/12)) monthmoney
from emp;

--3. �Ʒ��� �����͸� �����Ͽ� test1 ���̺��� �����ϰ�  ���ڵ带 �߰��� ��.
--   �÷��� : �̸�, ����, �¾��, �ֹι�ȣ
--     ��Թ�,25,1995,��950101-2234567��
--     �����,25,1995,��951126-1234567��
--     ��ΰ�,26,1994,��940101-2234567��
--     ����ȣ,26,1994,��940101-1234567��

create table test1(
name char(9),
age  number(2),
born number(4),
ssn char(14)
);

insert into test1(name, age, born, ssn) values('��Թ�',25,1995,'950101-2234567');
commit;
insert into test1(name, age, born, ssn) values('�����',25,1995,'951126-1234567');
commit;
insert into test1(name, age, born, ssn) values('��ΰ�',26,1994,'940101-2234567');
commit;
insert into test1(name, age, born, ssn) values('����ȣ',26,1994,'940101-1234567');
commit;
 select * from TEST1;

-- 4. test1 ���̺��� �̸� ,����, �¾ ��, �ֹι�ȣ,  ������ ��ȸ �ϼ���.
--   -������ �ֹι�ȣ��  8��° �ڸ��� ���ϰ�,
--   8��° �ڸ��� 1,3�̸� '����', 2,4�� '����' 5,6,7,8�̸� '�ܱ���'�׷���
--   ������ "����" �� ����Ѵ�.
select NAME, AGE, BORN, SSN,
case substr(ssn,8,1) when '1' then '����'
			when '3' then '����'
		 when '2' then '����'
    when '4' then ' ����'
    when '5' then ' �ܱ���'
    when '6' then ' �ܱ���'
    when '7' then ' �ܱ���'
    when '8' then ' �ܱ���'
    else '����'
   end sex
from test1;



--5.emp���̺��� ����Ͽ� �Ʒ��� ���� ��ȸ �ϼ���.
--  xxx�� Xxxx����� �Ի����� yyyy-mm-dd ���� �� �Դϴ�. ������ $xxx �Դϴ�.
-- ��. �Ի������ ��,ȭ,�� �Ի��� ����� ���ؼ��� ��ȸ�մϴ�.
--     ������� ù ���ڸ� �빮�ڷ� ��ȸ�ϰ�, �Ի����� �������� �����Ͽ� ����ϵ�
--     �Ի����� ���ٸ� ������ ������������ �����Ͽ� ����ϼ���.
--      ������ 3�ڸ����� ,�� �־ ����ϼ���.
	select EMPNO, INITCAP(ENAME) ename, HIREDATE, to_char(SAL,'9,999') sal
	from emp
	where to_char(hiredate,'dy')in('��','ȭ','��')
	order by hiredate, sal desc;





--6. dept���̺��� '��'�� ���� ������ �ִ� �μ��� �μ���ȣ, �μ����� ��ȸ�ϼ���. (nonsense)
select DEPTNO, DNAME, LOC
from dept
where loc like 'DAL%';
