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
-- ex2) 부서별 최저 연봉의 정보와 부서정보를 join하여 출력하세요.