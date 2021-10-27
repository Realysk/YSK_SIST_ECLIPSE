/*
# 그 외에 subquery
1. table 자체에 대한 subquery

2. select 선택열에서 subquery처리..
 * */

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
-- ex1) 연봉이 2000~4000인 사원의 부서번호, 사원명, 사원번호, 이름의 subquery
--		테이블과 부서테이블과 join하여 출력하세요
SELECT *
FROM (SELECT deptno, ename, empno, sal
	  FROM emp
      WHERE sal BETWEEN 2000 AND 4000) a,
     dept b
WHERE a.deptno = b.deptno;
-- ex2) 부서별 최저 연봉의 정보와 부서정보을 join하여 출력하세요.
SELECT a.*, dname, loc
FROM 
( SELECT deptno, min(sal) mxsal
FROM emp
GROUP BY deptno) a, dept b
WHERE a.deptno = b.deptno

SELECT *
FROM emp;
--  테이블 subquery를 활용하여 처리하세요..
-- ex) 중복되지 않는 관리자 번호리스트 테이블과  사원테이블을 
--      mgr, empno로 조인하여  관리자번호  관리자명  직책을 출력하세요.
SELECT a.mgr "관리자번호", ename, job
FROM (
SELECT DISTINCT mgr
FROM emp ) a , emp b
WHERE a.mgr = b.empno;
-- ex) 부서별 최근 입사자 테이블과 사원테이블을 부서번호로 조인하여 출력하세요.
SELECT *
FROM (
SELECT deptno, max(hiredate) maxhire
FROM emp
GROUP BY deptno) a, dept b
WHERE a.deptno = b.deptno;
-- ex) 연봉인 3000~4000에 해당하는 사원 테이블과 부서정보테이블을 조인하여 출력하세요.
SELECT *
FROM 
(SELECT *
 FROM emp
 WHERE sal BETWEEN 3000 AND 4000) a, dept b
WHERE a.deptno = b.deptno;
SELECT *
FROM dept;
SELECT *
FROM emp;
-- # 테이블 subquery 연습예제
-- 1. 연봉이 3000이상인 사원정보 테이블1, 부서테이블2 조인하여
--     사원명, 연봉, 부서명, 부서위치  출력..
SELECT ename, sal, dname, loc
FROM 
	( SELECT *
	    FROM emp
	WHERE sal>=3000) e, dept d
WHERE e.deptno = d.deptno;


-- 2. 부서별 최근입사자 테이블1, 사원테이블2, 부서테이블3 조인하여
--     부서명  사원명  입사일  
--    공통컬럼일때는 반드시 테이블 alias이름을 설정한다.
--    개별컬럼일 때는 테이블 alias를 생략 가능하다.
--    테이블간의 join은 공통 컬럼을 파악하여 해당 컬럼간의 조인을 처리한다.
SELECT dname, ename, b.hiredate
FROM 
( SELECT deptno, max(hiredate) hiredate
	FROM emp
	GROUP BY deptno ) a, emp b, dept d
WHERE a.deptno = b.deptno
AND a.hiredate = b.hiredate
AND b.deptno = d.deptno;

-- 3. 분기별 최고급여자 테이블1, 사원테이블2
--     분기  사원명 급여
SELECT part, ename, b.sal
FROM 
( SELECT to_char(hiredate, 'Q') part, max(sal) sal
  FROM emp
   GROUP BY to_char(hiredate, 'Q') ) a, emp b
WHERE a.part = to_char(b.hiredate,'Q')
AND a.sal = b.sal
ORDER BY part;







