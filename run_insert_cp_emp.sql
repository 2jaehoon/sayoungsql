select * from user_procedures;

--4. ���ε� ���� ����
var r number
var m varchar2(100)

--5. ���ν����� ��������
exec insert_cp_emp(1111, '������', '������',3000, 20, :r, :m);

--6. bind ������ �Էµ� �� Ȯ��
 print r
 print m;


select * from CP_EMP;

var;
