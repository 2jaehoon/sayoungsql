
 -- ���� �����ϰ� �ִ� ���� Ȯ�� sqlplus��
show user;
 -- ���̺��� ���� �˼� �ִ� sqlplus��
desc test1;


select * from TEST1;

--���ڿ��� ũ�⺸�� ū �� �߰�
insert into test1(name) values('����°��°���');


--������ ũ�⺸�� ū �� �߰�
insert into test1(name) values(1111);

delete from test1 where name='1111';

select * from STUDENT;

--where���� ������� ������ ��� ���ڵ带 �����Ѵ�.
update student
set name = '������', phone='010-1234-5678'
where num=3;

commit;

--�̸��� ������� �л��� ��ȭ��ȣ�� 010-2222-3333 ���̸� 26,
--�������� b������ ����

update student
set phone = '010-2222-3333', age = 26, BLOOD_TYPE = 'B'
where name = '�����';


--delete---------------------------------------
-- ��� ���ڵ� ����
delete from student;

rollback;

--Ư�� ���ڵ常 ����
--���̰� 26�� ���ڵ带 ����
delete from student
where age = 26;

select * from STUDENT;

--���̰� 26�̸鼭 �̸��� ������� ���ڵ带 ��������
delete from student
where age = 26 and name = '�����';

delete from student
where age between 25 and 26;


------------------truncate-----------------------------------
--�л����̺� ��� ���ڵ带 ����

truncate table student;

select * from STUDENT

rollback;















