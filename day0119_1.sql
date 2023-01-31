--��� ���̺��� �μ���ȣ�� �˻�
select DEPTNO
from EMP
GROUP BY DEPTNO;



SELECT ENAME, EMPNO, COMM
FROM EMP;


-- �׷����� ���� �÷��� �Ϲ� �÷��� �Բ� ��ȸ�Ǹ� ���ڵ��� ��ȿ�� ������
--�� �� ���� ������ ������ �߻�.
select DEPTNO, ENAME
from EMP
GROUP BY DEPTNO;


--�μ� ��ȣ�� ������� ���� ���� �����Ƿ� �׷����� �������� �ʴ´�.
select DEPTNO, ENAME
from EMP
GROUP BY DEPTNO, ENAME --�׷����� ������ �ʴ´�.
ORDER BY DEPTNO;


--������̺��� �Ŵ��� ��ȣ�� �˻�
--�� �ߺ��Ǵ� �Ŵ��� ��ȣ�� ������� �ʴ´�.
--�÷��� �߰��Ǹ� �ߺ��� ���ŵǴ� �� x
select distinct mgr
from emp;

--�ߺ����� ���� �÷��� �Բ� ���Ǹ� �ߺ������� ���� �ʴ´�.
--������̺��� �Ŵ��� ��ȣ�� ������� �˻�
select distinct mgr, ename
from emp;

--����----------------
--��� ���̺��� �����ȣ, �����, ������ �˻�
--�� ������ ������������ �����Ͽ� ����� ��
--������ ���ٸ� ������� ������������ �����Ͽ� ����� ��.
select empno, ename, sal
from emp
order by sal asc, ENAME desc;

--������̺��� �����ȣ, �����, �Ի���, ������ �˻�
--��, �Ի����� ������������ �����Ͽ� ����� ��
-- �Ի����� ���ٸ� �����ȣ�� ������������ �����Ͽ� ���

select EMPNO, ENAME, HIREDATE, JOB
from emp
order by HIREDATE desc, empno desc;



------------���ڿ��� ������ �ڸ����� ������ �����Ѵ�-------------------
CREATE TABLE TEST_ORDERBY(
 NUM VARCHAR2(10)

);


INSERT INTO TEST_ORDERBY VALUES('1');
INSERT INTO TEST_ORDERBY VALUES('101');
INSERT INTO TEST_ORDERBY VALUES('1001');
INSERT INTO TEST_ORDERBY VALUES('2');
INSERT INTO TEST_ORDERBY VALUES('3');
INSERT INTO TEST_ORDERBY VALUES('2001');
INSERT INTO TEST_ORDERBY VALUES('30');
INSERT INTO TEST_ORDERBY VALUES('309');
COMMIT;

select *
from TEST_ORDERBY
ORDER BY NUM;


--������̺��� 10�� �μ��� 30�� �μ��� �ٹ��ϴ� ������� �����ȣ
--�����, ����, �μ� ��ȣ �� �˻�
--��, ������ ������������ ����� ��.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (10,30)
ORDER BY SAL DESC;

--��� ���̺��� �Ŵ�����ȣ�� ��ȸ
--��, �ߺ��� ��ȣ�� ������� ������, �Ŵ��� ��ȣ�� ���� �������� ����� ��
SELECT DISTINCT MGR
FROM EMP
WHERE MGR IS NOT NULL
ORDER BY MGR;

------------dual ���̺� ���
select *
from dual;

--select�� ������ ������ �÷��� ���ڵ带 �����Ͽ� ��ȸ
select '�����' name , '����� ������ ���ﵿ' house , 27 age
from dual;

--round
select round(555.555,-1)
from dual;

--��� ���̺��� �����ȣ, ����� ����, ������ ��ȸ
--�� ������ ������ 12���� ���� �����Ͽ� �����ֵ� ��������
select  EMPNO, ENAME, SAL, ROUND((SAL/12),-1) MONTHMONEY
from emp;

select  EMPNO, ENAME, SAL, (SAL/12) MONTHMONEY
from emp;


--�ø�
select ceil(10.1), ceil(10.9), ceil(10.0001)
from dual;

select trunc(555.55,-2)
from dual;



-----------���ڿ��Լ�
select length('��ǥ���� 4�� ������������ ���ͻ�') length
from dual;

--������̺��� �����ȣ, �����, ������� ���� �� ��ȸ
select empno, ename, length(ename)
from emp;

--������̺��� ������� 5������ ������� �����, �����ȣ, ������ ��ȸ
select ename, empno, job
from emp
where length(ename)=5;

select upper('AbcdEf'), lower('AbcdEf')
from dual;

select *
from emp
where lower(ename) ='scott';


--ù���ڸ� �빮�ڷ� ��ȯ
select initcap('java'), initcap('oracALE'), initcap('java oracle jdbc html')
from dual;

--���ڿ��� �ε��� ���
select instr('java', 'a'), instr('aaaajavabbbb', 'java'),
			 instr('oracle', 'j')
from dual;

--������̺��� ����� 'A'�� �ִ� ����� ������� ��ȸ
select *
from emp
where instr(ename, 'A')!=0;




