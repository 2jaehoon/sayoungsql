
--1. ��� ���̺��� '10���� �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
--��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from EMP
where DEPTNO!=10 and (sal between 1000 and 3000);

--2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
--    ����,���ʽ�, �� ���ɾ�, ������ ��ȸ �ϼ���.
--    - ������ ������ 12������ ���� �����մϴ�. �Ѽ��ɾ��� ���ް� ���ʽ��� �ջ��� �ݾ��Դϴ�.
select EMPNO, ENAME, SAL, COMM, (SAL+COMM) TOTALMONEY, (SAL/12) YEARMONEY
from emp
where comm is not null;

--3.  ��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ,  ������ ��ȸ �ϼ���.
--    -��, �����  ��xxxx�� xxxx����� ������ xxx$�Դϴ�. ��
--        �� �������� �ϰ�, inline view�� �÷����� OutPut ���� ������ ��.
select EMPNO||'��'||ENAME||'����� ������'||SAL||'$�Դϴ�' "OutPut"
from EMP
where DEPTNO IN (10, 30);

--4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
--   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
--    ��, ������ ������������ ������ ��, ���� ������ �ִٸ� ������� ������������ ������ ��.
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from EMP
where SAL<3000
ORDER BY SAL, ENAME DESC;

--5. �Ʒ��� �����͸� �����Ͽ� test_like2 ���̺��� �����ϰ�  ���ڵ带 �߰��� ��.
--   �÷��� : ��ȣ, �̸�, �ּ�, ��Ű���ϱ�
--    1, ����������,����� ���۱� �󵵵�,�����
--    2, ���븸,��⵵ ��õ�� ���̱�,��Ÿ��
--    3, ���¼�,����� ���빮�� ���빮2��,�����
--    4, �����,����� ���۱� �󵵵�,������
--    5, ������,����� ���۱� ���빮4��,������
CREATE TABLE test_like2(
NUM CHAR(1),
NAME VARCHAR(15),
ADDR VARCHAR(39),
HIGHSCHOOL CHAR(9)
);
commit;
select * from TEST_LIKE2;



insert into test_like2(num, name,addr, highschool) values(1, '����������','����� ���۱� �󵵵�','�����');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(2, '���븸','��⵵ ��õ�� ���̱�','��Ÿ��');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(3, '���¼�','����� ���빮�� ���빮2��','�����');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(4, '�����','����� ���۱� �󵵵�','������');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(5, '������','����� ���۱� ���빮4��','������');
COMMIT;
--6. test_like2 ���̺��� '�����'�� �����ϸ� �̸��� 3������ �л���  ��ȣ, �л���,  �ּ�, �б������� �Ʒ���  ���� �������� ����ϼ���.
--   �÷����� ��ҹ��� �����Ͽ� OutPut����  �Ұ�.
--    ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
select NUM, NAME, ADDR, HIGHSCHOOL
from test_like2
where addr like '�����%' and name like '___';


--6,7���� like���� ���ڿ� �Լ��ε� �ѹ� Ǯ�����
select NUM, NAME, ADDR, HIGHSCHOOL
from test_like2
where instr(addr,'�����')!=0 and length(name)=3;



select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where length(ename)=4 or sal>=3000;

--7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
--   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ �� ��.
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where ename like '____' or sal>=3000;

--8. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬���� ��ȸ �ϼ���.
--    ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����� ��.

select EMPNO, ENAME, HIREDATE, SAL, (sal*1.07) nextyearsal
from emp;



--9. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
--     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �� ��.
--  ��, �Ի����� ���� �ֱ��� ������� ����� ��.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600
order by HIREDATE desc;



