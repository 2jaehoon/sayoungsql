--숙제1.
-- 사원 테이블에서 연봉이 1500~3000사이인 사원의
--  사원번호, 사원명, 연봉, 입사일, 부서번호, 직무, 매니저번호를 조회한 레코드를 사용하여
--  emp_work테이블을 생성하고 추가합니다.
create table emp_work as(
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from emp
where sal between 1500 and 3000);

select * from EMP_WORK;
commit;

--숙제2.
--  emp테이블에서 10번 30번 부서의 사원 정보를 조회하여 emp_work테이블에
--  조회 결과를 추가합니다.
--   단, 사원번호는 조회된 사원번호에 1000을 더한 값으로 추가할 것.
--      원본 data 7788 -> insert 8788
insert into emp_work(EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR)
(select EMPNO+1000, ENAME, SAL, HIREDATE,DEPTNO, JOB, MGR
from emp
where deptno in (10,30));

select * from EMP_WORK;
commit;



--숙제 3.
-- emp_work 테이블에서 10번 부서에 근무하는 사원들의 연봉을  emp테이블의
--  사원번호가 7698번 사원 연봉과 7782번 사원의 연봉을 더한 금액으로 변경하세요.
update emp_work
set sal = (select sal from emp where empno=7698) + (select sal from emp where empno=7782)
where deptno = 10;


select * from EMP_WORK;
commit;



--숙제4. emp_work 테이블에 아래와 같은 레코드를 추가하세요.
--사원번호 : emp_work의가장 마지막 사원번호에서 1 증가한 번호, 사원명 :윤상준, 직무 : 개발자,
--  입사일 : 추가되는 시점의 다음날
insert into emp_work(empno, hiredate, ename, job) values(
(select max(empno)
from emp_work)+1, sysdate+1, '윤상준', '개발자');

select * from EMP_WORK;
commit;


--숙제5.아래와 같은 레코드를 저장할 수 있는  sales테이블을 생성하고 레코드를 추가하세요.
-- 번호 : 1, 상품명 : 키보드, 가격 : 20000, 판매일 : ‘2023-01-25’, 수량 : 1
-- 번호 : 2, 상품명 : 마우스, 가격 : 27000, 판매일 : ‘2023-01-25’, 수량 : 1
-- 번호 : 3, 상품명 : 모니터, 가격 : 350000, 판매일 : ‘2023-01-25’, 수량 : 1
-- 번호 : 4, 상품명 : 키보드, 가격 : 23000, 판매일 : ‘2023-01-25’, 수량 : 1
-- 번호 : 5, 상품명 : 키보드, 가격 : 15000, 판매일 : ‘2023-01-25’, 수량 : 1
-- 번호 : 6, 상품명 : 키보드, 가격 : 20000, 판매일 : ‘2023-01-26’, 수량 : 1
-- 번호 : 7, 상품명 : 마우스, 가격 : 13000, 판매일 : ‘2023-01-26’, 수량 : 1
-- 번호 : 8, 상품명 : 키보드, 가격 : 22000, 판매일 : ‘2023-01-26’, 수량 : 1

create table sales(
num char(1),
name varchar(9),
price number(6),
saleday char(10),
amount char(1)
);
commit;
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(1, '키보드', 20000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(2, '마우스', 27000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(3, '모니터', 350000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(4, '키보드', 23000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(5, '키보드', 15000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(6, '키보드', 20000, '2023-01-26', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(7, '마우스', 13000, '2023-01-26', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(8, '키보드', 22000, '2023-01-26', 1);

select * from sales;
commit;




--숙제 6. 상품명, 총가격, 판매건수, 판매일, 입력일 을 저장할 수 있는  sales_adjustment 테이블을 생성하세요.
create table sales_adjustment as(select NAME, PRICE totalprice, AMOUNT amountcount, SALEDAY, SALEDAY inputday
from sales where 1=2
);

commit;

--숙제7. sales 테이블에서 ‘2023-01-25’ 에 판매된 상품의 상품명, 총가격, 판매건수 를  sales_adjustment
--    테이블에 추가하세요. -정산
--   추가   예)
--     키보드, 58000, 3, 2023-01-25, 오늘
--     마우스 , 27000,1,  위와동일
--     모니터, 350000,1, 위와동일

insert into SALES_ADJUSTMENT (name, toalprice, amountcount, saleday, inputday)
(select NAME, sum(price), count(amount), min(saleday), sysdate  --sale에 min을 넣어도되고 max를 넣어도된다.  조건을 걸어놨기에
from SALES
where saleday = '2023-01-25'
group by name);
commit;

rollback;
select * from SALES;
select * from SALES_ADJUSTMENT;


