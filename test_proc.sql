--���� �� ���� �Է�(in parameter) �޾Ƽ� �����ϰ� out parameter��
-- �����ϴ� procedure

-- procedure�� ��ȯ���� ����, out parameter�� ����Ͽ� ��ȯ
-- 1. ����
create or replace procedure test_proc(num in number, num2 number,
result out number)
is

begin

 result := num + num2;
end;
/


--2. ����
--3. ������ :  sql>@���ϸ�.sql  ��翡�� f5�� ������ �����ϵ�
--4. ���ε� ���� ����( out parameter�� ���� �����ϱ� ���� ���� )
-- var ������ ��������(ũ��)
--5. ���� ����(����� : exec, execute)
--sql>exec ���ν�����(��, ..., :���ε� ������,...)
--6. ���ε� ������ �� ���
--print ���ε� ������

