--실행

select * from user_procedures;

--바인드 변수 선언
var r refcursor

-- 프로시저 실행 : golden에서는 실행과 동시에 조회결과
exec select_all_cp_emp( :r )