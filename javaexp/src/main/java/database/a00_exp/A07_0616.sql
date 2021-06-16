/*
# 0616 정리문제 #
	1. 그룹함수의 기본 형식을 서술하세요.
	
	 	select 컬럼명, 그룹함수1, 그룹함수2...
 		from 테이블명
 		where 조건
 		group by 그룹할컬럼
 		having 그룹함수의조건;
	
	2. 그룹함수의 종류와 내용을 기본예제를 통해서 기술하세요.
	
	 	count() : 행의 갯수
 		max() : null을 제외한 모든 행의 최대값
 		min() : null을 제외한 모든 행의 최소값
 		sum() : null을 제외한 모든 행의 합산값
 		avg() : null을 제외한 모든 행의 평균값
 		stddev() : null을 제외한 모든 행의 표준편차
 		variance() : null을 제외한 모든 행의 분산
	
		*/
			-- 부서번호가 30인 comm의 데이터 건수를 출력
			SELECT count(comm), max(comm), min(comm), sum(comm), avg(comm), stddev(comm), variance(comm)
			FROM emp
			WHERE deptno=30;
			SELECT *
			FROM emp;
		/*
	
	3. 전체 내용을 그룹함수로 처리하는 부분과 특정 컬럼의 데이터를 기준으로 그룹함수를 처리할 때 코드의 차이점을 예제로 기술하세요.		
	
		특정 컬럼의 데이터를 기준으로 그룹함수를 처리하는 함수를 GROUP BY라 한다.
		
		*/
			-- 부서별 평균 급여
			SELECT deptno, avg(sal)
			FROM emp
			GROUP BY deptno;
			SELECT * FROM emp;
		/*
	
	4. 입사월별 인원 수를 출력하세요. (입사월 인원)
	
		*/
			SELECT TO_CHAR(hiredate, 'MM')
			FROM EMP
			GROUP BY TO_CHAR(HIREDATE, 'MM')
			HAVING max(sal) >= 1000
			ORDER BY TO_CHAR(HIREDATE,'MM');
		/*
	
	5. 직책(job)별 최고 급여자가	2000 이상인 경우를 출력하세요. (직책, 최고급여)			
	
		*/
			SELECT job "직책", max(sal) "최대 급여"
			FROM emp
			GROUP BY job
			HAVING max(sal) >= 2000;
		/*
	
	6. join 테이블의 연결이 없는 카티시안 join과 equi join의 차이점을 기술하세요.
		
	7. 급여가 2000~4000사이의 사원의 번호, 이름, 부서명을 출력하세요.
	
		*/
			SELECT empno, ename, dname, sal
			FROM EMP
			
		/*
	
	8. non equi join의 정의를 기술하세요.
	
		-  join하는 두 개의 테이블의 값이 동일하지 않고, 범위로써 join하는 경우를 말한다.
	
	9. salgrade의 1,2등급에 해당하는 사원 정보를 출력하세요.
	
		*/
			SELECT *
			FROM salgrade;
		/*
	 
*/