--휴지통보기
show recyclebin;

drop table student;

drop table test1;

--휴지통에 있는 테이블 복원
flashback table test1 to before drop;

select * from test1;

--휴지통 비우기
purge recyclebin;


----------------alias 사용------------
------사원 테이블에서 사원번호, 사원명, 매니저번호를 조회
select EMPNO as employee_number, ENAME emp_name, MGR manager_number
from emp;

--사원 테이블에서 사원명(사원번호)의 연봉은 xxx$입니다.의 문장으로 조회
--단, 출력되는 컬럼명을 OutPut으로 설정하여 조회할 것

--DBMS에서 저장되지 않고 출력되는 문자열에 대해서는 "를 사용할 수 있다.
select ENAME||'('||EMPNO||')의 연봉은'||SAL||'$입니다.' "OutPut"
from emp;

--alias는 연결된 where절에서 사용할 수 없다.
select ename, sal, empno eno
from emp
where empno=7788;

--사원테이블에서 사원번호, 사원명, 연봉,세금 검색
-- 단, 세금은 연봉의 3.3프로이다.
--세금은 alias로 처리하여 검색
select EMPNO, ENAME, SAL, sal*0.033 tax
from emp;

 --------where의 사용-----------------
 --관계연산자, <, <, >=, <=, =, != (<>)

--사원테이블에서 연봉이 2450을 초과하는 사원들의 사원번호,
-- 사원명, 연봉, 매니저번호, 입사일을 검색
 select EMPNO, ENAME, SAL, MGR, HIREDATE
 from emp
 where sal>2450;


 --사원테이블에서 직무가 'clerk'인 사원의
 -- 직무, 연봉, 보너스 , 부서번호 조회
 select  *
 from emp
 where ename = 'CLRK';


  select  *
 from emp;

 select *
 from emp
 where mgr!=7698;

 select *
 from emp
 where ename = 'BLAKE';


 -----논리연산자----------------------
 --and, or
--and 전항과 후항이 모두 맞는 경우에만 검색
--or 전항과 후항이 하나라도 맞으면 검색

--사원테이블에서 사원번호가 7788이면서 사원명이  scott인
--사원의 사원번호ㅛ, 사원명, 직무를 검색
select EMPNO, ENAME, JOB
from emp
where empno = 7788 and ename='SCOTT';

--사원테이블에서 연봉이 1100~2450 사이인 사원들의
--사원번호, 사원명, 직무, 연봉, 매니저 번호 검색
select EMPNO, ENAME, JOB, SAL, MGR
from emp
where sal between 1100 and 2450;


--사원테이블에서  SALESMAN, MANAGER,  ANALYST인 사원들의
--사원명, 직무, 사원번호, 매니저번호, 연봉을 조회

--컬럼명 in(값,,,,);

select ENAME, JOB, EMPNO, MGR, SAL
from EMP
where job not in('SALESMAN','MANAGER','ANALYST');



--사원 테이블에서 매니저가 7788,7698매니저가 관리하는 사원들의
--사원번호, 사원명, 매니저 번호, 입사일을 조회하시오.
select ename, ENAME, MGR, HIREDATE
from emp
where MGR not in(7788, 7698);


select distinct * from TEST1;


--사원테이블에서 보너스를 수령하지 않는 사원들의
--사원번호, 사원명, 보너스 , 입사일을 조회

--null은 관계연산자로 비교할 수 없다. ( =, !=)

select EMPNO, ENAME, COMM, HIREDATE
from EMP
where comm is null;

--사원테이블에서 보너스를 수령하는 사원들의
--사원번호, 사원명, 보너스 , 입사일을 조회

select EMPNO, ENAME, COMM, HIREDATE
from EMP
where comm is not null;


--------------like---------
--문자열 중 일부분을 알아도 검색이 가능
--like는 %, _와 함께 사용한다.
--% 와 _를 함께 사용하지 않으면 =과 동일한 결과로 검색한다.

--사원테이블에서 사원명이 'SCOTT'인 사원의 사원번호, 사원명, 입사일, 부서번호를 검색

select EMPNO, ENAME, HIREDATE, EMPNO
from emp
where ename like '%AKE';


--char, varchar2는 컬럼크기에 byte를 붙일 수 있다.
create table like_test(
name varchar2(30byte),
addr varchar2(200)
);

insert into like_test(name,addr) values('김경태','서울시 강남구 역삼동');
insert into like_test(name,addr) values('김규미','서울시 서초구 서초동');
insert into like_test(name,addr) values('모민경','서울시 동대문구 동대문동');
insert into like_test(name,addr) values('윤상준','경기도 수원시 강남구 역삼동');
insert into like_test(name,addr) values('이길헌','수원시 서초구 팔탄동');
insert into like_test(name,addr) values('엄태영','인천시 동대문구 동대문동');
insert into like_test(name,addr) values('김경태태','제주시 이도동');
insert into like_test(name,addr) values('김경경태','충청남도 예산시 서초리');


commit;

select * from LIKE_TEST;

select *
from LIKE_TEST
where addr like '%강남구%';

--%모든 문자열
--서울시에 거주하는 사람의 이름과 주소를 조회
select NAME, ADDR
from LIKE_TEST
where addr like '서울시%';

--역삼동에 거주하는 사람의 이름과 주소를 조회select NAME, ADDR
select name, addr
from LIKE_TEST
where addr like '%역삼동';

--주소에 '서초'가 들어있는 모든 레코드를 조회
select addr
from LIKE_TEST
where addr like '%서초%';


--사원테이블에서 사원명에 'A'가 들어있으면서 연봉이 2000이상인 사원의
--사원번호, 사원명, 연봉, 보너스, 부서번호
select EMPNO, ENAME, SAL, COMM, DEPTNO
from emp
where ename like '%A%' and sal>=2000;


select EMPNO, ENAME, SAL, COMM, DEPTNO
from emp
where ename like '_LAKE' and sal>=2000;


--사원테이블에서 'L'이 두개 들어있는 사원의 사원명, 사원번호를 조회
select  ENAME, EMPNO
from emp
where ename like '%L%L%';



-----지번주소 저장 테이블
create table zipcode(
zipcode char(7),
sido char(6),
gugun varchar2(25),
dong varchar2(200),
bunji varchar2(25),
seq number
);


 commit;



 alter table zipcode
 rename column gugu to gugun;


 select * from zipcode;

 truncate table zipcode;


 --zipcode 테이블을 사용하여 자신이 살고 있는 동을 검색
 --우편번호, 시도, 구군,ㅡ 동, 번지는 묶어서 주소로 표현
 select ZIPCODE||SIDO||GUGUN||DONG||BUNJI
 from zipcode
 where dong like '%비하동%계룡리슈빌2차___';

 select * from TEST1;

select * from LIKE_TEST;



--이름이 3글자인 사람의 레코드 검색
select name
from LIKE_TEST
where name like '____';

 --이름이 3글자인 가운데 테사람의 레코드 검색
select name
from LIKE_TEST
where name like '_태_';














