--����

select * from user_procedures;

--���ε� ���� ����
var r refcursor

-- ���ν��� ���� : golden������ ����� ���ÿ� ��ȸ���
exec select_all_cp_emp( :r )