--unique

--컬럼 단위
create table unique_column2(
	name varchar2(15),
	card_num char(19) constraint ux_unique_column2_card_num unique
);
--테이블 단위
select * from user_constraints;


select * from UNIQUE_COLUMN2;
--추가 성공
--최초 입력
insert into unique_column2(name, card_num)
values('김경태','1111-1111-1111-1111');
--다른 값인 경우
insert into unique_column2(name, card_num)
values('김경태','1111-1111-1111-1112');
insert into unique_column2(name, card_num)
values('김경태','9490-1111-1111-1111');
--null인 경우  ( n개의 레코드를 추가할 수 있다.)
insert into unique_column2(name, card_num)
values('윤상준', '');
insert into unique_column2(name)
values('이단군');
--추가 실패
--중복값이 입력되는 경우
insert into unique_column2(name, card_num)
values('박진호','9490-1111-1111-1111');

--테이블 단위
create table unique_table2(
name varchar2(15),
email varchar2(50),
constraint ux_unique_table2_email unique( email )

);

select * from user_constraints;

-- check, not null, default
create table other_constraints2(
name varchar2(30) not null,
age number(2) check (age between 20 and 29),
input_date date default sysdate
);

-- check, not null
select * from user_constraints
where table_name = 'OTHER_CONSTRAINTS2';
--default
select * from user_tab_columns
where table_name = 'OTHER_CONSTRAINTS2';


  select * from OTHER_CONSTRAINTS2;

--추가 성공
--이름이 입력되고 나이가 20대면서 날짜를 입력
insert into other_constraints2(name, age, input_date)
values('김경태', 28, sysdate);
--이름이 입력되고 나이가 20대이면서 입력일이 null인 경우
insert into other_constraints2(name, age)
values('윤상준', 20);

--추가 실패
--이름이 null인 경우
 insert into other_constraints2(name, age, input_date)
values('', 28, sysdate);

insert into other_constraints2(age, input_date)
values( 28, sysdate);

--check : 나이가 20대가 아닌 경우
insert into other_constraints2(name, age, input_date)
values('이재훈', 19, sysdate);



select * from user_constraints
WHERE TABLE_NAME = 'TABLE_CONSTRAINTS';

--alter : 테이블 관리
create table test_alter(
name varchar2(30),
age number(3),
addr number
);

--컬럼명 변경
alter table test_alter rename column neam to name;

insert into test_alter(name, age, addr) values('테스트', 20, 1234);
commit;
select * from TEST_ALTER;
--컬럼 데이터형 변경
--레코드가 존재하면 동일 데이터형에서 크기만 변경

--레코드가 존재하므로 데이터형 자체를 변경할 수 없다.
alter table test_alter modify addr varchar2(30);

alter table test_alter modify age number(4);

truncate table test_alter;
--레코드가 존재하지 않으므로 데이터형 자체를 변경할 수 있다.
alter table test_alter modify addr varchar2(300);

--컬럼 추가
--추가되는 컬럼은 가장 마지막에 추가된다.
alter table test_alter add id varchar2(20) constraint pk_test_alter primary key;

insert into test_alter(name, age, addr, id)
values('윤상준',20,'서울시 강남구','test');


 select * from TEST_ALTER;
 --컬럼 삭제
 alter table test_alter drop column age;

 --테이블명 변경 : test_alter => test_alter2
 rename test_alter to test_alter2;

 --제약사항 관리
 drop table test_alter2;
purge recyclebin;

create table test_alter(
 name varchar2(30)
);

alter table test_alter add id varchar2(20);

--제약사항 추가
--id컬럼에 PK 추가
alter table test_alter add constraint pk_test_alter primary key(id);

select * from user_constraints
where table_name = 'TEST_ALTER';

--제약사항 동작 체크
insert into test_alter(name,id) values('test','kim');

--제약사항 삭제
alter table test_alter drop constraint pk_test_alter;

select * from user_constraints
where table_name = 'TEST_ALTER';

--같은 아이디를 추가할 수 있다.
insert into test_alter(name,id) values('test1','kim');

--중복값을 삭제한다.
delete from test_alter where name = 'test1';
--중복된 아이디가 존재하므로 제약사항을 추가할 수 없다.
select * from TEST_ALTER;
alter table test_alter add constraint pk_test_alter primary key(id);

--제약사항이 활성화되어 추가할 수 없다
insert into test_alter(name,id) values('test1', 'kim'(;

--제약사항 비활성화
alter table test_alter disable constraint pk_test_alter;

select * from user_constraints
where table_name = 'TEST_ALTER';
--제약사항에 위배되는 값을 추가할 수 있다.
insert into test_alter(name,id) values('test1','kim');

--제약사항 활성화
 alter table test_alter enable constraint pk_test_alter;
 --중복값 제거 후
delete from test_alter where name = 'test1';

--계정 비밀번호 변경
show user;
alter user scott identified by tiger;

--관리자계정에서 dba_users DD를 사용하면 계정의 정보를 확인
select * from dba_users
where username = 'SCOTT';

--계정 잠그기
alter user scott account lock;

--계정 열기
alter user scott account unlock;
