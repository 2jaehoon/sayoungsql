create or replace procedure insert_cp_emp(empno in number, ename varchar2,
job varchar2, sal number, deptno number, row_cnt out number, msg out varchar2)
is

	-- 변수 선언
	cnt number(1) := 0;

begin
	
	row_cnt := 0;
	
	insert into cp_emp(empno, ename, job, sal, deptno,  hiredate)
	values(empno, ename, job, sal, deptno, sysdate);

	--sql : 암시적커서: 쿼리문이 실행되면 생성되는 암시적커서
	--쿼리문이 실행된 행 수를 알 수 있다.
	cnt := sql%rowcount;
	if cnt = 1 then
	msg := empno||'번 사원 정보 입력 성공';
	commit;
	end if;
		row_cnt := cnt;
	exception
	when DUP_VAL_ON_INDEX then
	msg := '앗!! 중복키가 있습니다.';
	when others then
	msg := '알 수 없는 예외';


end;
/
