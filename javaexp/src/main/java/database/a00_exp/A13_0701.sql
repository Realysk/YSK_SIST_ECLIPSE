/*
 # 0701 정리문제 #
	1. 테이블 구조의 변경을 위해 컬럼을 추가하거나 삭제하는 기본 형식을 기술하기
	
		- 컬럼 추가
		alter table 테이블명
 		add 컬럼명 데이터유형 [default 디폴트데이터, 제약 조건]
 		
 		- 컬럼 삭제
 		alter table 테이블명 drop column 컬럼명;
	
	2. 직책별 최저 급여자 정보테이블 emp30을 만들고 보너스, 부서 컬럼을 삭제하고 부서명 컬럼을 추가하기
	
		*/
			SELECT job, min(sal)
			FROM emp e
			GROUP BY job;
			DROP TABLE emp30;
			CREATE TABLE emp30 
			AS SELECT * FROM EMP 
			WHERE (job, SAL) in(
   				SELECT job, min(SAL)
   				FROM emp e 
   				GROUP BY job);
			SELECT * FROM emp30;
			ALTER TABLE emp30 DROP COLUMN comm;
			ALTER TABLE emp30 DROP COLUMN deptno;
			ALTER TABLE emp30 ADD dname varchar2(30);
		/*
	
 */