-- �μ���ȣ�� �Է¹޾� �μ��� �ش��ϴ� ��� ��ȸ
create or replace procedure select_cp_emp_deptno( deptno in number,
cur out sys_refcursor)
is
	 dno number := deptno;
begin

		if deptno not in (10,20,30,40) then
		dno := 10;
		end if;

		open cur for
			select EMPNO,ENAME, JOB, SAL, HIREDATE, DEPTNO
			FROM cp_emp
			where deptno = dno;

end;
/