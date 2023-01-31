-- 그룹별 집계
-- 사원 테이블에서, 부서 번호, 부서별 사원 수를 조회

select deptno, count(ename), count(comm), count(*)
/* empno : group by에 포함되지 않은 컬럼이 사용되면 error */
from emp
group by deptno
order by deptno;

-- 사원테이블에서 부서별 최고 연봉, 평균 연봉, 최저 연봉, 연봉 합을 조회
select deptno, max(sal), trunc(avg(sal),0), min(sal), sum(sal)
from emp
group by deptno;

-- 사원테이블에서 매니저별 최고 연봉, 연봉 합을 조회
-- 단 매니저가 없는 사원은 조회하지 않는다.
select mgr, max(sal), sum(sal), count(*)
from emp
where mgr is not null
group by mgr
--having mgr is not null
order by mgr;


select max(sal), min(sal), sum(sal)
from emp;

--소계와 합계의 출력
--사원테이블에서 부서별 연봉합, 총합을 검색



--rollup : 총합을 나중에 검색
 select deptno, sum( sal )
 from emp
 group by rollup(deptno);




--cube : 총합을 먼저 검색
 select deptno, sum( sal )
 from emp
 group by cube(deptno);

--그룹으로 묶인 컬럽이 여러 개인 경우
--사원테이블에서 부서에 해당하는 직무별 사원 수
select deptno, job, count(empno), sum(sal)
from emp
group by rollup( deptno , job );




select deptno, job, count(empno), sum(sal)
from emp
group by cube( deptno , job );


-- 그룹으로 묶일 조건
-- 사원 테이블에서 부서별 사원 수, 연봉 합을 조회
-- 단, 부서별 사원 수가 3명을 초과하는 부서만 그룹으로 묶어서 조회
select deptno, count( * ), sum( sal )
from emp
group by deptno
having count( * ) > 3;

-- 순위 함수
-- 사원테이블에서 사원 번호, 사원명, 연봉, 연봉 순위를 조회

-- 중복 순위를 표현
select empno, ename, sal, rank() over( order by sal )
from emp;


-- 중복 순위를 표현x
select empno, ename, sal, row_number() over( order by sal )
from emp;

--사원테이블에서 직무의 연봉, 연봉 순위를 조회
--동일 순위
select job, sal, rank() over (partition by job order by sal)
from emp;

--사원테이블에서 직무의 연봉, 연봉 순위를 조회
--동일 순위x
select job, sal, row_number() over (partition by job order by sal)
from emp;



--zipcode 테이블에서 서울시에 해당하는 구와 구의 수를 조회
select sido, gugun, count(*)
from zipcode
where sido = '서울'
group by sido, gugun;
