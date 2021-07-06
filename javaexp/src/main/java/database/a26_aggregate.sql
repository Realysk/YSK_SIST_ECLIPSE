/*
 # 집합형 SQL 처리
 	1. 기본 형식
 		SQL1
 		집합 관련 키워드
 		SQL2;
 		1) 두 SQL의 결과와 type과 갯수와 컬럼명이 동일해야 한다.
 	2. 종류
 		1) union : 합집합 - 두 SQL의 결과 공통데이터는 1번만 나와서 처리결과를 확인할 수 있다.
 		2) union all : 합집합이지만 중복 된 데이터를 처리결과로 확인할 수 있다.
 		3) intersect : 교집합 - 두 SQL의 결과 중 공통되는 데이터만 출력 된다.
 		4) minus : 먼저 위치한 select문을 기준으로 다른 select문과 공통 된 데이터를 제외한 항목만 추출
 */
-- union
SELECT '홍길동' name, 75 kor FROM dual
UNION
SELECT '김길동' name, 80 kor FROM dual
UNION
SELECT '신길동' name, 90 kor FROM dual
UNION
SELECT '홍길동' name, 75 kor FROM dual;

-- union all
SELECT '홍길동' name, 75 kor FROM dual
UNION ALL
SELECT '김길동' name, 80 kor FROM dual
UNION ALL
SELECT '신길동' name, 90 kor FROM dual
UNION ALL
SELECT '홍길동' name, 75 kor FROM dual;

-- intersect
SELECT * FROM emp;
-- 연봉이 1000~3000사이의 사원명, 직책, 부서번호와 연봉이 2000~5000사이의 사원명 직책, 부서번호 교집합을 출력하세요.
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
INTERSECT
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000;

-- minus (차집합)
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
minus
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000;

-- 집합연산의 정렬은 마지막 최종 라인에서 처리 한다.
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
minus
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000
ORDER BY sal;

-- ex1) 부서번호 10과 부서번호 20인 데이터의 합집합을 구하세요.
SELECT * FROM emp WHERE deptno = 10
UNION
SELECT * FROM emp WHERE deptno = 20;

-- ex2) 연봉이 0~3000인 사람과 2000~5000인 사람의 중복 상관없는 합집합을 구하세요.
SELECT * FROM emp WHERE sal BETWEEN 0 AND 3000
UNION ALL
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;

-- ex3) 상반기에 입사한 사람과 2/4분기에 입사한 사람의 차집합을 구하세요.
SELECT * FROM emp WHERE to_char(hiredate,'Q') = 2
MINUS
SELECT * FROM emp WHERE to_char(hiredate,'Q') = 4;

-- ex4) 1980년도에 입사한 사람과 1981년도에 입사한 사람 중에 월이 같은 교집합을 구하세요.
SELECT to_char(hiredate,'MM') FROM emp WHERE to_char(hiredate, 'YYYY') = '1980'
INTERSECT
SELECT to_char(hiredate,'MM') FROM emp WHERE to_char(hiredate, 'YYYY') = '1981';

SELECT *
FROM emp
WHERE to_char(hiredate,'MM') = (
	SELECT to_char(hiredate,'MM')
	FROM emp
	WHERE to_char(hiredate, 'YYYY') = '1980'
	INTERSECT
	SELECT to_char(hiredate,'MM')
	FROM emp
	WHERE to_char(hiredate, 'YYYY') = '1981');