--������ ����
--���ڵ� �߰�

savepoint insert_job;
insert into test1(name, age) values('�ݵ���',999);

-- ���ڵ� ����
savepoint update_job;
update test1
set   name='������'
where name='�ݵ���';

commit;


--���� �۾� ���          , DEPT
rollback to insert_job; --update_job �������� �������.
--rollback to update_job --insert_job �ѹ� ���Ŀ��� update_job ���������� �ٽ� ���ư� �� ����.


select * from TEST1 ;

/*
select �÷���,,,
from ���̺��, EMP
*/


--�μ����̺��� ��� �μ��� �μ���ȣ, �μ��� ����
select deptno, dname
from dept;

--��� ���̺��� �����, �����ȣ, ����, ���� �˻�
select ename, EMPNO, JOB, SAL
from emp;

--�÷����� null�̸� �˻����� �ʴ´�.
--��� ���̺��� �����ȣ, �����, ����, ���ʽ� �˻�
select EMPNO, ENAME, SAL, COMM
from emp
where comm is not null;


--��ȸ �÷����� �������� ���
--test1���̺��� �̸�, ����, ���⳪�̸� �˻�
select name, age,(age+1)as nextage
 from TEST1;

 --��� ���̺��� �����ȣ, �����, ����, �����ʽ�, �� ���ɾ�
 -- �� ���ɾ��� ������ ���ʽ��� �ջ��� �ݾ����� �����Ͽ� �˻��Ѵ�.
 --null�� �÷��� ����Ǹ� ������ ����� null�� ���´�.
 select EMPNO, ENAME, SAL, COMM, (sal+nvl(comm,0))as totalmoney
 from emp;

 --��� ���̺��� �����, ����, �Ի���, ����, ������ �˻�
 -- �� ������ ������ 3.3���η� �����Ͽ� �����ش�.
 select ENAME, JOB, HIREDATE, SAL, (sal*0.033)as yearmoney
 from emp;



 --��ȸ �÷��� �ٿ��� �������� �˻� ||�����ڸ� ���
 --test1 ���̺���  ����Ͽ� "XX�� ���̴� XX��" �˻�

 select name||'�� ���̴�'AS NAME,age||'�� �Դϴ�.'as age
 from test1;

 --������̺��� xxx�� ������ xx$�̰� ������ xx$�Դϴ�.
 --�� ������ ������ 12�� ������ �������� ���
 select ENAME||'��'||'������'||SAL||'$�̰�'||'������'||(sal/12)||'$�Դϴ�.'as salprint
 from emp;


 --��������ڰ� �ƴ� �ٸ� �����ڴ� ��ȸ �÷��� ����� �� ����.
 select ename, sal
 from emp
 where sal>1000;

 select * from STUDENT;






















