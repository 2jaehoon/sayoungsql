
select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;
--1.차량테이블에서 차량옵션에 ‘ABS’가 포함되어있는 모든 차량의 모델명, 연식,옵션,
--  이미지, 입력일,가격을 조회 하세요.
--  단, 출력은 가격의 오름차순으로 정렬 했을 때 4~8번째 레코드만 조회하세요.
--    입력일은 “월-일-년 분기”의 형식으로 출력합니다.
select MODEL, CAR_YEAR, CAR_OPTION, CAR_IMG, input_day, price
from (select MODEL, CAR_YEAR, CAR_OPTION, CAR_IMG, row_number() over(order by price desc) rnum,
			PRICE, to_char(sysdate,'mm-dd-yyyy q"분기"') input_day
			from car_model
--			where car_option like '%ABS%')  --like 를   instr 로 변경해보세요
			where instr(upper(car_option), 'ABS')>0)
where rnum between 4 and 8;


rollback;
--2.아래의 데이터를 입력 할 수 있는 테이블을 생성하고, 적합하다고 판단되는 컬럼에
-- primary key를  부여하세요.
-- -- 테이블단위, 컬럼단위(주석으로 처리)  2가지로 작성.
--생성되는 테이블은 번호, 아이디, 이름, 나이, 부서번호, 전화번호, 우편번호, 주소를  저장할 수 있습니다.
create table work(
num varchar2(15),   -- constraint pk_work primary key, 컬럼단위는 컬럼하나에만 부여가능
id varchar2(30),   -- 여러 개를 묶을 시에는 테이블 단위로 처리
name varchar2(30),
age number(3),
deptnum varchar2(20),
phonenum varchar2(15),
addressnum varchar2(30),
address varchar2(100),
constraint pk_work primary key(num, id)
);

commit;

--3.위의 테이블을 사용하여 제약사항을 만족하는 쿼리와 제약사항을 만족하지 않는
--모든 쿼리를 만들어 보세요.
select * from WORK;

--첫 생성
 insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(1,'곰', '김무찌',25,25,'010-1234-5678','365-626','청주역 쉼터');
COMMIT;
 --제약사항 만족
--만족되는 것 기본키에 들어있는 컬럼의 값들과 아예 하나도 중복이 안되는 경우
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(2,'새', '박미새',27,24,'010-2424-7678','645-621','서울역');
COMMIT;
-- 기본키에 들어있는 컬럼의 개수가 2개 이상일 때 컬럼의 값이 하나 이상 다를 경우
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'곰', '이달곰',22,21,'010-1616-1278','151-123','어느 한적한 곳');
COMMIT;
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'악어', '이악어',122,71,'010-5256-1278','521-123','어느 늪지대');
COMMIT;

--제약사항 만족X
--중복값 들어있어서

insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(3,'곰', '이중복',56,31,'010-1355-1154','263-123','천국');
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(2,'새', '김중복',57,32,'010-8215-6521','166-123','지옥');
insert into work(NUM, ID, NAME, AGE, DEPTNUM, PHONENUM, ADDRESSNUM, ADDRESS) values(1,'곰', '박중복',58,33,'010-1744-7826','821-123','여긴 어디?');

