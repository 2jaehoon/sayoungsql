insert into cp_emp3 (select empno, ename, deptno, job, sal from emp);


--select �ܼ��� subquery


--emp���̺��� ������� 'KING'�� ����� �μ���ȣ�� ��ȸ�Ͽ� CP_EMP3 ���̺���
--���� �μ� ��� ������ ��ȸ
SELECT *
FROM CP_EMP3
WHERE DEPTNO =(SELECT DEPTNO
FROM EMP
WHERE ENAME = 'KING');


--EMP���̺��� ��տ������� ���� �޴� ����� �����ȣ, �����, ������ �˻��ϼ���
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < (SELECT AVG(SAL) FROM EMP);



select * from CP_EMP3;
