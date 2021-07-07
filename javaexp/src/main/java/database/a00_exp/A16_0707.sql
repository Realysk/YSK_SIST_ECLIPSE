/*
 # 0707 정리 문제 #
 	1. 집합형 종류를 기본예제와 함께 기술하세요.
 	
 		union : 합집합 - 두 SQL의 결과 공통데이터는 1번만 나와서 처리결과를 확인할 수 있다.
 		union all : 합집합이지만 중복 된 데이터를 처리결과로 확인할 수 있다.
 		intersect : 교집합 - 두 SQL의 결과 중 공통되는 데이터만 출력 된다.
 		minus : 먼저 위치한 select문을 기준으로 다른 select문과 공통 된 데이터를 제외한 항목만 추출
 
		*/
			SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
			UNION
			SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
			SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
			UNION ALL
			SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
			SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
			INTERSECT
			SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
			SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000
			minus
			SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
		/*
 
 	2. view의 장점을 기술하고, 직책별 최고 급여자의 사원정보를 뷰로 작성하세요.
 	
 		1) 보안적인 필요성, 특정 테이블의 컬럼만 보이게 처리 가능
 		2) 사용자 query 작성 편의성. 복잡한 query를 하나의 단순한 view로 만들어 효과적인 query를 구현할 수 있다.
 
		*/
			CREATE VIEW emp_max_job
			AS SELECT *
			FROM emp
			WHERE (job,sal) IN (
				SELECT job, max(sal)
				FROM emp
				GROUP BY job);
			SELECT * FROM emp_max_job;
		/* 
 
 	3. 뷰의 제약사항을 단순 뷰와 복합 뷰를 나누어 기술하세요.
 	
 		- distinct 사용 : 복합 뷰 사용 가능
 		- group 함수 사용 : 복합 뷰 사용 가능
 		- DML 사용 : 단순 뷰 사용 가능
 	
		*/
			
		/*
 	
 */