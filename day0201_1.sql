create or replace view multi_view2 as (
select cd.deptno, dname, loc, empno, ename, job
from cp_dept cd, cp_emp ce
where cd.deptno=ce.deptno and ce.deptno in (10,20)
);

select * from multi_view2;

--멀티뷰는 셀렉트 가능

--업데이트는 제약사항이 설정되어있지 않기에 x'
-- 7698,사원의 사원명을 윤상준으로 ㅕ변경
update multi_view2
set ename='윤상준'
where empno=7782;

alter table cp_dept add constraint pk_cp_dept primary key(deptno);
alter table cp_emp add constraint pk_cp_emp primary key(empno);
alter table cp_emp add constraint fk_cp_emp_deptno foreign key(deptno)
references cp_dept(deptno);

--delte 7698 사원 삭제
delete from multi_view2 where empno=7782;

select * from multi_view2;


--index 검색 DD : user_indexes
select * from user_indexes;






select rowid, empno from emp;
select rowid, deptno from dept;
select rowid, zipcode,sido,gugun from zipcode;


create table cp_zipcode3 as (select * from zipcode where 1=0);
insert into cp_zipcode3 (select * from zipcode);
select count(*) from cp_zipcode3;


select * from user_indexes
where table_name = 'ZIPCODE';

--zipcode가 중복되기 때문에 인덱스로 생성될 수 없다.
create unique index ind_zipcode on zipcode(zipcode);

create unique index ind_zipcode on zipcode(seq);

select * from user_ind_columns
where table_name='ZIPCODE';

create table zipcode_cp as ( select * from zipcode);

--non unique index : 컬럼값이 중복될 때 생성하는 인덱스
create index ind_cp_zipcode on cp_zipcode3(seq);

select * from user_indexes
where table_name in ('ZIPCODE','CP_ZIPCODE3','ZIPCODE_CP');


--인덱스 재구축
alter index pk_primary_table rebuild;


--인덱스를 사용하지 않은 검색 : full scan
-- zipcode_cp 인덱스가 존재하지 않는 테이블
select zipcode, sido, gugun, dong, bunji, seq
from zipcode_cp
where seq between 50000 and 50100;
--ctrl p cpu cost, io cost

select /**+ index(seq) */zipcode, sido, gugun, dong, bunji, seq
from cp_zipcode3
where seq between 50000 and 50100;

--인덱스를 사용한 검색 => H/W의 자원을 적게 사용하므로 검색 결과가
-- 빠르게 나온다.
-- zipcode 테이블은 인덱스가 존재
-- index hint : Oracle DBMS에게 지정한 인덱스를 사용하여 검색하도록 설정하는 것
-- 조회컬럼에 /*+ index(컬럼명) 인덱스명*/
select /*+ index(seq) ind_zipcode */ zipcode, sido, gugun, dong, bunji, seq
from zipcode
where seq between 50000 and 50100;

select * from user_indexes
where table_name = 'ZIPCODE';

--인덱스 삭제
drop index ind_zipcode;


insert into cp_dept(deptno,dname,loc) values(99,'운영','서울');

update cp_dept
set  dname = 'QA'
where deptno=98
;

update cp_emp
set hiredate=sysdate


where deptno=20;
;

delete from cp_emp where deptno=20;
select * from CP_EMP2;
