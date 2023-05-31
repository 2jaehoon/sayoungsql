create or replace procedure insert_cp_emp(empno in number, ename varchar2,
job varchar2, sal number, deptno number, row_cnt out number, msg out varchar2)
is

	-- ���� ����
	cnt number(1) := 0;

begin
	
	row_cnt := 0;
	
	insert into cp_emp(empno, ename, job, sal, deptno,  hiredate)
	values(empno, ename, job, sal, deptno, sysdate);

	--sql : �Ͻ���Ŀ��: �������� ����Ǹ� �����Ǵ� �Ͻ���Ŀ��
	--�������� ����� �� ���� �� �� �ִ�.
	cnt := sql%rowcount;
	if cnt = 1 then
	msg := empno||'�� ��� ���� �Է� ����';
	commit;
	end if;
		row_cnt := cnt;
	exception
	when DUP_VAL_ON_INDEX then
	msg := '��!! �ߺ�Ű�� �ֽ��ϴ�.';
	when others then
	msg := '�� �� ���� ����';


end;
/
