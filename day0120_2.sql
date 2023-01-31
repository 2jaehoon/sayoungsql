-- decode : ���� �Լ�

--�μ� ���̺��� �μ���ȣ, �μ���, �ѱ� �μ����� ��ȸ
--��, �ѱ� �μ����� �μ���ȣ�� 10���̶�� SI���ߺ�, 20���̶�� SM����������
--30���̶�� ������, �׷��� �ʴٸ� �౸�η� ��ȸ

select DEPTNO, DNAME, decode(deptno, 10, 'SI���ߺ�',20, 'SM����������',30, '������','�౸��') hangul_dname
from dept;

--������̺��� �����ȣ, �����, ����, �ѱ������� ��ȸ
--��, �ѱ� ������ saleman ���� manager-����, analyst �м���, president �θ��, �� �ܴ� ������� ����
select EMPNO, ENAME, JOB, decode(job,'SALESMAN', '����','MANAGER', '����','ANALYST', '�м���' ,'PRESIDENT', '�θ��','���') korean_job
from EMP;
																																							f
--case
--������̺��� �����ȣ, �����, ����, �μ���ȣ, �μ����� ��ȸ�ϼ���
-- ��, �μ����� �μ���ȣ�� ���� 10���̸� SI, 20 - SM �� �� solution�� �����Ͽ� �˻�
select EMPNO, ENAME, JOB, DEPTNO,
					case deptno when 10 then 'SI���ߺμ�'
											when 20 then 'SM���������μ�'
											else
											'solution'
					end h_dname
from emp;

--��� ���̺��� �����ȣ, �����, ����, �μ��� ���ʽ��� �˻�
--��, �μ��� ���ʽ��� 10�� �μ��� ������ 10%, 20�� �μ��� ������ 20%
--�� �ܿ��� ������ 50%�� �����Ͽ� ���
select EMPNO, ENAME, SAL,deptno,
 sal*  case deptno when 10 then 0.1
						when 20 then 0.2
						else
						0.5
						end bonus,
						sal*decode(deptno,10,0.1, 20,0.2, 0.5) bonus2
from emp
order by deptno;



	--�ڸ����� ���� ������ �տ� ������ ����.
--������ ���Ϻ��� ���� ũ�� #�� ��µȴ�.
select to_char(20232023, '9,999'), to_char(2023, '0,000,000'),to_char(2023, '0,000,000.00'),
to_char(2023.2023,'9,999,999,999.99')
from dual;

--������̺��� �����ȣ �����, ������ ��ȸ
--�� ������ 3�ڸ����� ,�� �ְ� �ڿ�$�� �ٿ��� ��ȸ
select EMPNO, ENAME, to_char(SAL,'999,999,999')||'$' sal
from emp;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24(am hh)-mi-ss dy"��°��"') ,
								to_char(sysdate, 'day q"�б�"')
from dual;



--������̺��� �����ȣ, �����, �Ի��ȣ�� ��ȸ
--�� , �Ի����� ��-��-�� �б��� �������� ����� ��
--�ʹ� ��� ���� �߻�
select EMPNO, ENAME, HIREDATE, to_char(hiredate, 'mm-dd-yyyy')
from emp;

--������̺��� �Ի�⵵�� 1981���� ����� �����ȣ, �����, ����, �Ի����� ��ȸ
select  EMPNO, ENAME, JOB, HIREDATE
from emp
where to_char(hiredate,'yyyy')=1981;

--substr
select substr('ABCDEFG',3,4), substr('ABCDEFG',2,1)
from dual;


alter table test_null add emain varchar2(50) default 'test@test.com';
commit;

update TEST_NULL
set emain='testmain@naver.co.kr'
 where num=2;
 commit;

 insert into TEST_NULL(emain) values('kim@testcom');

select * from TEST_NULL;

--test_null ���̺��� email�ּҿ� ������ �ּҸ� �� �˻��Ͻÿ�
--����,�̸����� ��ȿ�� ���ϸ� �˻��� ��
select EMAIN, substr(emain,1, instr(emain,'@')-1),substr(emain,instr(emain,'@')+1)
from TEST_NULL
where emain is not null and instr(emain,'@')!=0 and instr(emain,'.')!=0;



--data�÷��� ��¥ ������ ���ڿ��� �߰��� �� �ִ�.
--�ð������� ���� ��ſ�
insert into test_null(input_date) values('2022-12-25');
commit;

--to_date ���
insert into test_null(input_date) values(to_date('2022-12-25','yyyy--mm--dd'));

--���������� ������ �Լ��� ��¥������ ���ڿ��� ������ error�߻�

select to_char('2023-01-19', 'dd')
from dual;


select to_char(to_date('2023-01-19'), 'dd')
from dual;


