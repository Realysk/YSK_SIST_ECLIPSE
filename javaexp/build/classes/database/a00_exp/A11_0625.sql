/*
 # 0625 정리문제 #
 	1. update 기본 형식을 기술하세요.
 	
 	 	update 테이블명
 		set 컬럼명 = 변경할데이터,
 			컬럼명 = 컬럼명 + 추가데이터, (DB에서는 불가능 +=(X))
 			컬럼명 = 컬럼명 || '추가문자열데이터',
 			컬럼명 = (subquery),
 			(컬럼명1, 컬럼명2) = (SELECT 결과1, 결과2) - 단일 row 데이터
 		where 조건 = 조건데이터;
 	
 	2. emp03 테이블에 comm이 0이거나 null인 데이터는 sal의 10% 할당하여 수정 처리하세요.
	
		*/
			SELECT *
			FROM emp03
			WHERE comm = 0 OR comm IS NULL;
			SELECT *
			FROM emp03
			WHERE nvl(comm,0) = 0;
			UPDATE emp03
				SET comm = sal*0.1
			WHERE nvl(comm,0) = 0;
		/*
	
	3. subquery를 활용하여, emp03테이블의 사원명이 BLAKE 사람의 입사일을 부서번호 30번의 최근 입사일로 처리를 하세요.
	
		*/
			SELECT max(hiredate)
			FROM emp03
			WHERE deptno = 30;
		
			UPDATE emp03
				SET hiredate = (
					SELECT max(hiredate)
					FROM emp03
					WHERE deptno = 30)
			WHERE ename = 'BLAKE';
		/*
 */