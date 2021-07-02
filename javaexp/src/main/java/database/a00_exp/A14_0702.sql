/*
 # 정리문제
	1. 테이블 컬럼의 테이블 타입을 변경할 시, 제약사항을 기술하세요.
	
		
	
	2. emp의 구조만 있는 emp41 테이블을 생성하고 숫자형 컬럼을 문자형으로 변경하세요.
	
		*/
			CREATE TABLE emp41
			AS SELECT * FROM emp WHERE 1=0;
			SELECT * FROM emp41;
			ALTER TABLE emp41
			MODIFY empno varchar(30);
			ALTER TABLE emp41
			MODIFY mgr varchar(30);
			ALTER TABLE emp41
			MODIFY hiredate varchar(30);
			ALTER TABLE emp41
			MODIFY sal varchar(30);
			ALTER TABLE emp41
			MODIFY comm varchar(30);
			ALTER TABLE emp41
			MODIFY deptno varchar(30);
		/*
	
	3. 테이블명과 컬럼명을 변경시키는 코드를 기술하세요.
	
		*/
			RENAME emp12 TO emp12_cpy;
			ALTER TABLE emp12_cpy
			RENAME COLUMN sal TO salary;
		/*
	
	4. 인덱스의 기본형식과 유형을 기술하세요.
		
		create index 인덱스명 on 테이블명(컬럼명);
			1) 일반 인덱스 (단일 인덱스 포함)
			2) 고유 인덱스 unique
			3) 결합 인덱스 on 테이블명(컬럼명1, 컬럼명2...)
			4) 결합 정렬 인덱스 on 테이블(컬럼명1 desc, 컬럼명2 asc...)		
	
	5. emp38테이블에 index로 deptno(내림차순)와 empno(오름차순)로 중복 처리되게 하세요.
	
		*/
			CREATE INDEX idx_emp38_deptno_empno
			ON emp38(deptno DESC, empno ASC);
			-- desc로 index를 하면 정렬의 우선순위로 먼저 데이터를 찾아준다.
			SELECT * FROM user_ind_columns
			WHERE table_name='EMP38';
		/*	
	
	6. user01/8888계정을 생성하고, 접속하여 테이블을 생성하세요.
	
		*/
			CREATE USER user01 IDENTIFIED BY 8888;
			GRANT CREATE SESSION TO user01;
		/*
	
	7. 부서정보가 함께 있는 부서명별 최고 급여자 사원 정보가 있는 emp42테이블을 만들고 mgr은 관리자명으로 데이터유형과 데이터를 변경 처리하세요.
	
		*/
			
		/*		
	
 */