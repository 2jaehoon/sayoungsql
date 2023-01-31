--ANSI outer join

-- 모든 부서에 근무하는 부서번호, 부서명, 사원번호, 사원명, 입사일 조회
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.hiredate
from emp e
right outer join dept d
on e.deptno=d.deptno;

--제조사가 현대, bmw인 모든 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션 조회
select cc.country, cc.maker,
			 cma.model,
			 cmo.car_year, cmo.price, cmo.car_option
from CAR_COUNTRY cc
left outer join CAR_MAKER cma
on cma.maker = cc.maker
left outer join CAR_MODEL cmo
on cmo.model = cma.model
--조인 조건을 잘못 설정하면 모든 레코드가 곱해져서
-- 나오는 cartesion prodect가 발생한다. => 사용x
where cc.maker in ('현대','BMW');

--테이블의 레코드 구성을 알지 못할 때 모든 테이블을 교차로 검색 full outer join
select cc.country, cc.maker,
			 cma.model,
			 cmo.car_year, cmo.price, cmo.car_option
from CAR_COUNTRY cc
full outer join CAR_MAKER cma
on cma.maker = cc.maker
full outer join CAR_MODEL cmo
on cmo.model = cma.model
--조인 조건을 잘못 설정하면 모든 레코드가 곱해져서
-- 나오는 cartesion prodect가 발생한다. => 사용x
where cc.maker in ('현대','BMW');

--사원테이블에서 JONES보다 연봉을 많이 받는 사원의 사원번호, 사원명, 연봉, 버서번호 조회
SELECT  EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='JONES');

select e1.EMPNO, e1.ENAME, e1.SAL, e1.DEPTNO
from emp e1, emp e2
where e1.sal > E2.sal and e2.ename = 'JONES';


drop table zipcode;
purge recyclebin;

drop sequence seq_test2;
