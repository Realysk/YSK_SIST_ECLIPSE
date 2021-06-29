/*
 # 0629 정리문제 #
 	1. emp24 복사 테이블을 만들고 부서 번호 10의 최대 연봉을 사원 번호 7521의 연봉으로 수정하세요.
 	
 		*/
			SELECT * FROM emp24;
			CREATE TABLE emp24
			AS SELECT * FROM emp;
			SELECT * FROM emp24;
			SELECT max(sal) FROM emp24 WHERE deptno=10;
			UPDATE emp24
			SET sal = (SELECT max(sal)
						FROM emp24
						WHERE deptno=10)
			WHERE empno = 7521;
		/*
 	
 	2. emp25 복사 테이블을 만들고 입사분기별 최고 급여자를 삭제하세요.
 	
 		*/
			SELECT * FROM emp25;
			CREATE TABLE emp25
			AS SELECT * FROM emp;
			SELECT to_char(hiredate,'Q'), max(sal)
			FROM emp25
			GROUP BY to_char(hiredate,'Q');
			-- WHERE (컬럼1, 컬럼2) IN (SELECT 컬럼1, 컬럼2 FROM ..)
			-- 여러 컬럼과 어러 행을 처리할 때는 위와 같은 형식으로 다수의 컬럼을 나열하고 IN 구문을 활용한다.
			DELETE
			FROM emp25
			WHERE (to_char(hiredate,'Q'), sal) IN (
					SELECT to_char(hiredate,'Q'), max(sal)
					FROM emp25
					GROUP BY to_char(hiredate,'Q'));
		/* 	
 	
 	3. merge의 기본 형식 2가지를 기본 예제를 통해 설명하세요.
 	
 		merge는 두 개 테이블을 병합해서 대상 테이블과 원본 테이블 간의 데이터를 동일하게 만드는 것을 처리할 수 있다.
 	
		1) 형식1
			merge into 테이블(변경/등록 테이블) -- t (target)
			using 테이블 (기준 테이블) -- o (original)
			on (t.기준컬럼 = o.기준컬럼)
			when matched then -- on에 조건에 true 즉 기준 데이터가 있을 때
				update set 수정
			when not matched then
				insert values 등록
		2) 형식2
			dual(가상테이블)을 이용해서 외부에서 입력받은 데이터를 기준으로 입력/수정을 한번에 처리할 때 활용된다.
			merge into 테이블(변경/등록 테이블) t
			using dual
			on(t.컬럼명 = 기준 데이터)
			when matched then
				수정
			when not mathced then
				등록			
 	
 	4. emp 테이블의 1사분기에 입사한 사람을 기준으로 emp26의 테이블을 만들고 emp테이블의 empno의 매칭기준으로
 	   사원번호, 사원명, 직책명, 관리자번호, 입사일을 merge하세요.
 	
 		*/
			SELECT * FROM emp
			WHERE to_char(hiredate,'Q') = '1';
			CREATE TABLE emp26
			AS SELECT * FROM emp
			WHERE to_char(hiredate,'Q') = '1';
			SELECT * FROM emp26;
			
			MERGE INTO emp26 t
			USING emp o
			ON (t.empno = o.empno)
			WHEN MATCHED THEN
				UPDATE SET t.ename = o.ename,
						   t.job = o.job,
						   t.mgr = o.mgr,
						   t.hiredate = o.hiredate
			WHEN NOT MATCHED THEN
				INSERT (empno, ename, job, mgr, hiredate)
				VALUES (o.empno, o.ename, o.job, o.mgr, o.hiredate);
		/* 	
 	
 	5. 변경/입력 대상 테이블은 emp23
 	   데이터 8005, 김철수, 대리, 현재일입력, 3500, 300, 10을 merge로 입력/수정하세요.
 	   
  		*/
         	MERGE INTO emp23 s
         	USING dual
         	ON (s.empno = 8005)
         	WHEN MATCHED THEN
            	UPDATE SET s.ename = '김철수',
                           s.job = '대리',
                           s.hiredate = sysdate,
                           s.sal = 3500,
                           s.comm = 300,
                           s.deptno = 10
         	WHEN NOT MATCHED THEN
            	INSERT (empno, ename, job, hiredate, sal, comm, deptno)
            	VALUES (8005, '김철수', '대리', sysdate , 3500, 300, 30);
            SELECT * FROM emp23;

		/*	   
 	   
 */