/*요기*/-- PK설정
-- 컬럼 단위 제약사항
drop table primary_column2;
purge recyclebin;
create table primary_column2(
-- id varchar2(16) primary key, 제약사항명이 자동 설정된다.(SYS_00000)
id varchar2(16) constraint pk_primary_column2 primary key,
 name varchar2(30)
);

select * from user_constraints
where table_name = 'PRIMARY_COLUMN2';
select * from user_constraints
where CONSTRAINT_TYPE = 'P';


--PK 제약사항 테스트
-- 추가 성공
-- 최초 입력
insert into primary_column2(id,name) values('kim', '김경태');
--아이디가 중복되지 않는 경우
insert into primary_column2(id,name) values('kim1', '김경태');
insert into primary_column2(id,name) values('lee', '이단군');
select * from PRIMARY_COLUMN2;

--추가 실패
--중복된 아이디가 입력되는 경우
insert into primary_column2(id,name) values('kim', '윤상준');

--null 입력하는 경우
--varchar2 컬럼명 생략
insert into primary_column2(name) values( '윤상준');
--varchar2,char ' '추가
insert into primary_column2(id, name) values('', '윤상준');

insert into dept(deptno, dname, loc) values(10, '개발부', '서울');

--테이블단위 제약사항
create table primary_table2(
id varchar2(20),
name varchar2(30),
constraint pk_primary_table2 primary key(id)
);

select * from user_constraints;

--여러 개의 컬럼이 하나의 PK로 구성
--테이블 단위 제약사항으로만 설정
CREATE TABLE PRIMARY_MULTI2(
ITEM_NO CHAR(8),
ITEM VARCHAR2(50),
ITEM_INFO VARCHAR2(4000),
PRD_DATE CHAR(7),
CONSTRAINT PK_PRIMARY_MULTI2 PRIMARY KEY(ITEM_NO, PRD_DATE)
);

--dd검색
--테이블 설정된 제약사항의 종류, 활성화 여부 등
select * from user_constraints
where table_name='PRIMARY_MULTI2';
--테이블 컬럼명, 데이터, 크기 , 이폴드 등 정보
select * from user_tab_cols
where table_name='PRIMATY_MULTI2';
--테이블 컬럼에 적용된 제약사항
select * from user_cons_columns
where table_name='PRIMARY_MULTI2';






--추가 성공
--최초 입력
select * from PRIMARY_MULTI2;

INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('I_000001', '키보드', '기계식 키보드로 남자는 청축이지!!', '2023-01');

--추가 실패
INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('', '모니터', '눈이 피로해요 최소', '2023-01');
INSERT INTO PRIMARY_MULTI2(ITEM_NO, item, ITEM_INFO, PRD_DATE)
VALUES('I_000001', 'CPU', 'CPU생산', '2023-02');

