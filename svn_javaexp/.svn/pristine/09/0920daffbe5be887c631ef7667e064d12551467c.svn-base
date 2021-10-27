--1. 테이블 구조의 변경을 위해 컬럼을 추가하거나 삭제하는 기본 형식을 기술하세요.
/*
	컬럼의 추가
	alter table 테이블명 add 컬럼명 테이터유형 [default/제약조건]
	컬럼의 삭제
	alter table 테이블명 drop column 컬럼명
 * */
--2. 직책별 최저 급여자 정보테이블 emp16을 만들고, 보너스, 부서 컬럼을 삭제하고 
--    부서명 컬럼을 추가하세요.
SELECT job, min(sal)
FROM EMP e 
GROUP BY job;
DROP TABLE emp16;
CREATE TABLE emp16
AS 
SELECT * FROM emp
WHERE (job, sal) IN (
	SELECT job, min(sal)
	FROM EMP e 
	GROUP BY job
);
SELECT * FROM emp16;
ALTER TABLE emp16 DROP COLUMN comm;
ALTER TABLE emp16 DROP COLUMN deptno;
ALTER TABLE emp16 ADD dname varchar2(30);

