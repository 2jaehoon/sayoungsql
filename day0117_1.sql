-- student 테이블에 레코드를 추가
-- 컬렴명을 생략 (컬럼의 순서대로 값을 설정하여 추가)

--컨트롤 엔터를 쓰면 그 전 컨트롤 엔터 친 곳 그 전;부터 현재 ;까지 실행

insert into student values(1,'김경태','010-1234-5678',
'kim@test.com',25,'900001-1234567','A',182.5,74.23,sysdate);

--값이 꼬일 수 있다.

insert into student values(1,'010-1234-5678','윤상준',
'kim@test.com',25,'900001-1234567','A',182.5,74.23,sysdate);


select * from STUDENT;

--컬럼을 명시하여 추가

insert into student(NUM, NAME, PHONE, EMAIL, AGE, SSN,
 BLOOD_TYPE, HEIGHT, WEIGHT, INPUT_DATE)
 values(3,'이재훈', '010-1234-1234', 'lee@daum.net', 25,
  '910101-1331313', 'AB', 172.9, 83.12, '2023-01-16');


  --테이블 컬럼의 순서와 상관없이 값을 추가할 수 있다.
  insert into student(NAME, AGE, SSN, PHONE, EMAIL,
	BLOOD_TYPE, HEIGHT, WEIGHT, NUM, INPUT_DATE)
	values('이단군',26,'921212-1234567','010-4321-9876',
	 'test@naver.com', '0', 185.4, 67.3, 4, sysdate);

	 --컬럼을 생략하여 추가할 수 있다.(값이 존재하는 컬럼만 추가)
	 --(컬럼이 생략되면 null이 입력)
	 insert into student(num,name,ssn) values(5,'황충연','880101-1234567');

  select * from STUDENT;






		create table test1(
		name varchar2(15),
		age number(3));


		select * from test1;





		update test1
		set age=30
		where name='김경태1';
         	select * from test1;
		commit;


    select * from TEST1;

    --트랜잭션 취소 바로 전 커밋 이후까지 다 취소됨
    insert into test1(name, age) values('이무개', 25);
    insert into test1(name, age) values('이무개1', 22);

rollback;

