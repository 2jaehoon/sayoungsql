--����.
-- 1. zipcode ���̺��� �����Ͽ� cp_zipcode1 ���̺��� �����ϼ���.
select * from ZIPCODE;
select * from CP_ZIPCODE1;

create table cp_zipcode1 as
(select * from ZIPCODE);


-- 2. cp_zipcode1 ���̺��� seq�÷��� PK�� �����ϼ���.
alter table cp_zipcode1 add constraint pk_cp_zipcode1 primary key(seq);

--3. �Ʒ��� ��������� �����Ͽ� ���̺��� �����ϼ���.
--
--  ���� ������ : ���̵�, �̸�, �ּ�seq, ��ȭ��ȣ, ����, ����, �Է���
--
-- - ���̵�� null�� ������� �����鼭 �����մϴ�.
-- - �̸��� �ݵ�� �ԷµǾ�� �մϴ�.
-- - �ּ�seq�� null�� ��������� ���� ���� ������  cp_zipcode1 ���̺� �����ϴ�
--    �����θ� �Է°����մϴ�.
-- - ��ȭ��ȣ�� ���� ���� ������ �ִٸ� ���� �մϴ�.
-- - ���̴� �÷����� �����Ǿ� insert�Ǵ� ��� 0���� �����մϴ�.
-- - ������ ��M�� �Ǵ� ��F���θ� �Է°����մϴ�.
-- - �Է����� �÷����� �����Ǿ� insert�Ǵ� ��� ���� ���ڷ� �߰��մϴ�.
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

-- 4. 3������ ������ ���̺� �Ʒ��� ���� �����͸� �߰��ϼ��� �ּ� seq
--   1, kim,��Թ�,168,  010-1234-7890,F,������
--   2, kim1,�����,52144,  010-2234-8811,M,������
--   3, lee,�̴ܱ�,3298,  010-8471-1345,M,������
--   4, kim2,�躸��,1,  010-1111-2222,F,������
select * from CP_ZIPCODE2;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(1, 'kim','��Թ�',168,'010-1234-7890','F',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(2, 'kim1','�����',52144,'010-2234-8811','M',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(3, 'lee','�̴ܱ�',3298,'010-8471-1345','M',sysdate);
commit;
insert into cp_zipcode2(NUM, ID, NAME, SEQ, PHONE, GENDER, INPUT_DATE)
values(4, 'kim2','�躸��',1,'010-1111-2222','F',sysdate);
commit;



 ----------------------------------------------------------------------------------
-- 5. ���̵�, �̸�, ��ȭ��ȣ, �����ȣ, �ּҸ� ��ȸ�ϼ���.
--   �ּҴ� cp_zipcode1 ���̺� sido,gugun,dong �÷��� �����Ͽ� �ϳ��� ����մϴ�.
select id, name, phone, seq, (select sido||' '||gugun||' '||dong from cp_zipcode1 where cp_zipcode1.seq= CP_ZIPCODE2.seq)
from CP_ZIPCODE2;
