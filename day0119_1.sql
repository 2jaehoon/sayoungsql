--사원 테이블에서 부서번호를 검색
select DEPTNO
from EMP
GROUP BY DEPTNO;



SELECT ENAME, EMPNO, COMM
FROM EMP;


-- 그룹으로 묶인 컬럼과 일반 컬럼이 함께 조회되면 레코드의 유효성 검증이
--될 수 없기 때문에 에러가 발생.
select DEPTNO, ENAME
from EMP
GROUP BY DEPTNO;


--부서 번호와 사원명이 같은 값이 없으므로 그룹으로 묶여지지 않는다.
select DEPTNO, ENAME
from EMP
GROUP BY DEPTNO, ENAME --그룹으로 묶이지 않는다.
ORDER BY DEPTNO;


--사원테이블에서 매니저 번호를 검색
--단 중복되는 매니저 번호는 출력하지 않는다.
--컬럼이 추가되면 중복값 제거되는 거 x
select distinct mgr
from emp;

--중복값이 없는 컬럼과 함께 사용되면 중복배제를 하지 않는다.
--사원테이블에서 매니저 번호와 사원명을 검색
select distinct mgr, ename
from emp;

--정렬----------------
--사원 테이블에서 사원번호, 사원명, 연봉을 검색
--단 연봉의 오름차순으로 정렬하여 출력할 것
--연봉이 같다면 사원명의 내림차순으로 정렬하여 출력할 것.
select empno, ename, sal
from emp
order by sal asc, ENAME desc;

--사원테이블에서 사원번호, 사원명, 입사일, 직무를 검색
--단, 입사일의 내림차순으로 정렬하여 출력할 것
-- 입사일이 같다면 사원번호의 내림차순으로 정렬하여 출력

select EMPNO, ENAME, HIREDATE, JOB
from emp
order by HIREDATE desc, empno desc;



------------문자열의 정렬은 자릿수에 정렬을 수행한다-------------------
CREATE TABLE TEST_ORDERBY(
 NUM VARCHAR2(10)

);


INSERT INTO TEST_ORDERBY VALUES('1');
INSERT INTO TEST_ORDERBY VALUES('101');
INSERT INTO TEST_ORDERBY VALUES('1001');
INSERT INTO TEST_ORDERBY VALUES('2');
INSERT INTO TEST_ORDERBY VALUES('3');
INSERT INTO TEST_ORDERBY VALUES('2001');
INSERT INTO TEST_ORDERBY VALUES('30');
INSERT INTO TEST_ORDERBY VALUES('309');
COMMIT;

select *
from TEST_ORDERBY
ORDER BY NUM;


--사원테이블에서 10번 부서와 30번 부서에 근무하는 사원들의 사원번호
--사원명, 연봉, 부서 번호 을 검색
--단, 연봉의 내림차순으로 출력할 것.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (10,30)
ORDER BY SAL DESC;

--사원 테이블에서 매니저번호를 조회
--단, 중복된 번호를 출력하지 않으며, 매니저 번호는 작은 순서부터 출력할 것
SELECT DISTINCT MGR
FROM EMP
WHERE MGR IS NOT NULL
ORDER BY MGR;

------------dual 테이블 사용
select *
from dual;

--select에 설정한 값으로 컬럼과 레코드를 생성하여 조회
select '김경태' name , '서울시 강남구 역삼동' house , 27 age
from dual;

--round
select round(555.555,-1)
from dual;

--사원 테이블에서 사원번호, 사원명 연봉, 월급을 조회
--단 월급은 연봉을 12나눈 값을 연산하여 보여주되 원단위가
select  EMPNO, ENAME, SAL, ROUND((SAL/12),-1) MONTHMONEY
from emp;

select  EMPNO, ENAME, SAL, (SAL/12) MONTHMONEY
from emp;


--올림
select ceil(10.1), ceil(10.9), ceil(10.0001)
from dual;

select trunc(555.55,-2)
from dual;



-----------문자열함수
select length('발표조는 4조 가위바위보는 조익상씨') length
from dual;

--사원테이블에서 사원번호, 사원명, 사원명의 글자 수 조회
select empno, ename, length(ename)
from emp;

--사원테이블에서 사원명이 5글자인 사원들의 사원명, 사원번호, 직무를 조회
select ename, empno, job
from emp
where length(ename)=5;

select upper('AbcdEf'), lower('AbcdEf')
from dual;

select *
from emp
where lower(ename) ='scott';


--첫글자를 대문자로 변환
select initcap('java'), initcap('oracALE'), initcap('java oracle jdbc html')
from dual;

--문자열의 인덱스 얻기
select instr('java', 'a'), instr('aaaajavabbbb', 'java'),
			 instr('oracle', 'j')
from dual;

--사원테이블에서 사원명에 'A'가 있는 사언의 사원명을 조회
select *
from emp
where instr(ename, 'A')!=0;




