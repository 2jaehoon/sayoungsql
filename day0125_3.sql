--insert : 단수행 subquery
--cp_emp 테이블에 사원번호 : 1111, 사원명 : 윤상준, 직무 : 개발자
-- 연봉 : 사원테이블에 사원번호 7788인 사원의 연봉과 같은 연봉으로 추가
-- 입사일은 현자일자 .
insert into cp_emp(empno, ename, job, sal, hiredate)
values(1111, '윤상준', '개발자', (select sal from emp where empno = 7788), sysdate );



select * from CP_EMP

--단수행 자리에 복수행 조회되면 error

insert into cp_emp(empno, ename, job, sal, hiredate)
values(1111, '김경태', '개발자', (select sal from emp), sysdate );


-- 여러 개의 컬럼이 정의 되더라도 에러
insert into cp_emp(empno, ename, job, sal, hiredate)
values(1113, '김경태', '개발자', (select sal, comm from emp where empno = 7788), sysdate );


--복수행 서브쿼리
create table cp_emp3 as
(select EMPNO, ENAME, DEPTNO, JOB, SAL
from emp where 1=0);

--emp 테이블에서 10번 부서에 근무하는 모든 사원의 사원번호, 사원명,
--부서번호, 직무, 연봉을 cp_emp3테이블에 추가

--컬럼명 생략
insert into cp_emp3(
select empno, ename, deptno, job, sal
from emp
where deptno=10);

//컬럼명 명시 가능
insert into cp_emp3(empno, ename, deptno, job)
(select empno, ename, deptno, job
from emp
where deptno=20);


create table block_user(
id varchar2(30),
last_conn date,
input_date date
);


insert into block_user(id, last_conn)
(select id, LOGIN_DATE
from test_date
where months_between ( sysdate, LOGIN_DATE ) > 2);

--test_date 테이블에서 로그인한 마지막 로그인 날짜가
--2달이 초과한 아이디와 날짜를 검색하여 block_user 테이블에 추가

select * from TEST_DATE;


select * from CP_EMP3;
select * from BLOCK_USER;


---update subquery--------
--단수행만 가능
--cp_emp 테이블에서 사원번호가 1111번 사원의 직무를
--cp_emp 테이블의 사원번호가 7698인 사원과 동일한 직무로 변경

update cp_emp
set job=(select job from cp_emp where empno=7698)
where empno=1111;

--cp_emp3 테이블에서 부서번호가
--emp 테이블에서 사원명이 'SCOTT'인 사원의 부서 번호와
--동일한 모든 사원의 연봉을 2000으로 직무 '일비로 변경'

update cp_emp3
set sal = 2000, job = '알바'
where deptno=(select deptno
from emp
where ename = 'SCOTT');


select * from CP_EMP3;


--update 복수행 서브쿼리
--cp_emp3 테이블에서 부서번호가 emp 테이블의 사원명'CLARK'. 'SCOTT'인
--사원의 부서번호와 동일 부서의 모든 사원의 연봉을 2500으로 변경
update cp_emp3
set SAL = 2500
--IN을 사용하면 복수행 서브쿼리를 사용할 수 있다.
where deptno IN(select deptno from emp where ename = 'CLARK'OR ENAME = 'SCOTT');
--where deptno = (select deptno from emp where ename = 'CLARK'OR ENAME = 'SCOTT');

select * from cp_emp3;

 commit;

--delete 복수행 서브쿼리
--cp_emp3 테이블에서 emp 테이블의 사원번호가 7788인 사원과 같은 부서번호 에
--해당하는 모든 사원 삭제
delete
from cp_emp3
where deptno = (select deptno from emp where empno = 7788);

select * from cp_emp3;
