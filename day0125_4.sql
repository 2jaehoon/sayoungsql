insert into cp_emp3 (select empno, ename, deptno, job, sal from emp);


--select 단수행 subquery


--emp테이블에서 사원명이 'KING'인 사원의 부서번호를 조회하여 CP_EMP3 테이블에서
--같은 부서 사원 정보를 조회
SELECT *
FROM CP_EMP3
WHERE DEPTNO =(SELECT DEPTNO
FROM EMP
WHERE ENAME = 'KING');


--EMP테이블에서 평균연봉보다 적게 받는 사원의 사원번호, 사원명, 연봉을 검색하세요
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < (SELECT AVG(SAL) FROM EMP);



select * from CP_EMP3;
