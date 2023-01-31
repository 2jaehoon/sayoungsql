--부모테이블에 레코드 추가(학생정보 추가 - 학번은 유일)
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000001', '김경태', 'test@test.com', '010-1234-5678', '서울', sysdate);
commit;
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000002', '윤상준', 'yoon@test.com', '010-1234-2222', '서울', sysdate);
commit;
insert into test_student(NUM, NAME, EMAIL, TEL, ADDR, INPUT_DATE)
values('S_000003', '이재훈', 'lee@test.com', '010-1234-2222', '서울', sysdate);
commit;
select * from TEST_STUDENT;
select * from TEST;
--등록된 학생은 시험을 본다
--김경태 학생은 자바 시험을 봤다.
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000001', 'Java', 90, sysdate);
--윤상준 학생은 자바시험을 봤다.
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000002', 'Java', 90, sysdate);


--김경태 학생은 오라클 시험을 봤다. (한 학생은 여러 과목을 시험 볼 수 있다.)
 insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_O_000001','S_000001', 'Oracle', 89, sysdate);

--한 학생은 같은 과목을 두 번 시험 볼 수 없다(PK 제약)
insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000001', 'Java', 89, sysdate);

--존재하지 않는 학생은 시험을 볼 수 없다.(FK 제약)
 insert into test(SUBJECT_CODE, NUM, SUBJECT, SCORE, TEST_DATE)
values('S_J_000001','S_000004', 'Java', 89, sysdate);
commit;

-------------foreign key : 관계----------------------
-- 값이 없을 수도 있으나 있다면 부모테이블의 컬럼 값과 같아야 할 때
--FK로 참조하는 컬럼은 부모 테이블의 컬럼명과 같을 필요는 없다.
--단, 부모 테이블의 동일한 값을 저장하는 것이니 데이터형과 크기만 같게 맞추면 된다.

drop table foreign_column2;

-- 컬럼 단위
create table foreign_column2(
	id varchar2( 16 ) constraint fk_foreign_column_id
	references primary_column2(id) on delete cascade ,
	age number(3)
);


select * from user_constraints;
purge recyclebin;

--추가 성공
--부모테이블에 존재하는 값으로 레코드를 추가
select * from foreign_column2;
select * from primary_column2;
insert into foreign_column2(id,age)
values('kim', 20);
--같은 아이디로 여러 개의 레코드 추가
insert into foreign_column2(id,age)
values('kim', 21);

insert into foreign_column2(id,age)
values('lee', 25);
commit;

--null을 허용
insert into foreign_column2(age)
values(30);
commit;

--error
--부모테이블에 없는 값으로 추가하는 경우
insert into foreign_column2(id,age)
values('lee1', 25);





--테이블 단위
--자식테이블에서 참조하는 컬럼명과 부모 테이블의 컬럼명은 같지 않아도 된다.
create table foreign_table2(
	r_id varchar2(20),
	addr varchar2(500),
	constraint fk_foreign_table_r_id foreign key(r_id)
	references primary_table2(id)
);

select * from user_constraints
where table_name='FOREIGN_TABLE2';

--on delete cascade가 설정되어 있지 않은 경우 부모 테이블에 참조하고 있는
--자식 레코드가 존재하면 부모 테이블의 레코드는 삭제되지 않는다.
select * from primary_column2;
select * from foreign_column2;

--kim은 자식 레코드가 존재하기 때문에 삭제되지 않는다.
delete from primary_column2 where id = 'kim';
--삭제하려면 자식 레코드를 먼저 삭제한 후 부모 레코드를 삭제
--1. 자식 레코드 삭제
delete from foreign_column2 where id = 'kim';
--2. 부모 레코드 삭제
delete from primary_column2 where id = 'kim';

--on delete cascade를 설정하면 부모 테이블의 레코드가 삭제되면
--자동으로 자식테이블의 레코드가 삭제된다.
delete from primary_column2 where id = 'lee';

--kim1은 자식 레코드가 존재하지 않기  때문에 삭제된다.
delete from primary_column2 where id = 'kim1';



