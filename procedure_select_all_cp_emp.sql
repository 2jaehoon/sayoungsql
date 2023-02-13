--Á¶È¸
create or replace procedure select_all_cp_emp(cur out SYS_REFCURSOR)
is


begin

	open cur for select deptno, empno, ename, job, sal, hiredate
	from cp_emp;

end;
/
