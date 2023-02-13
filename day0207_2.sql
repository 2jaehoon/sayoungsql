select * from user_procedures;

drop procedure test_proc;

--4. 바인드 변수 선언( out parameter의 값을 저장하기 위한 변수 )
-- var 변수명 데이터형(크기)
--
var num number;
var name varchar2(20);
var
--5. 직접 실행(실행기 : exec, execute)
--sql>exec 프로시저명(값, ..., :바인드 변수명,...)
execute test_proc(2,7, : name);
--6. 바인드 변수의 값 출력
--print 바인드 변수명
print num;
