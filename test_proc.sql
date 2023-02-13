--숫자 두 개를 입력(in parameter) 받아서 연산하고 out parameter에
-- 저장하는 procedure

-- procedure는 반환형이 없고, out parameter를 사용하여 반환
-- 1. 선언
create or replace procedure test_proc(num in number, num2 number,
result out number)
is

begin

 result := num + num2;
end;
/


--2. 저장
--3. 컴파일 :  sql>@파일명.sql  골든에서 f5를 누르면 컴파일됨
--4. 바인드 변수 선언( out parameter의 값을 저장하기 위한 변수 )
-- var 변수명 데이터형(크기)
--5. 직접 실행(실행기 : exec, execute)
--sql>exec 프로시저명(값, ..., :바인드 변수명,...)
--6. 바인드 변수의 값 출력
--print 바인드 변수명

