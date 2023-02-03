-- JDBC에서 사용할 테이블 생성
 drop table test_jdbc;
create table test_jdbc(
	num number(5),
	name varchar2(30),
	gender varchar2(30),
	height number(4,1),
	input_date date
);
commit;

alter table test_jdbc add constraint pk_test_jdbc primary key(num);

select * from user_indexes where table_name='TEST_JDBC';

select * from test_jdbc
where num = '2';

update test_jdbc
set  name = '테스트',
height = 20.0
where num='2';

commit;

create table work_jdbc(
name varchar2(30)
);
commit;
select * from WORK_JDBC;

delete from work_jdbc where name is null;
commit;
