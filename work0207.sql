create table namecard(
   num number(4),--시퀀스 들어가야함
   name varchar2(30),
   phone varchar2(40),
   email varchar2(100),
   input_date date
);

purge recyclebin;
drop table namecard;

insert into namecard(num, name, phone, email, input_date) values(NAMECARD_SEQ.nextval, '이재훈', '010-4521-1111', 'abc@naver.com', sysdate);
			commit;

			delete from namecard where name = '' ;

select * from namecard;
--시퀀스 생성
CREATE SEQUENCE NAMECARD_SEQ --시퀀스이름 WDRL_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 9999 --최대값
;


 select  num, name, phone, email, input_date from namecard ;
, NAMECARD_SEQ, NAMECARD
