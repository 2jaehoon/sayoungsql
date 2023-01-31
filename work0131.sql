--                  숙제.
--1. 아래에 제시된 계정명과 비밀번호로 계정을 생성하세요.
--    계정명 :  anony, 비밀번호 : test1234
alter session set "_ORACLE_SCRIPT"=true;
create user anony identified by test1234;
select * from dba_users;

--2. 생성된 계정에 아래 제시된 권한을 부여하세요.
--   접속, DB사용권한.
grant connect, resource to anony;



--3. 부여된 권한을 조회해 보세요.
-- 권한 확인 : dba_role_privs
select * from dba_role_privs
WHERE grantee = 'ANONY';
alter user anony default tablespace users quota unlimited on users;

--4. 생성된 계정으로 접속하여 아래의 테이블을 만들고 레코드를 추가해보세요.


create table prd(
prd_code varchar2(21),
prd_name varchar2(21),
price varchar2(24)
);
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '기계식키보드','150,000');
commit;
insert into prd(prd_code, prd_name, price) values('M_0001', '마우스','10,000');
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '기계식키보드','150,000');
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '마우스','10,000');
commit;

select * from prd;
--5. 계정이 생성한 테이블을  prd_view라는 이름으로 단순view를 생성하세요.
grant create view to anony;
create or replace view prd_view as (select * from prd);
select * from prd_view;

--6. 생성된 계정이 생성한 모든 객체를 아래의 파일명으로 backup하세요.
--    파일명 :  e:/dev/query/anony_20230131_full.dmp
exp userid=anony/test1234 full=y file=e:/dev/query/anony_20230131_full.dmp;

--7. 테이블과 view를 삭제하세요.
drop table prd;
drop view prd_view;
purge recyclebin;

--8. 백업한 파일을 사용해서 복원 하세요.
imp userid=anony/test1234 full=y file=e:/dev/query/anony_20230131_full.dmp;


--9. 계정을 삭제하세요.
alter session set "_ORACLE_SCRIPT"=true;
revoke connect, resource from anony;
drop user anony cascade;
select * from dba_users;

