/*
 # 그 외에 subquery
 	1. table 자체에 대한 subquery
 	
 	2. select 선택역에서 subquery 처리
 */

SELECT *
FROM (
	SELECT deptno, max(hiredate) hiredate
	FROM emp
	GROUP BY deptno
) a, emp b
WHERE a.hiredate = b.hiredate
AND a.deptno = b.deptno
ORDER BY a.deptno;

SELECT *
FROM emp;

SELECT *
FROM (SELECT empno, deptno, sal
		FROM emp
		WHERE sal BETWEEN 1000 AND 2000
) a, dept d
WHERE a.deptno = d.deptno;

-- ex1) 연봉이 2000~4000인 사원의 부서번호, 사원명, 사원번호, 이름의 subquery 테이블과 부서테이블과 join하여 출력하세요.
SELECT *
FROM (
	SELECT deptno, ename, empno, sal
	FROM emp
	WHERE sal BETWEEN 2000 AND 4000) a,
	dept b
WHERE a.deptno = b.deptno;

-- ex2) 부서별 최저 연봉의 정보와 부서정보를 join하여 출력하세요.
SELECT a.*, dname, loc
FROM (
	SELECT deptno, min(sal) mxsal
	FROM emp
	GROUP BY deptno) a, dept b
WHERE a.deptno = b.deptno;

SELECT *
FROM emp;

-- 테이블 subquery를 활용하여 처리하세요.
-- ex1) 중복되지 않는 관리자 번호리스트 테이블과 사원테이블을
-- 		mgr, empno로 조인하여 관리자번호 관리자명 직책을 출력하세요.
SELECT b.empno "관리자번호", ename, job
FROM (
	SELECT DISTINCT mgr
	FROM emp ) a, emp b
WHERE a.mgr = b.empno;

-- ex2) 부서별 최근 입사자 테이블과 사원테이블을 부서번호로 조인하여 출력하세요.
SELECT *
FROM (
	SELECT deptno, max(hiredate) maxhire
	FROM emp
	GROUP BY deptno) a, dept b
WHERE a.deptno = b.deptno;

-- ex3) 연봉이 3000~4000에 해당하는 사원테이블과 부서정보테이블을 조인하여 출력하세요.
SELECT *
FROM (
	SELECT deptno, ename, empno, sal
	FROM emp
	WHERE sal BETWEEN 3000 AND 4000) a,
	dept b
WHERE a.deptno = b.deptno;
