CREATE TABLE map(
num number,
lat number,
lng number,
rest_name varchar2(100),
info varchar2(2000)
);

drop table map;

select * from map;

insert into map(num,lat,lng,rest_name,info)
values(1,37.497672, 127.0332215, '�뵶��',
'��ġ��� �������� �͸��� ���� ������� �ظԴ� ��� �Ķ��̰� ��ǰ');


insert into map(num,lat,lng,rest_name,info)
values(2,37.4978367, 127.0329025, '�ŵ��� ������',
'ǫ��� ����� �ÿ��� ������ ���� ������');


insert into map(num,lat,lng,rest_name,info)
values(3,37.4985332, 127.0356647, '������',
'���� ������ ���� �Ұ�Ⱑ ���ִ� ��, ��� ����, ����� ���� ����');

insert into map(num,lat,lng,rest_name,info)
values(4,37.4985569, 127.0352789, '�������Ĵ�',
'���������� ���� ü���� - ���� �⺹�� ���� ��');

insert into map(num,lat,lng,rest_name,info)
values(5,37.5007394, 127.0338101, '�����μ�',
'��ġ�� ������ �뱸���� ���ִ� ��ġ��');



commit;


select num, lat, lng, rest_name, info
			from map;

			CREATE TABLE minfo2(
id varchar2(2000),
password varchar2(2000),
Cdate date

);

insert into minfo2(id, password, Cdate)
values('ex1545', 'qp8728',sysdate);

select * from minfo2;
commit;

select id, Cdate from minfo2 where id = 'ex1545' and password = 'qp8728';
