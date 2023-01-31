-- decode : 조건 함수

--부서 테이블에서 부서번호, 부서명, 한글 부서명을 조회
--단, 한글 부서명은 부서번호가 10번이라면 SI개발부, 20번이라면 SM유지보수부
--30번이라면 영엽부, 그렇지 않다면 축구부로 조회

select DEPTNO, DNAME, decode(deptno, 10, 'SI개발부',20, 'SM유지보수부',30, '영엽부','축구부') hangul_dname
from dept;

--사원테이블에서 사원번호, 사원명, 직무, 한글직무를 조회
--단, 한글 직무는 saleman 영엽 manager-관리, analyst 분석가, president 두목님, 그 외는 사원으로 조외
select EMPNO, ENAME, JOB, decode(job,'SALESMAN', '영업','MANAGER', '관리','ANALYST', '분석가' ,'PRESIDENT', '두목님','사원') korean_job
from EMP;
																																							f
--case
--사원테이블에서 사원번호, 사원명, 직무, 부서번호, 부서명을 조회하세요
-- 단, 부서명은 부서번호에 따라 10번이면 SI, 20 - SM 그 외 solution을 설정하여 검색
select EMPNO, ENAME, JOB, DEPTNO,
					case deptno when 10 then 'SI개발부서'
											when 20 then 'SM유지보수부서'
											else
											'solution'
					end h_dname
from emp;

--사원 테이블에서 사원번호, 사원명, 연봉, 부서별 보너스를 검색
--단, 부서별 보너스는 10번 부서는 연봉에 10%, 20번 부서는 연봉의 20%
--그 외에는 연봉의 50%로 연산하여 출력
select EMPNO, ENAME, SAL,deptno,
 sal*  case deptno when 10 then 0.1
						when 20 then 0.2
						else
						0.5
						end bonus,
						sal*decode(deptno,10,0.1, 20,0.2, 0.5) bonus2
from emp
order by deptno;



	--자릿수에 맞지 않으면 앞에 공백이 들어간다.
--설정한 패턴보다 값이 크면 #이 출력된다.
select to_char(20232023, '9,999'), to_char(2023, '0,000,000'),to_char(2023, '0,000,000.00'),
to_char(2023.2023,'9,999,999,999.99')
from dual;

--사원테이블에서 사원번호 사원명, 연봉을 조회
--단 연봉은 3자리마다 ,을 넣고 뒤에$를 붙여서 조회
select EMPNO, ENAME, to_char(SAL,'999,999,999')||'$' sal
from emp;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24(am hh)-mi-ss dy"번째날"') ,
								to_char(sysdate, 'day q"분기"')
from dual;



--사원테이블에서 사원번호, 사원명, 입사번호를 조회
--단 , 입사일은 월-일-년 분기의 형식으로 출력할 것
--너무 길면 에러 발생
select EMPNO, ENAME, HIREDATE, to_char(hiredate, 'mm-dd-yyyy')
from emp;

--사원테이블에서 입사년도가 1981년인 사원의 사원번호, 사원명, 직무, 입사일을 조회
select  EMPNO, ENAME, JOB, HIREDATE
from emp
where to_char(hiredate,'yyyy')=1981;

--substr
select substr('ABCDEFG',3,4), substr('ABCDEFG',2,1)
from dual;


alter table test_null add emain varchar2(50) default 'test@test.com';
commit;

update TEST_NULL
set emain='testmain@naver.co.kr'
 where num=2;
 commit;

 insert into TEST_NULL(emain) values('kim@testcom');

select * from TEST_NULL;

--test_null 테이블에서 email주소와 도메인 주소를 을 검색하시요
--ㄷ단,이메일이 유효한 메일만 검색할 것
select EMAIN, substr(emain,1, instr(emain,'@')-1),substr(emain,instr(emain,'@')+1)
from TEST_NULL
where emain is not null and instr(emain,'@')!=0 and instr(emain,'.')!=0;



--data컬럼은 날짜 형식의 문자열을 추가할 수 있다.
--시간정보가 없다 대신에
insert into test_null(input_date) values('2022-12-25');
commit;

--to_date 사용
insert into test_null(input_date) values(to_date('2022-12-25','yyyy--mm--dd'));

--데이터형이 고정된 함수에 날짜형식의 문자열을 넣으면 error발생

select to_char('2023-01-19', 'dd')
from dual;


select to_char(to_date('2023-01-19'), 'dd')
from dual;


