/*
 # 0623 정리문제 #
	1. 테이블 subquery에서 테이블간 조인관계를 급여가 2000이상인 사원테이블, 부서명이 SALES 이거나
		RESEARCH 부서테이블 조인하여 사원명, 부서명, 급여를 출력하세요.
	
		*/
			
		/*
	
	2. 직책별 최고급여자의 부서번호, 부서명을 출력하세요.
	
		*/
			SELECT max(sal), deptno, dname
			FROM emp
			GROUP BY job;
		/*	
	
	3. DB 조작어의 종류와 트랜잭션 명령어의 기능에 대하여 기술하세요.
	
	 	insert : 입력 처리 명령어
 		update : 수정 처리 명령어
 		delete : 삭제 처리 명령어
 		merge : 병합 처리 명령어 (논리적 테이블의 병합 - 수정과 동시에 입력)
 		
 		트랜잭션 : 여러 개의 명령문을 하나의 논리적인 작업 단위로 처리하는 기능
	
	4. 데이터 입력의 기본 형식 중 단일 행 입력, 다중 행 입력을 기본 예제를 통해서 설명하세요.
		
		- 단일 행 입력
			INSERT INTO dept01(deptno, loc) values(52, '서울 강남');
			INSERT INTO dept01 values(7999, '홍길동', '사원', 7782, sysdate, 1000, NULL, 60, '인사팀', '강남');
		
		- 다중 행 입력
			INSERT ALL
			INTO emp06(empno, ename, sal) values(empno, ename, sal)
			INTO emp07(empno, ename, sal) values(empno, ename, sal)
			INTO emp08(empno, ename, sal) values(empno, ename, sal)
	
	5. 데이터 입력 중, 여러 테이블의 한번에 subquery 입력을 기본 예제를 통해서 설명하세요.
	
		*/
			
		/*	
	
	6. emp04 테이블에 사원번호, 사원명, 입사일(2020/01/01 오전 11:30), 급여를 입력하세요.
	
		*/
			
		/*	
	
	7. 직급별 최고연봉과 최저연봉을 입력받을 수 있는 구조 테이블을 만들고, 해당 테이블에 emp 테이블의 정보를 subquery로 입력하세요.
	
		*/
			
		/*	
	
	8. emp16, emp17, emp18 테이블을 emp테이블의 구조테이블로 만들고 부서별 최고급여자의 사원정보전체를 가져와서 해당테이블에 입력하되, 
    	emp16에는 부서번호 최고급여
    	emp17에는 부서번호+1 최고급여*10
    	emp18에는 부서번호+2 최고급여*20 을 처리하여 입력하세요.
    	
    	*/
			
		/*
    	
 */