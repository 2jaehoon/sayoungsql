--숙제.
-- 1. zipcode 테이블을 복사하여 cp_zipcode1 테이블을 생성하세요.
select * from ZIPCODE;
select * from CP_ZIPCODE1;

create table cp_zipcode1 as
(select * from ZIPCODE);


-- 2. cp_zipcode1 테이블의 seq컬럼에 PK를 설정하세요.
alter table cp_zipcode1 add constraint pk_cp_zipcode1 primary key(seq);

--3. 아래의 제약사항을 설정하여 테이블을 생성하세요.
--
--  저장 데이터 : 아이디, 이름, 주소seq, 전화번호, 나이, 성별, 입력일
--
-- - 아이디는 null을 허용하지 않으면서 유일합니다.
-- - 이름은 반드시 입력되어야 합니다.
-- - 주소seq는 null을 허용하지만 값이 있을 때에는  cp_zipcode1 테이블에 존재하는
--    값으로만 입력가능합니다.
-- - 전화번호는 없을 수도 있지만 있다면 유일 합니다.
-- - 나이는 컬럼명이 생략되어 insert되는 경우 0으로 설정합니다.
-- - 성별은 ‘M’ 또는 ‘F’로만 입력가능합니다.
-- - 입력일은 컬럼명이 생략되어 insert되는 경우 현재 일자로 추가합니다.
drop table cp_zipcode2;
purge recyclebin;

create table cp_zipcode2(
num number(3),
id varchar2(30) not null constraint ux_cp_zipcode2_id unique,
name varchar2(50) not null,
seq number constraint fk_cp_zipcode2_seq references cp_zipcode1(seq),
phone varchar2(30) constraint ux_cp_zipcode2_phone unique,
age number(3) default 0,
gender char(1) check (gender in ('M','F')),
input_date date default sysdate
);

-- 4. 3번으로 생성한 테이블에 아래와 같은 데이터를 추가하세요 주소 seq
--   1, kim,김규미,168,  010-1234-7890,F,현재일
--   2, kim1,김경태,52144,  010-2234-8811,M,현재일
--   3, lee,이단군,3298,  010-8471-1345,M,현재일
--   4, kim2,김보경,1,  010-1111-2222,F,현재일
select * from CP_ZIPCODE2;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(1, 'kim','김규미',168,'010-1234-7890','F',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(2, 'kim1','김경태',52144,'010-2234-8811','M',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(3, 'lee','이단군',3298,'010-8471-1345','M',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(4, 'kim2','김보경',1,'010-1111-2222','F',sysdate);
commit;



 ----------------------------------------------------------------------------------
-- 5. 아이디, 이름, 전화번호, 우편번호, 주소를 조회하세요.
--   주소는 cp_zipcode1 테이블에 sido,gugun,dong 컬럼을 결합하여 하나로 출력합니다.
select id, name, phone, seq, (select sido||' '||gugun||' '||dong from cp_zipcode1 where cp_zipcode1.seq= CP_ZIPCODE2.seq)
from CP_ZIPCODE2;
