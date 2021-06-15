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
 	4. 그룹함수의 종류
 		count() : 행의 갯수
 		max() : null을 제외한 모든 행의 최대값
 		min() : null을 제외한 모든 행의 최소값
 		sum() : null을 제외한 모든 행의 합산값
 		avg() : null을 제외한 모든 행의 평균값
 		stddev() : null을 제외한 모든 행의 표준편차
 		variance() : null을 제외한 모든 행의 분산
 */