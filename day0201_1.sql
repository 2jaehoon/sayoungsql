create or replace view multi_view2 as (
select cd.deptno, dname, loc, empno, ename, job
from cp_dept cd, cp_emp ce
where cd.deptno=ce.deptno and ce.deptno in (10,20)
);

select * from multi_view2;

--��Ƽ��� ����Ʈ ����

--������Ʈ�� ��������� �����Ǿ����� �ʱ⿡ x'
-- 7698,����� ������� ���������� �ź���
update multi_view2
set ename='������'
where empno=7782;

alter table cp_dept add constraint pk_cp_dept primary key(deptno);
alter table cp_emp add constraint pk_cp_emp primary key(empno);
alter table cp_emp add constraint fk_cp_emp_deptno foreign key(deptno)
references cp_dept(deptno);

--delte 7698 ��� ����
delete from multi_view2 where empno=7782;

select * from multi_view2;


--index �˻� DD : user_indexes
select * from user_indexes;






select rowid, empno from emp;
select rowid, deptno from dept;
select rowid, zipcode,sido,gugun from zipcode;


create table cp_zipcode3 as (select * from zipcode where 1=0);
insert into cp_zipcode3 (select * from zipcode);
select count(*) from cp_zipcode3;


select * from user_indexes
where table_name = 'ZIPCODE';

--zipcode�� �ߺ��Ǳ� ������ �ε����� ������ �� ����.
create unique index ind_zipcode on zipcode(zipcode);

create unique index ind_zipcode on zipcode(seq);

select * from user_ind_columns
where table_name='ZIPCODE';

create table zipcode_cp as ( select * from zipcode);

--non unique index : �÷����� �ߺ��� �� �����ϴ� �ε���
create index ind_cp_zipcode on cp_zipcode3(seq);

select * from user_indexes
where table_name in ('ZIPCODE','CP_ZIPCODE3','ZIPCODE_CP');


--�ε��� �籸��
alter index pk_primary_table rebuild;


--�ε����� ������� ���� �˻� : full scan
-- zipcode_cp �ε����� �������� �ʴ� ���̺�
select zipcode, sido, gugun, dong, bunji, seq
from zipcode_cp
where seq between 50000 and 50100;
--ctrl p cpu cost, io cost

select /**+ index(seq) */zipcode, sido, gugun, dong, bunji, seq
from cp_zipcode3
where seq between 50000 and 50100;

--�ε����� ����� �˻� => H/W�� �ڿ��� ���� ����ϹǷ� �˻� �����
-- ������ ���´�.
-- zipcode ���̺��� �ε����� ����
-- index hint : Oracle DBMS���� ������ �ε����� ����Ͽ� �˻��ϵ��� �����ϴ� ��
-- ��ȸ�÷��� /*+ index(�÷���) �ε�����*/
select /*+ index(seq) ind_zipcode */ zipcode, sido, gugun, dong, bunji, seq
from zipcode
where seq between 50000 and 50100;

select * from user_indexes
where table_name = 'ZIPCODE';

--�ε��� ����
drop index ind_zipcode;


insert into cp_dept(deptno,dname,loc) values(99,'�','����');

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
