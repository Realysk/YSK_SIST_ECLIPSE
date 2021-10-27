/*
# merge
1. 한번에 조건에 따라 여러가지 DML을 분기적으로 사용될 때,
	사용하는 명령어로 oracle에서 지워하고 있는 sql이다.
2. 예제
	조건문을 이용해서 해당 테이블의 특정한 컬럼값이 있으면 update
	구문을 처리하고, 데이터가 없으면 insert구문 처리를 하는 sql을
	만들어 보자.
	1) 기본형식
	merge into 테이블 a
	useing 테이블 b
	on 테이블 a와 테이블의 b의 특정 컬럼의 데이터 비교
	when matched then  해당 데이터가 있는 경우
		update set : 수정 처리..
	when not matched then
		insert values : 등록 처리.
	# 두개의 테이블 비교 처리
		MERGE into emp36 s -- 수정내지/입력 대상이 되는 테이블은 emp36
		USING emp35 t  -- emp36을 변경/입력의 위해서 조건을 처리할 테이블 emp35
		ON (s.empno = t.empno) -- emp36과 emp35 컬럼에 empno가 동일한 경우
		WHEN MATCHED THEN 
			UPDATE SET s.ename = t.ename, -- s 즉 emp36의 특정컬럼을 수정..
					   s.job = t.job,
					   s.sal = t.sal
		WHEN NOT MATCHED THEN
			INSERT (empno, ename, sal, deptno)
			VALUES (t.empno, t.ename, t.sal, t.deptno); 	
	# 가상테이블(dual)로 외부에서 입력된 데이터가 
		있을 때는 update처리, 없을 때는 insert처리..
		// 사원정보를 입력할 때, key인 empno가 있을 때는 나머지정보는 수정 처리,
			없을 때는 입력처리
		MERGE INTO emp36 s
		USING dual
		ON (s.empno = 8001)	-- 외부에서 form으로 데이터를 입력한 경우
		WHEN MATCHED THEN
			UPDATE SET s.ename = '마길동'
				       s.job = '사원'
				       s.sal = 5000
				       s.deptno= 10
		WHEN NOT MATCHED THEN
			insert (empno, ename, job, sal, deptno)
			values (8001,'마길동','사원',5000,10);		        	
							
		
		
				
 * */
CREATE TABLE emp35
AS SELECT * FROM emp;
DROP TABLE emp36;
CREATE TABLE emp36
AS SELECT * FROM emp 
	WHERE sal BETWEEN 1000 AND 2000;
SELECT * FROM emp35;
SELECT * FROM emp36;
MERGE into emp36 s -- 수정내지/입력 대상이 되는 테이블은 emp36
USING emp35 t  -- emp36을 변경/입력의 위해서 조건을 처리할 테이블 emp35
ON (s.empno = t.empno) -- emp36과 emp35 컬럼에 empno가 동일한 경우
WHEN MATCHED THEN 
	UPDATE SET s.ename = t.ename, -- s 즉 emp36의 특정컬럼을 수정..
			   s.job = t.job,
			   s.sal = t.sal
WHEN NOT MATCHED THEN
	INSERT (empno, ename, sal, deptno)
	VALUES (t.empno, t.ename, t.sal, t.deptno); 
-- t 즉 emp35의 특정컬럼을 emp36의 특정에 입력 처리
SELECT * FROM emp36;
--ex) emp37테이블을 emp의 부서번호가 20인 데이터를 기준으로 생성하고,
--	emp37테이블을 수정/등록하되 emp의 사원정보가 있으면 
--     사원번호, 사원명, 급여, 부서 정보를 수정하고,
--  그외에는 사원정보의 사원번호, 사원명, 급여, 부서를 입력하세요. [5조]
CREATE TABLE emp37
AS SELECT * FROM emp WHERE deptno = 20;
MERGE INTO emp37 t
using emp o
ON (t.empno = o.empno)
WHEN MATCHED THEN 
	UPDATE SET t.ename = o.ename,
	           t.sal = o.sal*10,
	           t.deptno = o.deptno
WHEN NOT MATCHED THEN
  	INSERT (empno, ename, sal, deptno)
  	VALUES (o.empno, o.ename, o.sal, o.deptno);

SELECT * FROM emp37;
/*
ex) 상반기에 입사한 데이터를 emp기준으로 emp38 테이블을 만들고,
emp38테이블에 사원번호 기준으로 직책/관리자/입사일(올해기준)/급여를 수정하고
해당 데이터가 없으면 사원번호, 사원명, 직책, 입사일(현재시간), 급여, 부서번호를 입력 처리하세요.

 * */ 
-- 현재연도와 hiredate의 월일
SELECT  to_char(sysdate,'YYYY') "현재연도",
		to_char(hiredate,'MM') "월",
		to_char(hiredate,'DD') "일"
FROM emp;		
-- 문자열형태의 데이터를 날짜로 변경  to_date(문자열날짜,'YYYYMMDD')
SELECT to_date(to_char(sysdate,'YYYY')||
			   to_char(o.hiredate,'MM')||
			   to_char(o.hiredate,'DD'),'YYYYMMDD')
FROM emp o;

DROP TABLE emp38;
--  상반기있는 데이터 생성..
CREATE TABLE emp38
AS SELECT * FROM emp
WHERE to_number( to_char(hiredate,'MM') ) BETWEEN 1 AND 6;

MERGE into emp38 t
USING emp o
on (t.empno = o.empno)
WHEN MATCHED THEN 
	UPDATE SET  t.job = o.job,
				t.mgr = o.mgr,
				t.hiredate = to_date(to_char(sysdate,'YYYY')
					||to_char(o.hiredate,'MM')
					||to_char(o.hiredate,'DD'),'YYYYMMDD'),
				t.sal = o.sal
WHEN NOT MATCHED THEN 
  	INSERT (empno, ename, job, hiredate, sal, deptno)
  	VALUES (o.empno, o.ename, o.job, sysdate, o.sal, o.deptno);
SELECT * FROM emp38;  

		MERGE INTO emp36 s
		USING dual
		ON (s.empno = 8002)	-- 외부에서 form으로 데이터를 입력한 경우
		WHEN MATCHED THEN
			UPDATE SET s.ename = '오길동',
				       s.job = '차장',
				       s.sal = 7000,
				       s.deptno= 20
		WHEN NOT MATCHED THEN
			insert (empno, ename, job, sal, deptno)
			values (8002,'오길동','차장',7000,20);
		SELECT * FROM emp36;
SELECT * FROM emp37;
-- ex) 변경/입력 대상 테이블은 emp37
--     데이터 9001, 마길동, 신입, 현재일입력, 3500, 30을  입력/수정 처리하세요.
--    입력된 내용과 수정된 내용을 확인해주세요.
MERGE  INTO emp37 t
USING dual
ON (t.empno = 9001)
WHEN MATCHED THEN 
	UPDATE SET t.ename='마길동',
	           t.job='대리',
	           t.hiredate = sysdate,
	           t.sal = 4500,
	           t.deptno = 20
WHEN NOT MATCHED THEN 
	INSERT (empno, ename, job, hiredate, sal, deptno)
	VALUES (9001, '마길동','대리',sysdate, 4500, 20);
SELECT * FROM emp37;

SELECT *

FROM emp;
SELECT * 
FROM dept;


	
	




