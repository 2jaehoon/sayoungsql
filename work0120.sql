

--숙제
--1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,
--   입사일을 조회하세요.
-- 단, 입사일은 ‘월-일-년 요일’의 형식으로 출력하세요.
--    연봉은 3자리마다 ,를 넣어 출력하세요.
select EMPNO, ENAME, JOB, MGR,
to_char(SAL,'9,999') sal, to_char(HIREDATE,'mm-dd-yyyy-day') hiredate
from emp;

--2. 사원테이블에서 부서번호, 사원번호, 연봉, 보너스, 총수령액, 실수령액, 월급
-- 입사일을 조회하세요.
--   단. 총 수령액은 '연봉+보너스'를 합산한 금액으로 조회하세요.
--       실 수령액은 ‘연봉+보너스를 합산한 금액에서 3.3%를 제외한 금액’으로 조회,
--     월급은 연봉을 12로 나눈 값을 원단위 절사하여 조회하세요.
select DEPTNO, EMPNO, SAL, COMM, (sal+nvl(comm,0)) totalmoney,
(sal+nvl(comm,0))-((sal+nvl(comm,0))*0.033) silmoney, round((sal/12)) monthmoney
from emp;

--3. 아래의 데이터를 참조하여 test1 테이블을 생성하고  레코드를 추가할 것.
--   컬럼명 : 이름, 나이, 태어난해, 주민번호
--     김규미,25,1995,’950101-2234567‘
--     김경태,25,1995,’951126-1234567‘
--     모민경,26,1994,’940101-2234567‘
--     박진호,26,1994,’940101-1234567‘

create table test1(
name char(9),
age  number(2),
born number(4),
ssn char(14)
);

insert into test1(name, age, born, ssn) values('김규미',25,1995,'950101-2234567');
commit;
insert into test1(name, age, born, ssn) values('김경태',25,1995,'951126-1234567');
commit;
insert into test1(name, age, born, ssn) values('모민경',26,1994,'940101-2234567');
commit;
insert into test1(name, age, born, ssn) values('박진호',26,1994,'940101-1234567');
commit;
 select * from TEST1;

-- 4. test1 테이블에서 이름 ,나이, 태어난 해, 주민번호,  성별을 조회 하세요.
--   -성별은 주민번호의  8번째 자리로 구하고,
--   8번째 자리가 1,3이면 '남자', 2,4면 '여자' 5,6,7,8이면 '외국인'그렇지
--   않으면 "오류" 로 출력한다.
select NAME, AGE, BORN, SSN,
case substr(ssn,8,1) when '1' then '남자'
			when '3' then '남자'
		 when '2' then '여자'
    when '4' then ' 남자'
    when '5' then ' 외국인'
    when '6' then ' 외국인'
    when '7' then ' 외국인'
    when '8' then ' 외국인'
    else '오류'
   end sex
from test1;



--5.emp테이블을 사용하여 아래와 같이 조회 하세요.
--  xxx번 Xxxx사원의 입사일은 yyyy-mm-dd 요일 일 입니다. 연봉은 $xxx 입니다.
-- 단. 입사요일이 월,화,목에 입사한 사원에 대해서만 조회합니다.
--     사원명은 첫 글자만 대문자로 조회하고, 입사일의 오름차순 정렬하여 출력하되
--     입사일이 같다면 연봉의 내림차순으로 정렬하여 출력하세요.
--      연봉은 3자리마다 ,를 넣어서 출력하세요.
	select EMPNO, INITCAP(ENAME) ename, HIREDATE, to_char(SAL,'9,999') sal
	from emp
	where to_char(hiredate,'dy')in('월','화','목')
	order by hiredate, sal desc;





--6. dept테이블에서 '딸'이 많은 지역에 있는 부서의 부서번호, 부서명을 조회하세요. (nonsense)
select DEPTNO, DNAME, LOC
from dept
where loc like 'DAL%';
