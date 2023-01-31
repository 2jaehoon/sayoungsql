--집계함수
--count : null인 컬럼은 집계에 포함하지 않는다.

--사원테이블은 몇 개의 레코드가 존재하는 지?
select count(empno), count(mgr), count(comm)
from emp;

--사원테이블에서 보너스가 없는 사원의 수 검색
select count(ename)
from emp
where comm is null;

select * from emp;

--사원테이블에서 보너스를 수령하지 않는 사원의 수 조회
select count(*)-count(comm)
from emp;

--사워네이블에서 연봉합, 연봉평균
select sum(sal), avg(sal)
from emp;


	--사워네이블에서 평균연봉보다 많이 받는 사원의 사원번호, 사원명, 연봉, 입사일 조회
	select ename
	from emp
	group by ename
	having sal>avg(sal);



select * from emp;

