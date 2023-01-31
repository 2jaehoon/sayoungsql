--                  ����.
--1. �Ʒ��� ���õ� ������� ��й�ȣ�� ������ �����ϼ���.
--    ������ :  anony, ��й�ȣ : test1234
alter session set "_ORACLE_SCRIPT"=true;
create user anony identified by test1234;
select * from dba_users;

--2. ������ ������ �Ʒ� ���õ� ������ �ο��ϼ���.
--   ����, DB������.
grant connect, resource to anony;



--3. �ο��� ������ ��ȸ�� ������.
-- ���� Ȯ�� : dba_role_privs
select * from dba_role_privs
WHERE grantee = 'ANONY';
alter user anony default tablespace users quota unlimited on users;

--4. ������ �������� �����Ͽ� �Ʒ��� ���̺��� ����� ���ڵ带 �߰��غ�����.


create table prd(
prd_code varchar2(21),
prd_name varchar2(21),
price varchar2(24)
);
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '����Ű����','150,000');
commit;
insert into prd(prd_code, prd_name, price) values('M_0001', '���콺','10,000');
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '����Ű����','150,000');
commit;
insert into prd(prd_code, prd_name, price) values('K_0001', '���콺','10,000');
commit;

select * from prd;
--5. ������ ������ ���̺���  prd_view��� �̸����� �ܼ�view�� �����ϼ���.
grant create view to anony;
create or replace view prd_view as (select * from prd);
select * from prd_view;

--6. ������ ������ ������ ��� ��ü�� �Ʒ��� ���ϸ����� backup�ϼ���.
--    ���ϸ� :  e:/dev/query/anony_20230131_full.dmp
exp userid=anony/test1234 full=y file=e:/dev/query/anony_20230131_full.dmp;

--7. ���̺�� view�� �����ϼ���.
drop table prd;
drop view prd_view;
purge recyclebin;

--8. ����� ������ ����ؼ� ���� �ϼ���.
imp userid=anony/test1234 full=y file=e:/dev/query/anony_20230131_full.dmp;


--9. ������ �����ϼ���.
alter session set "_ORACLE_SCRIPT"=true;
revoke connect, resource from anony;
drop user anony cascade;
select * from dba_users;

