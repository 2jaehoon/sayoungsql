-- student ���̺� ���ڵ带 �߰�
-- �÷Ÿ��� ���� (�÷��� ������� ���� �����Ͽ� �߰�)

--��Ʈ�� ���͸� ���� �� �� ��Ʈ�� ���� ģ �� �� ��;���� ���� ;���� ����

insert into student values(1,'�����','010-1234-5678',
'kim@test.com',25,'900001-1234567','A',182.5,74.23,sysdate);

--���� ���� �� �ִ�.

insert into student values(1,'010-1234-5678','������',
'kim@test.com',25,'900001-1234567','A',182.5,74.23,sysdate);


select * from STUDENT;

--�÷��� ����Ͽ� �߰�

insert into student(NUM, NAME, PHONE, EMAIL, AGE, SSN,
 BLOOD_TYPE, HEIGHT, WEIGHT, INPUT_DATE)
 values(3,'������', '010-1234-1234', 'lee@daum.net', 25,
  '910101-1331313', 'AB', 172.9, 83.12, '2023-01-16');


  --���̺� �÷��� ������ ������� ���� �߰��� �� �ִ�.
  insert into student(NAME, AGE, SSN, PHONE, EMAIL,
	BLOOD_TYPE, HEIGHT, WEIGHT, NUM, INPUT_DATE)
	values('�̴ܱ�',26,'921212-1234567','010-4321-9876',
	 'test@naver.com', '0', 185.4, 67.3, 4, sysdate);

	 --�÷��� �����Ͽ� �߰��� �� �ִ�.(���� �����ϴ� �÷��� �߰�)
	 --(�÷��� �����Ǹ� null�� �Է�)
	 insert into student(num,name,ssn) values(5,'Ȳ�濬','880101-1234567');

  select * from STUDENT;






		create table test1(
		name varchar2(15),
		age number(3));


		select * from test1;





		update test1
		set age=30
		where name='�����1';
         	select * from test1;
		commit;


    select * from TEST1;

    --Ʈ����� ��� �ٷ� �� Ŀ�� ���ı��� �� ��ҵ�
    insert into test1(name, age) values('�̹���', 25);
    insert into test1(name, age) values('�̹���1', 22);

rollback;

