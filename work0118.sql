create table student(
num number(5),
name varchar2(30),
class char(1),
email varchar2(50),
phone varchar2(13),
addr varchar2(240),
sex varchar2(6),
javascore number(3),
inputday date
);

insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(1,'김경태', 'A', 'tae@sist.co.kr','010-1234-5678','경기도 용인시','남자',91,sysdate);
 commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(2,'김규미', 'A', 'kim@daum.net','010-7739-9761','서울시 강남구 역삼1동','남자',90,sysdate);
     commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(3,'윤상준', 'A', 'sang@test.com','010-5878-8813','서울시 동작구 상도동','여자',97,sysdate);
      commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(4,'김보경', 'B', 'kyoung@google.com','011-234-7611','서울시 동대문구 동대문동','여자',190,sysdate);
    commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(5,'모민경', 'B', 'min@sist.co.kr','010-4334-7656','인천시 부평구 부평3동','여자',89,sysdate);
  commit;

--3. 1번에서 생성된 테이블을 사용하여 모든 레코드와 모든 컬럼을 조회하세요.
select *
from student;
--4. 1번에서 생성된 테이블을 사용하여 이름, 반, 주소, 자바점수만 조회하세요.
select NAME, CLASS, ADDR, JAVASCORE
from student;
--5. 3번 학생의 성별을 ‘남자’로 점수를 90점으로 반을 A, 전화번호를 010-2234-7611으로 변경해주세요.
update student
set sex='남자', JAVASCORE=90, CLASS='A', PHONE='010-2234-7611'
where num = 3;
 commit;
--이름이 ‘김규미'이면서 반이 ‘A’반인 학생의 반을 ‘B’반, 전화번호를 010-1111-2341 로 변경해주세요.
update student
set class='B', PHONE='010-1111-2341'
where name = '김규미'and class='A';


commit;
--7.  반이 A반인 학생을 모두 삭제해보세요.
delete
from student
where class='A';

--8. 7번에서 삭제한 레코드를 모두 복구해 보세요.
rollback;

--9. 1번에서 생성된된 테이블 자체를 삭제해 보세요.
drop table student;

--9. 휴지통을 확인하고, 휴지통에 버려진 테이블을 복구해보세요.
--sqlplus에서 확인가능
show recyclebin
flashback table student to before drop;
 --10. 테이블의 모든 레코드를 절삭해보세요.
truncate table student;
--11. 테이블자체를 삭제 해보세요.
drop table student;
--12. 휴지통의 내용을 확인하고, 휴지통을 비워보세요.
show recyclebin;
purge recyclebin;


commit;


