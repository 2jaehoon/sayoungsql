--저장점 생성
--레코드 추가

savepoint insert_job;
insert into test1(name, age) values('금도끼',999);

-- 레코드 변경
savepoint update_job;
update test1
set   name='은도끼'
where name='금도끼';

commit;


--변경 작업 취소          , DEPT
rollback to insert_job; --update_job 저장점이 사라진다.
--rollback to update_job --insert_job 롤백 이후에는 update_job 저장점으로 다시 돌아갈 수 없다.


select * from TEST1 ;

/*
select 컬럼명,,,
from 테이블명, EMP
*/


--부서테이블에서 모든 부서의 부서번호, 부서명 조희
select deptno, dname
from dept;

--사원 테이블에서 사원명, 사원번호, 직무, 연봉 검색
select ename, EMPNO, JOB, SAL
from emp;

--컬럼값이 null이면 검색되지 않는다.
--사원 테이블에서 사원번호, 사원명, 연봉, 보너스 검색
select EMPNO, ENAME, SAL, COMM
from emp
where comm is not null;


--조회 컬럼에서 연산자의 사용
--test1테이블에서 이름, 나이, 내년나이를 검색
select name, age,(age+1)as nextage
 from TEST1;

 --사원 테이블에서 사원번호, 사원명, 연봉, 보스너스, 총 수령액
 -- 총 수령액은 연봉과 보너스를 합산한 금액으로 연산하여 검색한다.
 --null인 컬럼은 연산되면 연산의 결과가 null로 나온다.
 select EMPNO, ENAME, SAL, COMM, (sal+nvl(comm,0))as totalmoney
 from emp;

 --사원 테이블에서 사원명, 직무, 입사일, 연봉, 세금을 검색
 -- 단 세금은 연봉의 3.3프로로 연산하여 보여준다.
 select ENAME, JOB, HIREDATE, SAL, (sal*0.033)as yearmoney
 from emp;



 --조회 컬렴을 붙여서 문장으로 검색 ||연산자를 사용
 --test1 테이블을  사용하여 "XX님 나이는 XX살" 검색

 select name||'님 나이는'AS NAME,age||'살 입니다.'as age
 from test1;

 --사원테이블에서 xxx님 연봉은 xx$이고 월급은 xx$입니다.
 --단 월급을 연봉을 12로 나누는 연산으로 출력
 select ENAME||'님'||'연봉은'||SAL||'$이고'||'월급은'||(sal/12)||'$입니다.'as salprint
 from emp;


 --산술연산자가 아닌 다른 연산자는 조회 컬럼에 사용할 수 없다.
 select ename, sal
 from emp
 where sal>1000;

 select * from STUDENT;






















