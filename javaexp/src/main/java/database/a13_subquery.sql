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
 	3. 실행 순서
 		1) main query에 최하단에 있는 부분부터 실행해서 결과를 가지고 상위에 있는 query로 전달한다.
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
	
/*
 # 서브쿼리의 종류
 	1. 단일 행 서버 쿼리
 		- 서버 쿼리의 결과 값이 단일 데이터로 조건에서 사용할 때 활용된다.
 		- 비교연산자( = , > , < , >= , <= , != )등 활용할 수 있다.
 
 	2. 다중 행 서버 쿼리
 		- 서버 쿼리의 결과 값이 다중으로 조건에서 사용할 때 활용된다.
 		- 다중 행 비교연산자 : in, any, some, all, exists 등을 활용할 수 있다.
 */

-- 단일 행 서버 쿼리
-- 부서 10에서 가장 급여가 높은 사원의 정보를 출력하세요.
SELECT max(sal)
FROM emp
WHERE deptno = 10;
SELECT *
FROM emp
WHERE sal = (
	SELECT max(sal)
	FROM emp
	WHERE deptno = 10);
	
-- 부서 20에서 평균 급여보다 높은 사원의 정보를 출력하세요.
SELECT *
FROM emp
WHERE sal < (
	SELECT avg(sal)
	FROM emp
	WHERE deptno = 20);
	
SELECT * FROM emp;
-- ex1) 부서번호 20에서 가장 적은 연봉보다 같거나 적은 사원들을 출력하세요.
SELECT *
FROM emp
WHERE sal > (
	SELECT min(sal)
	FROM emp
	WHERE deptno = 20);

-- ex2) 2사분기에 입사한 사원들의 평균 급여보다 많은 사원들을 출력하세요.
SELECT *
FROM emp
WHERE sal > (
	SELECT avg(sal)
	FROM emp
	WHERE to_char(hiredate,'Q') = 2);

-- ex3) comm이 가장 많은 사원의 정보를 출력하세요.
SELECT *
FROM emp
WHERE comm = (
	SELECT max(comm)
	FROM emp);

-- 다중 행 subquery
-- 연봉이 1000~3000 사이의 직책에 해당하는 사원을 출력
SELECT * FROM emp;

SELECT *
FROM emp
WHERE job IN (
	SELECT DISTINCT job
	FROM emp
	WHERE sal BETWEEN 1000 AND 2000);

SELECT *
FROM emp;


SELECT *
FROM emp
WHERE (sal, deptno) IN (
	SELECT sal, deptno FROM emp WHERE sal >= 5000);

-- 부서별로 연봉이 가장 높은 사원 정보 출력
SELECT *
FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno)
ORDER BY deptno;

/*
 위의 그룹이 다중으로 설정되었기 때문에 원하는 결과 값을 가져올 수 없다.
 SELECT empno, ename, deptno, max(sal) (X)
 FROM emp
 GROUP BY empno, ename, deptno;
 */

-- ex1) 4~6월에 입사한 사원의 직책과 같은 사람들을 출력하세요.
-- ex2) 연봉이 2000~3000 사이의 사원정보의 부서번호화 같은 사람들을 출력하세요.


SELECT * FROM emp;

-- ex1) 부서별 최근 입사자의 정보를 부서번호로 정렬하여 출력하세요.
SELECT *
FROM emp
WHERE (ename, hiredate) IN (
	SELECT deptno, max(hiredate)
	FROM emp
	GROUP BY deptno)
ORDER BY deptno;

-- ex2) 직책별 최저 연봉자의 정보를 연봉으로 정렬하여 출력하세요.
SELECT *
FROM emp
WHERE (job, sal) IN (
	SELECT job, min(sal)
	FROM emp
	GROUP BY job)
ORDER BY sal;

-- ex3) 분기별 최고 연봉자의 정보를 분기로 정렬하여 출력하세요.
SELECT to_char(hiredate, 'Q') "분기", a.*
FROM emp a
WHERE (to_char(hiredate, 'Q'), sal) IN (
	SELECT to_char(hiredate, 'Q'), max(sal)
	FROM emp
	GROUP BY to_char(hiredate, 'Q'))
ORDER BY 분기;
-- order by 컬럼명을 통해 데이터 정렬 기준을 설정하여 데이터를 확인할 때, 보다 효과적으로 내림차순 오름차순으로 처리결과를 볼 수 있다.

/*
 # exists(서버쿼리), not exists(서버쿼리)
 	1. 서버쿼리에서 검색된 결과가 하나라도 존재하거나 존재하지 않을 때, 메인 쿼리의 조건을 참/거짓을 처리해준다.
 	2. subquery의 데이터의 조회 된 결과가 있기만 하면 아무런 연관관계 없이 main query의 데이터를 수행 처리 해준다.
 */
-- comm이 null이 아닌 데이터가 존재할 때, 조회를 처리

SELECT *
FROM emp
WHERE exists(
	SELECT *
	FROM emp
	WHERE comm = 2422);

SELECT *
FROM emp
WHERE NOT exists(
	SELECT *
	FROM emp
	WHERE comm = 2422);
