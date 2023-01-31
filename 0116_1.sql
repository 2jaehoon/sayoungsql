--학생 테이블 생성

create table student(
num number,
name varchar2(15),
phone varchar2(13),
email varchar2(50),
age number(3),
ssn char(14),
blood_type varchar2(2),
height number(4,1),
weight number(5,2),
input_date date
);
--edit에서 스페이스바나 이런 것도 조심해야함