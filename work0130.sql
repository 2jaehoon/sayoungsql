--����.
--1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
--    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
--   ��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
--     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
--     �Է����� ��-��-�� �� �������� ��� �Ұ�.
select country, maker, model, CAR_YEAR, PRICE, CAR_IMG, input_date, cc, CAR_OPTION
from(
select COUNTRY, cc.MAKER, cma.MODEL, to_char(CAR_YEAR,'9,999') CAR_YEAR,
to_char(PRICE,'9,999') PRICE, CAR_IMG, to_char(sysdate,'mm-dd-yyyy') input_date,
row_number() over(order by cc desc) CCn
, cc, substr(cmo.CAR_OPTION,1, instr(cmo.CAR_OPTION,',')-1) CAR_OPTION
from CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where (cma.maker=cc.maker) and (cmo.model = cma.model)and (cmo.cc between 1500 and 3000)
)
where ccn between 3 and 6;

--2. �μ���ȣ�� 10, 30,40���� ��� �μ��� �����ȣ,�����,�Ի���,
--   ����,��������,�μ���,�μ���ȣ,��ġ, �����ȣ,�õ�, ����,��,���� �� ��ȸ.
--  ��,����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
--   �����ȣ�� '-' �ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü
--  �Ͽ� ��� ,�Ի����� ��-��-�� ���ϱ��� ���  ( emp �����ȣ�� zipcode SEQ�÷��� �������� ���)

commit;
select * from zipcode;

select  EMPNO, rrn, ENAME, HIREDATE, SAL, SALrn, DNAME, DEPTNO, LOC, zipcode, SIDO, GUGUN, DONG, Bunzi
from(
select  EMPNO,
row_number() over(order by empno) rrn,
 ENAME, to_char(HIREDATE,'mm-dd-yyyy') HIREDATE, SAL, row_number() over(order by SAL desc) SALrn, DNAME,
 d.DEPTNO, LOC, substr(ZIPCODE,instr(zipcode,'-')+1) zipcode , SIDO, GUGUN, DONG, nvl(z.BUNJI,'��������') bunzi
from dept d, emp e, ZIPCODE z
where e.DEPTNO(+)=d.DEPTNO and e.empno(+)=z.seq and d.deptno in(10,30,40)
)
where rrn between 2 and 5;



--3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
-- �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ
--  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����
--   �Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
--   ��������� ������ Bmw, Audi �� �������� ��� .

select COUNTRY, initcap(cc.MAKER) MAKER, cma.MODEL,CAR_YEAR, PRICE, CAR_OPTION,
'�̹����� : '||substr(CAR_IMG,1,instr(CAR_IMG,'.')-1)||'  Ȯ���� : '||substr(CAR_IMG,instr(CAR_IMG,'.')+1) img ,CC
from CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where cc.MAKER in('����','���','�Ｚ','BMW','AUDI') and CAR_OPTION like '%ABS%' and CAR_OPTION like '%TCS%'
order by CAR_YEAR desc, price desc;



--4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ ��ȣ, �𵨸�, ������,
--  ������,����,������ �Ʒ��� ���� ������ �������� ���.
--  ��,��ȣ�� 1������ ����ϰ�,
--   ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
--   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
--   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
select rownum, model||'������ ������[ '||car_year||' ]�̰�, �������� [ '|| country||' ]�̸�,  [ '
||maker||' ]�簡 �������Դϴ�. ������ [ '||to_char(rpad(price,8,'0'),'99,999,999')||' ]�� �Դϴ�.' print
from(
select  cma.MODEL, COUNTRY, cma.MAKER, row_number() over(order by price) pricenum,price, CAR_YEAR
from CAR_MAKER cma, CAR_COUNTRY cc, CAR_MODEL cmo
where (cma.maker=cc.maker) and (cmo.model = cma.model) and cma.model in('K5', '�ƹ���', '�ҷ���', 'A8', 'SM3')
)
where pricenum between 2 and 7;






--5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ�ϼ���.
select car_year,model, sum(price)
from(
select CAR_YEAR, cma.MODEL, price
from CAR_MAKER cma, CAR_MODEL cmo
where cmo.model = cma.model and maker = '����'
)
group by rollup(CAR_YEAR,model);

--6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
--   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
--   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ
--   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
--     �����λ���� �μ���ȣ�� ���� ���� �λ�
--     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
--     ����Ͽ� 3�ڸ����� ,�� �־� ���.
--     ��� ����� �ҹ��ڷ� ���.
--     ( emp �����ȣ�� zipcode SEQ�÷��� �������� ���)
select EMPNO, ENAME, HIREDATE, SAL, tax, realmoney, moneyup, deptno,
DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from(
select instr(ename,'S',-1,1) S, instr(ename,'A',3) a, EMPNO, ENAME, HIREDATE, SAL,comm,
sal*0.033 tax, round((SAL+sal/12+nvl(comm,0)-(sal*0.033))) realmoney,e.DEPTNO,DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI,
case e.deptno when 10 then to_char(sal*1.07,'9,999')
						when 20 then  to_char(sal*1.04,'9,999')
						when 30 then  to_char(sal+nvl(comm,0)*0.1,'9,999')
											else
											to_char(sal*1.03,'9,999')
					end moneyup

from emp e,DEPT d, zipcode z
where (e.deptno = d.deptno) and (e.empno = z.seq)
)
where s = 5 and a=3;


--					7.  �Ʒ� ���õ� Data Dictionary�� �ľ��� ��,  Dictionary�� ����Ͽ�
--   emp ���̺� �÷���,��������, ũ��, default��, ������׸��� ��ȸ�ϼ���.
--    ��, ũ��� ������ ��� 22�ڰ� �ƴ� ���� ũ�⸦ ���. (���� ����)
--    Dictionary :  user_tab_cols , user_cons_columns, user_constraints
select * from user_tab_cols where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_constraints where table_name = 'EMP';


-- ũ��
--number �� ��� data_precision, data_scale �� Ȯ��
--data_precision �� ��ü �ڸ���
--data_scale �� �Ҽ��� �ڸ���
--number(5, 2) �� ��� ������ 3�ڸ� �Ҽ��� 2�ڸ�
-- data_precision �� �ִ� 38 ���� ����
select column_name,data_type, data_precision, data_default, constraint_name
from user_tab_cols utc, user_constraints uc
where utc.table_name = 'EMP' and (utc.table_name = uc.table_name);






