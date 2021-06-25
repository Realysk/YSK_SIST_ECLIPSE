/*
 # 0625 정리문제 #
 	1. update 기본 형식을 기술하세요.
 	
 	 	update 테이블명
 		set 컬럼1 = 변경할데이터,
 			컬럼2 = 변경할데이터,
 			컬럼3 = 변경할데이터
 		where 조건문
 	
 	2. emp03 테이블에 comm이 0이거나 null인 데이터는 sal의 10% 할당하여 수정 처리하세요.
	
		*/
			SELECT *
			FROM emp03
			WHERE comm = 0 OR comm IS NULL;
			UPDATE emp03
				SET sal = sal*1.1
			WHERE comm = 0 OR comm IS NULL;
		/*
	
	3. subquery를 활용하여, emp03테이블의 사원명이 BLAKE 사람의 입사일을 부서명 30번의 최근 입사일로 처리를 하세요.
	
		*/
			
		/*
 */