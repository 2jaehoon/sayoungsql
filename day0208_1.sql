create table test_injection(
	id varchar2(20) constraint pk_test_injection primary key,
	pass varchar2(30) not null,
	name varchar2(60) not null,
	input_date date default sysdate
);

--�� ������ �߰�
insert into test_injection(id, pass, name) values('kim', '1234', '�����');
insert into test_injection(id, pass, name) values('mo', 'momo', '��ΰ�');
insert into test_injection(id, pass, name) values('yoon', 'yoon1234', '������');
insert into test_injection(id, pass, name) values('park', 'parkjh', '����ȣ');
commit;


select * from TEST_INJECTION
where id='' or 1=1 --'kim' and pass='1234';
