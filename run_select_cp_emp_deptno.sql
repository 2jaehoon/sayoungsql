select * from user_procedures;

--���ε� ���� ����
var cur REFCURSOR

-- ���ν��� ����
exec select_cp_emp_deptno(50, :cur);
