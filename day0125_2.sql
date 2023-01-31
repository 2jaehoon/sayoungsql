--날짜에 + 연산을 사용하면 일자가 더해진다.
select sysdate, sysdate + 1, sysdate + 2, sysdate + 30
from dual;



--월 연산
select sysdate, add_months(sysdate, 1), add_months(sysdate, 2), add_months(sysdate, 12)
from dual;

--날짜 간의 개월 차이
select sysdate, months_between (sysdate, '2022-12-25')
, months_between (sysdate, '2022-12-26')
from dual;



--사원테이블에서 사원번호, 사원명, 입사일, 근속 개월 수를 조회
select EMPNO, ENAME, HIREDATE, trunc(months_between ( sysdate, hiredate ) , 0)
from emp;

create table test_date(
id varchar2( 20 ),
login_date date
);

insert into test_date(id, login_date) values('kim', sysdate);
insert into test_date(id, login_date) values('lee', sysdate-30);
insert into test_date(id, login_date) values('park', sysdate-32);
insert into test_date(id, login_date) values('test', sysdate-91);
insert into test_date(id, login_date) values('hong', sysdate-90);
insert into test_date(id, login_date) values('lee2', sysdate-100);
insert into test_date(id, login_date) values('kim3', sysdate-1);
insert into test_date(id, login_date) values('kim44', sysdate-101);


commit;
select * from TEST_DATE;

-- test_date 테이블에서 로그인한 날짜가 3개월을 초과하는 아이디,
-- 로그인한 일자, 개월 수를 조회
select LOGIN_DATE, trunc(months_between ( sysdate, LOGIN_DATE ) , 1)
from test_date
group by LOGIN_DATE
having months_between ( sysdate, LOGIN_DATE ) > 3;



---------------------------------subquery----------------------------------------------
--create subquery : 테이블 복사
--dept 테이블을 모두 검색하여 검색의 결과로 cp_dept라는 테이블을 생성


create table cp_dept as (select deptno, dname, loc from dept);

select * from CP_DEPT;

--DD (Data Dictionary) : DBMS에서 관리 목적으로 생성하는 테이블
-- 개발자는 select만 가능
select * from user_constraints;

select * from cp_dept;

--emp 테이블에서 10, 30번 부서 사원번호, 사원명, 직무, 연봉, 입사일을 조회하여
-- 조회결과를 cp_emp 테이블을 생성
create table cp_emp as (select deptno, empno, ENAME, JOB, SAL, HIREDATE from emp where deptno in (10, 30));
select * from CP_EMP;


--cp_emp2 테이블을 생성하는 emp테이블 사원번호, 사원명, 매니저 번호, 입사일
-- 직무의 구조와 동일한 테이블을 생성

--레코드가 검색되지 않도록 emp 테이블 검색
desc emp;

select EMPNO, ENAME, MGR, HIREDATE, JOB
from emp
where 1=2;

create table cp_emp2 as (select EMPNO, ENAME, MGR, HIREDATE, JOB
from emp
where 1=2);
, CP_EMP2
















