/*
 # subquery
 	1. 개요
 		하나의 SQL 명령문의 결과를 다른 SQL 명령문에 전달하기 위해 두 개 이상의 SQL 명령문을 하나의 SQL 명령문으로 연결하여 처리하는 방법
 		서브쿼리의 필요성
 		ex) 교수 테이블에서 '전은지' 교수와 직급이 동일한 모든 교수의 이름 검색
 	2. 처리 방식
 		1) 교수 테이블에서 '전은지' 교수의 직급 검색 SQL 명령문 실행
 		2) 교수 테이블의 직급 컬럼에서 1 에서 얻은 결과 값과 동일한 직급을 가진 교수 검색 명령문 실행
 		3) 위 과정을 통합하여 하나의 SQL 명령문으로 처리
 */
-- SMITH와 동일한 부서의 사원정보를 출력하세요.
SELECT *
FROM emp
WHERE deptno = (
	SELECT deptno
	FROM emp
	WHERE ename = 'SMITH');
SELECT * FROM emp;

-- ex1) WARD와 같은 직책에 있는 사원 정보를 출력하세요.
SELECT *
FROM emp
WHERE job = (
	SELECT job
	FROM emp
	WHERE ename = 'WARD');
-- ex2) KING을 관리자로 둔 사원정보를 출력하세요.
SELECT *
FROM emp
WHERE mgr = (
	SELECT empno
	FROM emp
	WHERE ename = 'KING');
-- ex3) JAMES와 같은 입사월에 있는 사원정보를 출력하세요.
SELECT *
FROM emp
WHERE to_char(hiredate, 'MM') = (
	SELECT to_char(hiredate, 'MM')
	FROM emp
	WHERE ename = 'JAMES');