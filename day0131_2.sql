select * from dba_role_privs
where grantee = 'SCOTT';

--계정 조회 : dba_users

select *
from dba_users;

--계정 생성


--1. _ORACLE_SCRIPT를 사용하도록 변경
alter session set "_ORACLE_SCRIPT"=true;

--2. 계정생성
create user ljh identified by 1234;

select * from dba_users;
-- 권한 확인 : dba_role_privs

select * from dba_role_privs
where grantee='LJH';

--권한 부여
-- 접속 권한
grant connect to ljh;
--DBF파일 사용 권한 : table 생성되는데 tablespace에 저장될 수 없다.
grant resource to ljh;
--tablespace 사용권한 부여
alter user ljh default tablespace users quota unlimited on users;


create sequence seq
increment by 1
start with 1
maxvalue 9999999;



-- 권한 회수
-- c##이 사용되지 않은 계정을 사용하려면 _ORACLE_SCRIPT를 사용해야 한다.
alter session set "_ORACLE_SCRIPT"=true;

revoke connect from ljh;

select * from dba_role_privs
where grantee='LJH';

grant connect to ljh;

--계정 삭제
-- 접속중인 계정은 삭제할 수 없다.
drop user ljh cascade;

select * from user_tab_columns;
select * from user_tab_cols;

select * from user_synonyms;


select * from dba_sys_privs
where grantee = 'SCOTT';

--synonym 생성 권한 부여
grant create synonym to scott;

--synonym 생성권한 회수
revoke create synonym from scott;

--scott 접속
--시노님 생성
create synonym zip for zipcode;
create synonym ce for cp_emp3;

--생성된 시노님 확인
select * from user_synonyms;

--시노님 명 사용
select * from Ce;
select * from zip;
--원본 테이블 명 사용
select * from cp_emp3;


insert into ce(empno, ename, deptno)
values(1111,'윤상준', 20);

--시노님 삭제
drop synonym ce;

select * from user_synonyms;

--시노님 권한 회수( 관리자 )
revoke create synonym from scott;


select * from dba_sys_privs
where grantee = 'SCOTT';

--권한 회수가 되었더라도 생성되어 있는 시노닝을 사용할 수 있다.
select * from zip;

drop synonym zip;

-- 권한이 있는 계정만 view 생성
create view ce as (select empno, ename, job from cp_emp3);


--권한부여 : 관리자 계정만 가능

grant create view to scott;

select * from dba_sys_privs
where grantee='SCOTT';

--scott 접속
-- 단순 view 생성 : 하나의 테이블에서 도출된 view,
-- 함수나 연산을 사용하지 않고 도출된 view ( 도출된 테이블과 view 동일 => dml 가능)

-- 같은 이름의 view가 존재하면 error
create view ce as (select * from cp_emp3);

-- 같은 이름의 view가 존재하면 치환 생성
create or replace view ce as (select * from cp_emp3);

--DD :  user_views

select * from user_views;

--view DML 가능 단순 view이기에
select * from ce;

--view를 통한 insert : view에 insert를 수행하면 도출된 테이블에 레코드가 추가된다.
insert into ce(empno, ename, deptno) values(2222, '테스트', 10);
commit;

-- view를 통한 update :
--view에 update를 수행하면 도출된 테이블에 레코드가 변경된다.
update ce
set ename = '익명', job='MANAGER', sal = 3000
where empno = 2222;
commit;

--view를 통한 delete :
--view에 delete를 수행하면 도출된 테이블에 레코드가 삭제된다.
delete
from ce
where empno=2222;
commit;

--실제 테이블에 반영
select * from cp_emp3;


--view 삭제
drop view ce;

select * from user_views;
