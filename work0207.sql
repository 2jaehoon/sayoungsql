create table namecard(
   num number(4),--������ ������
   name varchar2(30),
   phone varchar2(40),
   email varchar2(100),
   input_date date
);

purge recyclebin;
drop table namecard;

insert into namecard(num, name, phone, email, input_date) values(NAMECARD_SEQ.nextval, '������', '010-4521-1111', 'abc@naver.com', sysdate);
			commit;

			delete from namecard where name = '' ;

select * from namecard;
--������ ����
CREATE SEQUENCE NAMECARD_SEQ --�������̸� WDRL_SEQ
INCREMENT BY 1 --�������� 1
START WITH 1 --���ۼ��� 1
MINVALUE 1 --�ּҰ� 1
MAXVALUE 9999 --�ִ밪
;


 select  num, name, phone, email, input_date from namecard ;
, NAMECARD_SEQ, NAMECARD
