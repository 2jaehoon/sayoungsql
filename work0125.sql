--����1.
-- ��� ���̺��� ������ 1500~3000������ �����
--  �����ȣ, �����, ����, �Ի���, �μ���ȣ, ����, �Ŵ�����ȣ�� ��ȸ�� ���ڵ带 ����Ͽ�
--  emp_work���̺��� �����ϰ� �߰��մϴ�.
create table emp_work as(
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from emp
where sal between 1500 and 3000);

select * from EMP_WORK;
commit;

--����2.
--  emp���̺��� 10�� 30�� �μ��� ��� ������ ��ȸ�Ͽ� emp_work���̺�
--  ��ȸ ����� �߰��մϴ�.
--   ��, �����ȣ�� ��ȸ�� �����ȣ�� 1000�� ���� ������ �߰��� ��.
--      ���� data 7788 -> insert 8788
insert into emp_work(EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR)
(select EMPNO+1000, ENAME, SAL, HIREDATE,DEPTNO, JOB, MGR
from emp
where deptno in (10,30));

select * from EMP_WORK;
commit;



--���� 3.
-- emp_work ���̺��� 10�� �μ��� �ٹ��ϴ� ������� ������  emp���̺���
--  �����ȣ�� 7698�� ��� ������ 7782�� ����� ������ ���� �ݾ����� �����ϼ���.
update emp_work
set sal = (select sal from emp where empno=7698) + (select sal from emp where empno=7782)
where deptno = 10;


select * from EMP_WORK;
commit;



--����4. emp_work ���̺� �Ʒ��� ���� ���ڵ带 �߰��ϼ���.
--�����ȣ : emp_work�ǰ��� ������ �����ȣ���� 1 ������ ��ȣ, ����� :������, ���� : ������,
--  �Ի��� : �߰��Ǵ� ������ ������
insert into emp_work(empno, hiredate, ename, job) values(
(select max(empno)
from emp_work)+1, sysdate+1, '������', '������');

select * from EMP_WORK;
commit;


--����5.�Ʒ��� ���� ���ڵ带 ������ �� �ִ�  sales���̺��� �����ϰ� ���ڵ带 �߰��ϼ���.
-- ��ȣ : 1, ��ǰ�� : Ű����, ���� : 20000, �Ǹ��� : ��2023-01-25��, ���� : 1
-- ��ȣ : 2, ��ǰ�� : ���콺, ���� : 27000, �Ǹ��� : ��2023-01-25��, ���� : 1
-- ��ȣ : 3, ��ǰ�� : �����, ���� : 350000, �Ǹ��� : ��2023-01-25��, ���� : 1
-- ��ȣ : 4, ��ǰ�� : Ű����, ���� : 23000, �Ǹ��� : ��2023-01-25��, ���� : 1
-- ��ȣ : 5, ��ǰ�� : Ű����, ���� : 15000, �Ǹ��� : ��2023-01-25��, ���� : 1
-- ��ȣ : 6, ��ǰ�� : Ű����, ���� : 20000, �Ǹ��� : ��2023-01-26��, ���� : 1
-- ��ȣ : 7, ��ǰ�� : ���콺, ���� : 13000, �Ǹ��� : ��2023-01-26��, ���� : 1
-- ��ȣ : 8, ��ǰ�� : Ű����, ���� : 22000, �Ǹ��� : ��2023-01-26��, ���� : 1

create table sales(
num char(1),
name varchar(9),
price number(6),
saleday char(10),
amount char(1)
);
commit;
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(1, 'Ű����', 20000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(2, '���콺', 27000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(3, '�����', 350000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(4, 'Ű����', 23000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(5, 'Ű����', 15000, '2023-01-25', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(6, 'Ű����', 20000, '2023-01-26', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(7, '���콺', 13000, '2023-01-26', 1);
insert into sales(num, NAME, PRICE, SALEDAY, AMOUNT) values(8, 'Ű����', 22000, '2023-01-26', 1);

select * from sales;
commit;




--���� 6. ��ǰ��, �Ѱ���, �ǸŰǼ�, �Ǹ���, �Է��� �� ������ �� �ִ�  sales_adjustment ���̺��� �����ϼ���.
create table sales_adjustment as(select NAME, PRICE totalprice, AMOUNT amountcount, SALEDAY, SALEDAY inputday
from sales where 1=2
);

commit;

--����7. sales ���̺��� ��2023-01-25�� �� �Ǹŵ� ��ǰ�� ��ǰ��, �Ѱ���, �ǸŰǼ� ��  sales_adjustment
--    ���̺� �߰��ϼ���. -����
--   �߰�   ��)
--     Ű����, 58000, 3, 2023-01-25, ����
--     ���콺 , 27000,1,  ���͵���
--     �����, 350000,1, ���͵���

insert into SALES_ADJUSTMENT (name, toalprice, amountcount, saleday, inputday)
(select NAME, sum(price), count(amount), min(saleday), sysdate  --sale�� min�� �־�ǰ� max�� �־�ȴ�.  ������ �ɾ���⿡
from SALES
where saleday = '2023-01-25'
group by name);
commit;

rollback;
select * from SALES;
select * from SALES_ADJUSTMENT;


