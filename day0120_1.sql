--문자열 합치기

select '안녕'||'하세요', concat('안녕', '하세요')
from dual;

--사원테이블에서 사원명, 사원 번호를 하나의 컬럼으로 조회
select concat(ename, empno)
from emp;

--trim, ltrim, rtrim

select '['||trim('   A BC   ')||']',
				'['||Ltrim('   A BC   ')||']',
				'['||RTrim('   A BC   ')||']'
from dual;

--TRIM은 문자열 앞 뒤에 특정문자가 나오면 자를 수 있다.
--사용법
--TRIM('자를 문자열' FROM '문자열')

SELECT TRIM('A' FROM 'AAAAAAAORACLEAAAAAA')
FROM DUAL;

--replace : 문자열 바꾸기
select replace('ABCDE','BCD','bcd'), replace('Java', 'a', 'kkk'),
			replace('오늘은 토요일,일요일 입니다.','토요일,일요일','퇼')
from dual;


--사원테이블에서 사원명을 조회
--단 사원명에 'A'가 있는 사원은 소문자 'a'로 출력할 것
select replace(ename,'A','a')
from emp;

-- lpad : 문자열 앞에 문자 채우기
select lpad('ABCDE', 7, '#'),LPAD('ABCDE', 10, '$%'),
				lpad('ABCDE', 10, '가')
FROM DUAL;


--rpad : 문자열 뒤에(오른쪽) 문자 채우기
  select rpad('ABCDE', 12, 'a'),rpad('ABCDE', 10, '$%'),
				rpad('ABCDE', 10, '가')
FROM DUAL;

--사원테이블에서 사원명 조회
--단, 사원명이 10자가 아닌 경우 앞에 0을 붙여서 SIST_000000WARD의
--형식으로 출력헤보세요
select concat('SIST_',lpad(ename,10,0))
from emp;

select lpad(ename, 15, 'SIST_000000')
from emp;


--null 추가
create table test_null(
	num number,
	name varchar2(30),
	input_date date
);

--number데이터형에 null추가 insert할 때 컬럼을 생략하면 null 입력
insert into test_null(name, input_date) values('테스트', sysdate);
commit;

select * from TEST_NULL;

--date데이터형에 null추가 insert할 때 컬럼을 생략하면 null 입력
insert into test_null(num, name) values(1,'김경태');
commit;

--varchar2 데이터형에 null추가 insert할 때 컬럼을 생략하면 null 입력
insert into test_null(num, input_date) values(2,sysdate);
commit;


--varchar2 데이터형에 null추가 insert할 때 컬럼을 명시하고 ''입력하면 null입력
insert into test_null(NUM, NAME, INPUT_DATE) values(3,'',sysdate);
commit;

--null변환 함수
--nvl(컬럼명, null일 때 보여줄 값)
--null일 때 보여줄 값의 데이터형은 컬럼의 데이터형과 일치해야 한다.

--test_null테이블에서 번호, 이름, 입력일 조회
--단, 번호가 없다면 0을 이름이 없다면 '익명' 날짜가 없다면 현재 조회 쿼리문이
--실행된 날짜로 검색할 것
select nvl(NUM,0) num,nvl(name,'익명') NAME, nvl(INPUT_DATE, sysdate) INPUT_DATE
from TEST_NULL;

--error : 컬럼명과 데이터가 다르면 에러
--number는 숫자형태의 문자열을 넣을 수 있다. 문자열을 넣을 수는 없다.
select nvl(num, '100')    /*error nvl(num, '100번')*/
from test_null;

select nvl(name,'0번')
from TEST_NULL;

--사원테이블에서 사원번호, 사원명, 연봉, 보너스, 총수령액을 조회하세요
--단, 총 수령액은 연봉과 보너스를 합산한 금액으로 연산
select EMPNO, ENAME, SAL, nvl(COMM,0) comm, (sal+nvl(comm,0)) totalnumber
from emp;


--nvl2
--test_null테이블에서 이름을 검색
--단 이름이 있다면 '있음', '없다면 null이면 '없음'으로 조회
select nvl2(name, name||'있음', name||'없음')
from test_null;

--사원 테이블에서 사원 번호, 사원명, 연봉, 보너스, 총 수령액
--단, 보너스가 있는 사원은 보너스를 그대로 적용하고,
--보너스가 없는 사원은 연봉의 10프로 보너스를 연산하여 총수령액을 계산
select EMPNO, ENAME, SAL, nvl2(COMM, comm, sal*0.1) Bonus, sal+nvl2(COMM, comm, sal*0.1) totalmoney
from emp;
