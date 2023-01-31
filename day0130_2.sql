-- 본사(emp), 지사(cp_emp)
-- 본사와 지사에 근무중인 모든 사원 정보를 조회
-- 조회컬럼 : 사원번호, 사원명, 직무, 연봉, 입사일

select empno, ename, job, sal, hiredate
from emp
union
 select empno, ename, job, sal, hiredate
from cp_emp
order by empno;


-- 컬럼의 수와 데이터형만 맞으면 에러가 발생하지 않는다.
select empno, ename, job, sal, hiredate
from emp
union
 select  sal, job, ename, empno, hiredate
from cp_emp
order by empno;

--컬럼의 수가 일치하지 않으면 error
select empno, ename, job, sal, hiredate
from emp
union
 select  sal, job, ename, empno
from cp_emp
order by empno;

--데이터형이 일치하지 않으면 error
select empno, ename, job, sal, hiredate
from emp
union
 select  ename, empno, job, sal, hiredate
from cp_emp
order by empno;



select * from emp;
select * from cp_emp;
