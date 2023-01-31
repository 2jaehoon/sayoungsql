
 -- 현재 접속하고 있는 계정 확인 sqlplus문
show user;
 -- 테이블의 구조 알수 있는 sqlplus문
desc test1;


select * from TEST1;

--문자열의 크기보다 큰 값 추가
insert into test1(name) values('김경태경태경태');


--숫자의 크기보다 큰 값 추가
insert into test1(name) values(1111);

delete from test1 where name='1111';

select * from STUDENT;

--where절을 사용하지 않으면 모든 레코드를 변경한다.
update student
set name = '윤상준', phone='010-1234-5678'
where num=3;

commit;

--이름이 김경태인 학생의 전화번호를 010-2222-3333 나이를 26,
--혈액형은 b형으로 변경

update student
set phone = '010-2222-3333', age = 26, BLOOD_TYPE = 'B'
where name = '김경태';


--delete---------------------------------------
-- 모든 레코드 삭제
delete from student;

rollback;

--특정 레코드만 삭제
--나이가 26인 레코드를 삭제
delete from student
where age = 26;

select * from STUDENT;

--나이가 26이면서 이름이 김경태인 레코드를 지워보자
delete from student
where age = 26 and name = '김경태';

delete from student
where age between 25 and 26;


------------------truncate-----------------------------------
--학생테이블에 모든 레코드를 삭제

truncate table student;

select * from STUDENT

rollback;















