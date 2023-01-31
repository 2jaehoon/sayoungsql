--inner join : 양쪽 테이블에 동일한 레코드가 존재했을 때 검색
-- 사원이 존재하는 부서에 한해 부서번호, 부서명, 위치(dept)부서번호(emp)사원번호, 사원명,연봉, 입사일 검색.

--ANSI
-- 컬럼이 식별되면 테이블명을 생략하여 사용할 수 있다. ( 컬럼이 어떤 테이블에 존재하는 지 알 수 없다. )
select dname, loc, dept.deptno, empno, ename, sal, hiredate
from dept
inner join emp
on emp.deptno=dept.deptno;


-- 컬럼이 어떤 테이블에 존재하는지 알수 있도록 테이블명.컬럼명으로 사용
--(쿼리문이 길어진다)
select dept.dname, dept.loc, dept.deptno, emp.empno, emp.ename, emp.sal, emp.hiredate
from dept
inner join emp
on emp.deptno=dept.deptno;


--테이블명 alias 부여 : 테이블명을 사용할 수 없고 alias로만 사용
select d.dname, d.loc, d.deptno, e.empno, e.ename, e.sal, e.hiredate
from dept d
inner join emp e
on e.deptno=d.deptno;

--Oracle
select dname, loc, d.deptno, empno, ename, sal, hiredate
from dept d, emp e
where e.deptno=d.deptno;

-- 제조국, 제조사, 모델명 검색
select cc.COUNTRY, cc.MAKER, cm.MODEL
from CAR_COUNTRY cc, CAR_MAKER cm
where cm.MAKER = cc.MAKER;

select * from user_indexes
where table_name='CAR_COUNTRY';

select rowid, country
from car_country;

--모든 부서에 근무하는 사원 정보를 조회
-- 검색 컬럼, 부서명, 위치, 부서번호, 사원번호, 사원명, 연봉을 검색
select d.dname, d.loc, d.deptno, e.empno, e.ename, e.sal
from dept d , emp e
where e.deptno(+)=d.deptno;


-- 제조사가 현대인 모든 차량의 제조사, 모델명, 옵션, 년식 검색
select cma.MAKER, cma.MODEL, cmo.MODEL, cmo.CAR_OPTION, cmo.CAR_YEAR
from CAR_MAKER cma, CAR_MODEL cmo
where cmo.model(+) = cma.model and maker = '현대';







select * from emp;
select * from dept;


