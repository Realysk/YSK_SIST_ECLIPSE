--1. 집합형 종류를 기본예제와 함께 기술하세요.
/*
	1) union : 합집합 - 중복제거
	2) union all : 합집합 - 중복포함
	3) intersect : 교집합
	4) minus : 차집합
 * 
 * */
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
	UNION 
	SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
	UNION all 
	SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
	INTERSECT 
	SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
	minus  
	SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
--2. view의 장점을 기술하고, 직책별 최고 급여자의 사원정보를 뷰로 작성하세요.
--	1) 보안적인 필요성, 즉 특정 테이블의 특정 컬럼만 보이게 처리할 수 있다.
--	2) 사용자 query 작성 편의성. 복잡한 query를 하나의 단순한 view로 만들어서
--		효과적으로 query를 구현할 수 있다.
	CREATE VIEW emp_max_job
	AS 
	SELECT *
	FROM emp
	WHERE (job, sal) IN (
		SELECT job, max(sal)
		FROM emp
		GROUP BY job
	);
	SELECT * FROM emp_max_job;
--3. 뷰의 제약사항을 단순뷰와 복합뷰를 나누어 기술하세요.
--	distinct사용 : 복합뷰 사용가능
--  group 함수 사용 : 복합뷰 사용가능
--  DML사용 : 단순뷰사용가능