--숙제.
--1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
--    이미지,입력일,배기량, 옵션을 조회
--   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
--     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
--     입력일은 월-일-년 의 형식으로 출력 할것.
select country, maker, model, CAR_YEAR, PRICE, CAR_IMG, input_date, cc, CAR_OPTION
from(
select COUNTRY, cc.MAKER, cma.MODEL, to_char(CAR_YEAR,'9,999') CAR_YEAR,
to_char(PRICE,'9,999') PRICE, CAR_IMG, to_char(sysdate,'mm-dd-yyyy') input_date,
row_number() over(order by cc desc) CCn
, cc, substr(cmo.CAR_OPTION,1, instr(cmo.CAR_OPTION,',')-1) CAR_OPTION
from CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where (cma.maker=cc.maker) and (cmo.model = cma.model)and (cmo.cc between 1500 and 3000)
)
where ccn between 3 and 6;

--2. 부서번호가 10, 30,40번인 모든 부서의 사원번호,사원명,입사일,
--   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
--  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
--   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
--  하여 출력 ,입사일은 월-일-년 요일까지 출력  ( emp 사원번호와 zipcode SEQ컬럼을 조인조건 사용)

commit;
select * from zipcode;

select  EMPNO, rrn, ENAME, HIREDATE, SAL, SALrn, DNAME, DEPTNO, LOC, zipcode, SIDO, GUGUN, DONG, Bunzi
from(
select  EMPNO,
row_number() over(order by empno) rrn,
 ENAME, to_char(HIREDATE,'mm-dd-yyyy') HIREDATE, SAL, row_number() over(order by SAL desc) SALrn, DNAME,
 d.DEPTNO, LOC, substr(ZIPCODE,instr(zipcode,'-')+1) zipcode , SIDO, GUGUN, DONG, nvl(z.BUNJI,'번지없음') bunzi
from dept d, emp e, ZIPCODE z
where e.DEPTNO(+)=d.DEPTNO and e.empno(+)=z.seq and d.deptno in(10,30,40)
)
where rrn between 2 and 5;



--3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
-- 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
--  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
--   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
--   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .

select COUNTRY, initcap(cc.MAKER) MAKER, cma.MODEL,CAR_YEAR, PRICE, CAR_OPTION,
'이미지명 : '||substr(CAR_IMG,1,instr(CAR_IMG,'.')-1)||'  확장자 : '||substr(CAR_IMG,instr(CAR_IMG,'.')+1) img ,CC
from CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where cc.MAKER in('현대','기아','삼성','BMW','AUDI') and CAR_OPTION like '%ABS%' and CAR_OPTION like '%TCS%'
order by CAR_YEAR desc, price desc;



--4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 번호, 모델명, 제조국,
--  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
--  단,번호는 1번부터 출력하고,
--   출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
--   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
--   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
select rownum, model||'차랑의 연식은[ '||car_year||' ]이고, 제조국은 [ '|| country||' ]이며,  [ '
||maker||' ]사가 제조사입니다. 가격은 [ '||to_char(rpad(price,8,'0'),'99,999,999')||' ]원 입니다.' print
from(
select  cma.MODEL, COUNTRY, cma.MAKER, row_number() over(order by price) pricenum,price, CAR_YEAR
from CAR_MAKER cma, CAR_COUNTRY cc, CAR_MODEL cmo
where (cma.maker=cc.maker) and (cmo.model = cma.model) and cma.model in('K5', '아반테', '소렌토', 'A8', 'SM3')
)
where pricenum between 2 and 7;






--5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회하세요.
select car_year,model, sum(price)
from(
select CAR_YEAR, cma.MODEL, price
from CAR_MAKER cma, CAR_MODEL cmo
where cmo.model = cma.model and maker = '현대'
)
group by rollup(CAR_YEAR,model);

--6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
--   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
--   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
--   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
--     연봉인상액은 부서번호에 따라 차등 인상
--     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
--     계산하여 3자리마다 ,를 넣어 출력.
--     모든 영어는 소문자로 출력.
--     ( emp 사원번호와 zipcode SEQ컬럼을 조인조건 사용)
select EMPNO, ENAME, HIREDATE, SAL, tax, realmoney, moneyup, deptno,
DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from(
select instr(ename,'S',-1,1) S, instr(ename,'A',3) a, EMPNO, ENAME, HIREDATE, SAL,comm,
sal*0.033 tax, round((SAL+sal/12+nvl(comm,0)-(sal*0.033))) realmoney,e.DEPTNO,DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI,
case e.deptno when 10 then to_char(sal*1.07,'9,999')
						when 20 then  to_char(sal*1.04,'9,999')
						when 30 then  to_char(sal+nvl(comm,0)*0.1,'9,999')
											else
											to_char(sal*1.03,'9,999')
					end moneyup

from emp e,DEPT d, zipcode z
where (e.deptno = d.deptno) and (e.empno = z.seq)
)
where s = 5 and a=3;


--					7.  아래 제시된 Data Dictionary를 파악한 후,  Dictionary를 사용하여
--   emp 테이블에 컬럼명,데이터형, 크기, default값, 제약사항명을 조회하세요.
--    단, 크기는 숫자인 경우 22자가 아닌 실제 크기를 출력. (조별 토의)
--    Dictionary :  user_tab_cols , user_cons_columns, user_constraints
select * from user_tab_cols where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_constraints where table_name = 'EMP';


-- 크기
--number 의 경우 data_precision, data_scale 을 확인
--data_precision 은 전체 자리수
--data_scale 은 소수점 자리수
--number(5, 2) 인 경우 정수부 3자리 소수부 2자리
-- data_precision 은 최대 38 까지 가능
select column_name,data_type, data_precision, data_default, constraint_name
from user_tab_cols utc, user_constraints uc
where utc.table_name = 'EMP' and (utc.table_name = uc.table_name);






