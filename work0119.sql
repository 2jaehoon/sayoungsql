
--1. 사원 테이블에서 '10‘번 부서가 아니면서 연봉이 1000이상 3000이하의
--모든 사원들의  사원번호,사원명, 입사일,부서번호, 연봉을 조회하세요.
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from EMP
where DEPTNO!=10 and (sal between 1000 and 3000);

--2. 사원 테이블에서 보너스를 수령하는 사원들의  사원번호,사원명,
--    연봉,보너스, 총 수령액, 월급을 조회 하세요.
--    - 월급은 연봉을 12개월로 나눠 연산합니다. 총수령액은 월급과 보너스를 합산한 금액입니다.
select EMPNO, ENAME, SAL, COMM, (SAL+COMM) TOTALMONEY, (SAL/12) YEARMONEY
from emp
where comm is not null;

--3.  사원 테이블에서 부서번호가 10,30인  사원들의 사원명, 사원번호,  연봉을 조회 하세요.
--    -단, 출력은  “xxxx번 xxxx사원님 연봉은 xxx$입니다. “
--        의 형식으로 하고, inline view의 컬럼명은 OutPut 으로 설정할 것.
select EMPNO||'번'||ENAME||'사원님 연봉은'||SAL||'$입니다' "OutPut"
from EMP
where DEPTNO IN (10, 30);

--4. 사원 테이블에서 연봉이 3000 미만인 사원들의 사원번호, 사원명,
--   입사일, 연봉,직무, 부서번호를 조회 하세요.
--    단, 연봉의 오름차순으로 정렬할 것, 동일 연봉이 있다면 사원명의 내림차순으로 정렬할 것.
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from EMP
where SAL<3000
ORDER BY SAL, ENAME DESC;

--5. 아래의 데이터를 참조하여 test_like2 테이블을 생성하고  레코드를 추가할 것.
--   컬럼명 : 번호, 이름, 주소, 출신고등하교
--    1, 기임저엉은,서울시 동작구 상도동,정기고
--    2, 정대만,경기도 부천시 원미구,썸타고
--    3, 송태섭,서울시 동대문구 동대문2동,정기고
--    4, 김경태,서울시 동작구 상도동,오지고
--    5, 윤상준,서울시 동작구 동대문4동,지리고
CREATE TABLE test_like2(
NUM CHAR(1),
NAME VARCHAR(15),
ADDR VARCHAR(39),
HIGHSCHOOL CHAR(9)
);
commit;
select * from TEST_LIKE2;



insert into test_like2(num, name,addr, highschool) values(1, '기임저엉은','서울시 동작구 상도동','정기고');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(2, '정대만','경기도 부천시 원미구','썸타고');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(3, '송태섭','서울시 동대문구 동대문2동','정기고');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(4, '김경태','서울시 동작구 상도동','오지고');
COMMIT;
insert into test_like2(num, name,addr, highschool) values(5, '윤상준','서울시 동작구 동대문4동','지리고');
COMMIT;
--6. test_like2 테이블에서 '서울시'에 거주하며 이름이 3글자인 학생의  번호, 학생명,  주소, 학교정보를 아래와  같은 형식으로 출력하세요.
--   컬럼명은 대소문자 구분하여 OutPut으로  할것.
--    출력형식 :  번호 : x, 이름 : xx, 주소 : xx, 학교 : xx
select NUM, NAME, ADDR, HIGHSCHOOL
from test_like2
where addr like '서울시%' and name like '___';


--6,7번은 like말고 문자열 함수로도 한번 풀어보세요
select NUM, NAME, ADDR, HIGHSCHOOL
from test_like2
where instr(addr,'서울시')!=0 and length(name)=3;



select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where length(ename)=4 or sal>=3000;

--7. 사원테이블에서 사원명이 4글자이거나 연봉이 3000이상인 사원의
--   사원번호, 사원명, 연봉, 입사일, 부서번호, 직무를 조회 할 것.
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where ename like '____' or sal>=3000;

--8. 사원 테이블에서 사원번호, 사원명, 입사일, 연봉, 내년연봉을 조회 하세요.
--    내년 연봉은 현재 연봉보다 7% 향상된 금액으로 계산하여 출력할 것.

select EMPNO, ENAME, HIREDATE, SAL, (sal*1.07) nextyearsal
from emp;



--9. 사원 테이블에서 사원명이 'A'로 시작하면서 연봉이 1600이상인
--     사원의 사원명,연봉,직무, 매니저번호, 입사일을 조회 할 것.
--  단, 입사일이 가장 최근인 사원부터 출력할 것.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600
order by HIREDATE desc;



