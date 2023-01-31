--scalar subquery
--다른 테이블의 컬럼 값을 함께 조회
-- 사원번호, 사원명, 부서번호까지는 emp 테이블, 부서명 dept 테이블에서 검색
select empno, ename, deptno, (select dname from dept where dept.deptno=emp.deptno) dname
from emp;

select * from CAR_COUNTRY;--제조국, 제조사
select * from CAR_MAKER;--제조사, 모델
select * from CAR_MODEL;--모델별 차량 정보

--제조사, 모델명, 연식, car_option을 검색
select (select maker from car_maker where car_maker.model=car_model.model),model, car_year, car_option
from car_model;

-- select 복수행 서브쿼리
-- 형태)
-- 사원 테이블에서 사원번호, 사원명, 직무, 매니저 번호, 입사일을 조회
-- 단, 입사년도가 1981년인 사원만 검색

/*2. 재조회 : 바깥 쿼리에서는 실제 테이블의 컬럼을 사용할 수 없다. */
/* alias가 부여되면 alias로만 사용된다.*/
select eno, ename, job, mgr, hiredate/*, sal 실제 테이블의 컬럼x*/
from ( select empno eno, ename, job, mgr, to_char(hiredate,'yyyy') hiredate
from emp ) /*1. inline view를 사용함*/
where hiredate = '1981';

select * from EMP;

--rownum
-- 사원테이블에서 번호, 사원번호, 사원명 검색
select * from EMP;

select rownum, empno, ename
from emp
order by empno desc;

--부서테이블에서 부서번호, 부서명, 위치, 번호
select DEPTNO, DNAME, LOC, rownum
from dept;

-- where절에서 사용되면 1번부터 검색이 되나, 그렇지 않으면 검색되지 않는다.
-- 사원테이블에서 번호가 1~5번 사이의 사원 검색 (그 외의 번호로 시작되면 검색x)
-- 검색컬럼은 번호, 사원번호, 사원명, 입사일
select rownum, EMPNO, ENAME, HIREDATE
from emp
where rownum >=1 and rownum <=5;
--where rownum between 1 and 5;

-- rownum은 orderby보다 먼저 실행 ( order by와 함께 사용되면 번호가 섞인다. )
select rownum, empno, ename, sal
from emp
order by sal desc;

--사원테이블에서 가장 마지막에 입사한 사원부터 5명의 레코드를 조회
--조회 컬럼은 사원번호, 사원명, 연봉, 입사일

--subquery에서 바깥 쿼리문의 컬럼은 inline view에서 생성된 컬럼을 사용하나
--rownum은 select문마다 생성되고 사용된다.
select HIREDATE, ENAME, SAL, empno, rownum
from
(select  hiredate, ename, sal, empno
from emp order by hiredate desc)
where rownum between 1 and 5;

--사원테이블에서 가장 마지막에 입사한 이전  사원부터 5명의 레코드를 조회
--조회 컬럼은 사원번호, 사원명, 연봉, 입사일

select rnum, empno, ename, sal, hiredate      /*alias를 일반 컬럼으로 인식하기 위해 subquery를 또 작성*/
	from(select HIREDATE, ENAME, SAL, empno, rownum rnum       	/*2. 역 정렬된 데이터에 순 번호를 붙힘*/
	from(select  hiredate, ename, sal, empno, rownum     /*1. 역 정렬된 데이터*/
			from emp
			where hiredate < '1987-05-23'
			order by hiredate desc))
	where rnum between 2 and 6;

	--row_number() over()를 사용
	 select EMPNO, ENAME, SAL, HIREDATE, rnum
	from (select EMPNO, ENAME, SAL, HIREDATE, row_number() over(order by hiredate desc) rnum
				from emp)
				where rnum between 2 and 6;


-- car_model 테이블에서 배기량의 오름차순으로 검색 했을 때 5~15번째 차량만 검색
-- 검색 컬럼은 모델명, 연식, 가격, 옵션, 실제번호5~10, 1번부터 번호도

select * from CAR_MODEL;

select MODEL, CAR_YEAR, PRICE, CAR_OPTION, rnum,cc, rownum
from(select MODEL, CAR_YEAR, PRICE, CAR_OPTION,cc, row_number() over(order by cc desc) rnum
	from car_model)
	where rnum between 5 and 15;

  select * from DEPT;
  select DISTINCT DEPTNO from EMP;






















