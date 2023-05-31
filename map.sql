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
values(1,37.497672, 127.0332215, '대독장',
'김치찌개의 맛집으로 귀리를 넣은 밥과직접 해먹는 계란 후라이가 일품');


insert into map(num,lat,lng,rest_name,info)
values(2,37.4978367, 127.0329025, '신동궁 감자탕',
'푹삶ㅎ은 등뼈와 시원한 국물이 좋은 감자탕');


insert into map(num,lat,lng,rest_name,info)
values(3,37.4985332, 127.0356647, '오토코',
'불향 가득한 오삼 불고기가 맛있는 집, 찌개는 서비스, 공기밥 무한 리필');

insert into map(num,lat,lng,rest_name,info)
values(4,37.4985569, 127.0352789, '새마을식당',
'백종원씨가 만든 체인점 - 맛의 기복이 없는 집');

insert into map(num,lat,lng,rest_name,info)
values(5,37.5007394, 127.0338101, '마구로센',
'런치로 알탕과 대구탕이 맛있는 참치집');



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
