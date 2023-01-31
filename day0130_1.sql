-- 시퀀스 생성
-- 1부터 9999까지 1씩 증가하는 시퀀스 생성
drop sequence seq_test;

create sequence seq_test
start with 1
maxvalue 9999
increment by 1;

-- 시퀀스 조회 : user_sequences DD
select * from user_sequences;

-- 시퀀스 현재 번호 얻기(시퀀스명.currval)
-- currval : 접속자 세션에 로드된 시퀀스의 현재 번호 얻는다.
-- 					 접속자 세션에 시퀀스를 로드할 수 없다.
select seq_test.currval from dual;

-- nextval : 접속자 세션에 시퀀스가 로드되어 있지 않다면
--		    		 File 영역에서 Last_number를 변경하고 접속자세션에
--					   시퀀스 객체를 로드한 후 다음 번호를 얻는다.
--* 시퀀스객체가 존재한다면 cache만큼의 범위안에서 번호를 얻는다.
--           cache 수를 초과하면 File 영역에 Last_num을  수정한 후  다시 로드
select seq_test.nextval from dual;

select * from user_sequences;

-- 컬럼의 값을 순차적인 번호로 insert할 때
create table use_seq(
num number(4),
name varchar2(15),
num2 char(10)
);

insert into use_seq(num, name, num2) values(seq_test.nextval, '테스트2', '');
-- 쿼리문이 문제가 발생한다면 날라갈 경우에는 시퀀스 번호가 날라감
select * from use_seq;

-- 10에서부1000000까지 10씩 증가하는 시퀀스 생성
-- 단, 번호를 모두 사용하면 반복되어야한다.
drop sequence seq_test2;
create sequence seq_test2
increment by 10
start with 10
maxvalue 1000000
cache 40
cycle;


select * from user_sequences;

--현재 번호 얻기
select seq_test2.currval from dual;
-- 다음 번호 얻기
select seq_test2.nextval from dual;

-- use_seq 테이블에 아래와 같은 값을 추가
-- 0,'김경태', 'S_00000001'
-- 0,'김규미', 'S_00000002'
-- 0,'김보경', 'S_00000003'
-- 번호는 고정된 길이로 1씩 증가하는 값으로 추가
truncate table use_seq;
select * from use_seq;
insert into use_seq(num, name, num2) values(0, '김경태', concat('S_', lpad(seq_test.nextval,8,0)));

-- use_seq테이블에 num2 컬럼을 pk로 설정
alter table use_seq add constraint pk_use_seq primary key(num2);
