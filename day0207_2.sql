select * from user_procedures;

drop procedure test_proc;

--4. ���ε� ���� ����( out parameter�� ���� �����ϱ� ���� ���� )
-- var ������ ��������(ũ��)
--
var num number;
var name varchar2(20);
var
--5. ���� ����(����� : exec, execute)
--sql>exec ���ν�����(��, ..., :���ε� ������,...)
execute test_proc(2,7, : name);
--6. ���ε� ������ �� ���
--print ���ε� ������
print num;
