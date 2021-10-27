/*
# 테이블 구조의 변경.
1. 개요
	테이블을 사용하다보면 여러가지 상황에 따라 테이블의 구조를 변경하는
	경우가 발생한다. 테이블의 구조를 변경하는데 필요한 명령어를 파악하고,
	테이블 구조의 변경시 발생하는 데이터 처리에 대한 내용을 파악해보자.
	1) 유형
	컬럼의 추가, 컬럼의 삭제, 컬럼의 속성의 변경, 제약조건의 변경 등등.
2. 컬럼의 추가
	alter table 테이블명
	add 컬럼명 데이터유형 [default 디폴트데이터, 제약조건]	
 * */
DROP TABLE emp14;
CREATE TABLE emp14
AS SELECT empno, ename, job, sal FROM emp;
SELECT * FROM emp14;
ALTER TABLE emp14
ADD address varchar2(20) DEFAULT '주소입력없음';
SELECT * FROM emp14;
-- ex) emp15으로 부서명, 사원명, 직책, 급여로 복사테이블을 만들고,
--  해당 테이블에 bonus 컬럼을 추가하고, default데이터로 0을 입력처리하세요.
-- [3조]
DROP TABLE emp15;
CREATE TABLE emp15
AS SELECT dname, ename, job, sal 
	FROM emp e, dept d 
WHERE e.deptno=d.deptno;
SELECT * FROM emp15;
ALTER TABLE emp15
ADD bonus NUMBER DEFAULT 0;
-- # default는 테이블 생성시에도 컬럼명 데이터유형 default 기본데이터로
--    설정이 가능하다.
/*
# 컬럼의 삭제
alter table 테이블명 drop column 컬럼명;
 * */
SELECT * FROM emp15;
ALTER TABLE emp15
DROP COLUMN job;
-- ex) 부서별 최고급여자의 테이블을 emp16으로 만들고,
--     deptno 컬럼을 삭제처리하세요.[4조]
SELECT deptno, max(sal)
FROM EMP e 
GROUP BY deptno;
CREATE TABLE emp16
AS SELECT *
FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM EMP e 
	GROUP BY deptno
);
SELECT * FROM emp16;
ALTER TABLE emp16
DROP COLUMN deptno;









