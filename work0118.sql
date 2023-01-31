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
values(1,'�����', 'A', 'tae@sist.co.kr','010-1234-5678','��⵵ ���ν�','����',91,sysdate);
 commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(2,'��Թ�', 'A', 'kim@daum.net','010-7739-9761','����� ������ ����1��','����',90,sysdate);
     commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(3,'������', 'A', 'sang@test.com','010-5878-8813','����� ���۱� �󵵵�','����',97,sysdate);
      commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(4,'�躸��', 'B', 'kyoung@google.com','011-234-7611','����� ���빮�� ���빮��','����',190,sysdate);
    commit;
insert into Student(NUM, NAME, CLASS, EMAIL, PHONE,
ADDR, SEX, JAVASCORE, INPUTDAY)
values(5,'��ΰ�', 'B', 'min@sist.co.kr','010-4334-7656','��õ�� ���� ����3��','����',89,sysdate);
  commit;

--3. 1������ ������ ���̺��� ����Ͽ� ��� ���ڵ�� ��� �÷��� ��ȸ�ϼ���.
select *
from student;
--4. 1������ ������ ���̺��� ����Ͽ� �̸�, ��, �ּ�, �ڹ������� ��ȸ�ϼ���.
select NAME, CLASS, ADDR, JAVASCORE
from student;
--5. 3�� �л��� ������ �����ڡ��� ������ 90������ ���� A, ��ȭ��ȣ�� 010-2234-7611���� �������ּ���.
update student
set sex='����', JAVASCORE=90, CLASS='A', PHONE='010-2234-7611'
where num = 3;
 commit;
--�̸��� ����Թ�'�̸鼭 ���� ��A������ �л��� ���� ��B����, ��ȭ��ȣ�� 010-1111-2341 �� �������ּ���.
update student
set class='B', PHONE='010-1111-2341'
where name = '��Թ�'and class='A';


commit;
--7.  ���� A���� �л��� ��� �����غ�����.
delete
from student
where class='A';

--8. 7������ ������ ���ڵ带 ��� ������ ������.
rollback;

--9. 1������ �����ȵ� ���̺� ��ü�� ������ ������.
drop table student;

--9. �������� Ȯ���ϰ�, �����뿡 ������ ���̺��� �����غ�����.
--sqlplus���� Ȯ�ΰ���
show recyclebin
flashback table student to before drop;
 --10. ���̺��� ��� ���ڵ带 �����غ�����.
truncate table student;
--11. ���̺���ü�� ���� �غ�����.
drop table student;
--12. �������� ������ Ȯ���ϰ�, �������� ���������.
show recyclebin;
purge recyclebin;


commit;


