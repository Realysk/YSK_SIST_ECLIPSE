/*
# 집합형 sql 처리.
1. 기본 형식
	sql1
	집합관련키워드
	sql2;
	1) 두 sql의 결과의 type과 갯수와 컬럼명이 동일하여야 한다.
2. 종류
	1) union : 합집합 - 두 sql의 결과 공통데이터는 1번만 나와서 처리결과를 확인 할 수 있다.	
 *  2) union all : 합집합이지만 중복된 데이터를 처리결과로 확인할 수 있다.
 *		로딩 속도 이유가 있을 때, 자주 활용된다. 
 *  3) intersect : 교집합으로 두개의 집합의 공통되는 집합을 출력한다.
 *  4) minus : 먼저 위치한 select문을 기준으로 다른 select문과 공통된 데이터를 제외한 항목만 추출.
 * 		
 * */
-- union 
SELECT '홍길동' name, 75 kor FROM dual
UNION 
SELECT '김길동' name, 80 kor FROM dual
union
SELECT '신길동' name, 90 kor FROM dual
union
SELECT '홍길동' name, 75 kor FROM dual;
--union all
SELECT '홍길동' name, 75 kor FROM dual
UNION all
SELECT '김길동' name, 80 kor FROM dual
UNION all
SELECT '신길동' name, 90 kor FROM dual
UNION all
SELECT '홍길동' name, 75 kor FROM dual;
-- intersect
SELECT * FROM emp;
-- 연봉이 1000~3000사이의 사원명, 직책, 부서번호와,
-- 연봉이 2000~5000사이의 사원명, 직책, 부서번호의 교집합을 구해보자.
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
INTERSECT 
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000;
--  차집합
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
minus 
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000;
-- 집합연산의 정렬은 마지막 최종 라인에서 처리한다.
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
minus 
SELECT ename, job, deptno, sal
FROM emp
WHERE sal BETWEEN 2000 AND 5000
ORDER BY sal;
-- ex1) 부서번호 10과 부서번호 20인 데이터의 합집합을 구하세요.
-- ex2) 연봉이 0~3000인사람과 2000~5000인사람의 중복상관없는 합집합을 구하세요.
-- ex3) 상반기에 입사한 사람과 2/4분기에 입사한 사람의 차집합을 구하세요.
-- 해당 문제별로 제출해주세요 ex1) 다하시면 제출하시고, ex2) 진행... 5조
SELECT * FROM emp;
-- ex1) 부서번호 10과 부서번호 20인 데이터의 합집합을 구하세요.
SELECT * FROM emp WHERE deptno = 10
UNION
SELECT * FROM emp WHERE deptno = 20;
-- ex2) 연봉이 0~3000인 사람과 2000~5000인 사람의 중복상관없는 합집합을 구하세요.
SELECT * FROM emp WHERE sal BETWEEN 0 AND 3000
UNION all
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
-- ex3) 상반기에 입사한 사람과 2/4분기에 입사한 사람의 차집합을 구하세요.
SELECT * FROM emp WHERE TO_char(hiredate, 'MM') BETWEEN 1 AND 6
minus
SELECT * FROM emp WHERE TO_char(hiredate, 'Q') = '2';
-- ex4) 1980년도에 입사한 사람과 1981년도에 입사한 사람중에 월이 같은 교집합을 구하세요.
SELECT to_char(hiredate, 'MM')
FROM emp
WHERE to_char(hiredate,'YYYY') = '1980'
intersect
SELECT to_char(hiredate, 'MM')
FROM emp
WHERE to_char(hiredate,'YYYY') = '1981';

SELECT *
FROM emp
WHERE to_char(hiredate,'MM') = (
	SELECT to_char(hiredate, 'MM')
	FROM emp
	WHERE to_char(hiredate,'YYYY') = '1980'
	intersect
	SELECT to_char(hiredate, 'MM')
	FROM emp
	WHERE to_char(hiredate,'YYYY') = '1981'
);








-- 