select * from user_procedures;

--바인드 변수 선언
var cur REFCURSOR

-- 프로시저 실행
exec select_cp_emp_deptno(50, :cur);
