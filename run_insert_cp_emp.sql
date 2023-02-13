select * from user_procedures;

--4. 바인드 변수 선언
var r number
var m varchar2(100)

--5. 프로시저의 직접실행
exec insert_cp_emp(1111, '윤상준', '개발자',3000, 20, :r, :m);

--6. bind 변수에 입력된 값 확인
 print r
 print m;


select * from CP_EMP;

var;
