-- 그룹 함수
SELECT deptno, count(*), max(sal), min(sal), avg(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT deptno, sal
FROM EMP
ORDER BY deptno, sal;

/*
 # 그룹함수란?
 	1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화하여 그룹별로 결과를 출력하는 함수
 	2. 그룹함수는 통계적인 결과를 출력하는데 자주 사용된다.
 	3. 기본 형식
 		select 컬럼명, 그룹함수1, 그룹함수2...
 		from 테이블명
 		where 조건
 		group by 그룹할컬럼
 		having 그룹함수의조건;
 		특정 컬럼의 데이터를 그룹별로 함수에 의해 처리하는 것을 말한다.
 		부서별로 사원의 최대 급여, deptno(부서), 최대급여 max(sal)
 		그룹할 컬럼은 부서이고, 부서별로 급여를 확인하여 최대급여를 뽑아내는 것을 말한다.
 			ex) select deptno, max(sal)
 				from emp
 				group by deptno;
 	4. 그룹함수의 종류
 		count() : 행의 갯수
 		max() : null을 제외한 모든 행의 최대값
 		min() : null을 제외한 모든 행의 최소값
 		sum() : null을 제외한 모든 행의 합산값
 		avg() : null을 제외한 모든 행의 평균값
 		stddev() : null을 제외한 모든 행의 표준편차
 		variance() : null을 제외한 모든 행의 분산
 		1) 테이블 단위로 해당 컬럼의 전체 데이터를 그룹처리할 때는 group by 없이 그룹 함수를 사용한다.
 			ex) 사원 테이블의 최대 연봉, 사원데이터 건수
 				select count(*), max(sal)
 				from emp;
 				 		
 	5. count 함수
 		1) 테이블에서 조건을 만족하는 행의 갯수를 반환하는 함수
 		2) 기본 형식
 			count(*|distinct|all, expr)
 			- *는 null을 포함한 모든 행의 갯수
 			- distinct는 중복되는 값을 제외한 행의 갯수
 			- all는 중복된 값을 포함한 행의 갯수, default
 			- expr 인수에서 사용 가능한 데이터타입은 char, varchar2, number, date
 */
-- 부서번호가 30인 comm의 데이터 건수를 출력
SELECT count(comm)
FROM emp
WHERE deptno=30;
SELECT *
FROM emp;

-- ex1) 사원정보의 전체 관리자 갯수를 출력하세요.
SELECT mgr FROM emp;
SELECT count(*)
FROM emp;
SELECT count(mgr) -- null을 제외한 내용 출력
FROM emp;
SELECT count(DISTINCT mgr) -- 중복된 내용까지 제외 처리
FROM emp;

-- ex2) 2사분기에 입사한 사람의 job의 갯수를 출력하세요.
SELECT job
FROM emp
WHERE to_char(hiredate,'Q') = '2';
SELECT count(job)
FROM emp
WHERE to_char(hiredate,'Q') = '2';
SELECT count(DISTINCT job)
FROM emp
WHERE to_char(hiredate,'Q') = '2';

-- 합산과 평균, 최소, 최대
SELECT sum(sal), avg(sal), min(sal), max(sal)
FROM EMP
WHERE deptno = 10;
SELECT *
FROM emp;

-- ex1) 연봉이 2000~5000 사이에 연봉의 합산, 최대, 평균값을 출력하세요.
-- ex2) 2사분기에 입사한 사람의 연봉 합산, 최대, 최소, 평균값을 출력하세요.
SELECT sum(sal), max(sal), avg(sal)
FROM emp
WHERE sal BETWEEN 2000 AND 5000;
SELECT sum(sal), max(sal), min(sal), avg(sal)
FROM emp
WHERE to_char(hiredate,'Q') = '2';

/*
 # group by절
 	1. 특정 컬럼 값을 기준으로 테이블의 전체 행을 그룹별로 나누기 위한 절
 	2. 예를 들어 교수 테이블에서 소속 학과별이나 직급별로 평균 급여를 구하는 경우
 	3. GROUP BY 절에 명시되지 않은 컬럼은 그룹함수와 함께 사용할 수 없음
 	# GROUP BY 절 사용 시 적용되는 규칙
 	0. 그룹핑 전에 WHERE 절을 사용하여 그룹 대상 집합을 먼저 선택
 	1. GROUP BY 절에는 반드시 컬럼 이름을 포함해야 하며 컬럼 별명은 사용할 수 없음
 	2. 그룹별 출력 순서는 오름차순으로 정렬
 	3. SELECT 절에서 나열된 컬럼명이나 표현식은 GROUP BY 절에서 반드시 명시
 	4. GROUP BY절에서 명시한 컬럼명은 SELECT절에서 명시하지 않아도 된다.
 */

-- 부서별 평균 급여
SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno;
SELECT * FROM emp;

-- ex1) 직책(job)별 평균 급여와 최대 급여를 출력하세요.
SELECT job "직책", avg(sal) "평균 급여", max(sal) "최대 급여"
FROM emp
GROUP BY job;

-- ex2) 분기별 최대 급여와 최저 급여를 출력하세요.
SELECT to_char(hiredate,'Q')"분기", max(sal) "최대급여",
		min(sal) "최저급여"
FROM emp
GROUP BY to_char(hiredate,'Q')
ORDER BY to_char(hiredate,'Q');

-- group 함수의 조건을 처리할 때는 having을 활용해서 having 그룹함수의 조건으로 처리한다.
SELECT to_char(hiredate,'Q')"분기", max(sal) "최대급여",
		min(sal) "최저급여"
FROM emp
GROUP BY to_char(hiredate,'Q')
HAVING max(sal) >= 2000;

-- ex1) 입사월별 최고연봉자가 1000이상인 경우만 출력하세요.
SELECT job, count(job)
FROM EMP e
GROUP BY JOB
HAVING count(job) >= 3;

-- ex2) 직책별 인원이 3명 이상인 직책과 인원을 출력하세요.
SELECT TO_CHAR(hiredate, 'MM'), max(sal) "최대 급여"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'MM')
HAVING max(sal) >= 1000
ORDER BY TO_CHAR(HIREDATE,'MM');