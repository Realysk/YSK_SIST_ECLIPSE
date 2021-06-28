/*
 # merge
 	1. 한번에 조건에 따라 여러가지 DML을 분기적으로 사용될 때 사용하는 명령어로 oracle에서 지원하고 있는 SQL이다.
 	2. 예제
 		조건문을 이용해서 해당 테이블의 특정한 컬럼 값이 있으면 update 구문을 처리하고, 데이터가 없으면 insert구문 처리하는 SQL을 만들어 보자.
 		1) 기본 형식
 			merge into 테이블 a
 			using 테이블 b
 			on 테이블 a와 테이블 b의 특정 컬럼의 데이터 비교
 			when matched then 해당 데이터가 있는 경우
 				update set : 수정 처리
 			when not matched then
 				inset values : 등록 처리
 */

CREATE TABLE emp20
AS SELECT * FROM emp;
DROP TABLE emp21;
CREATE TABLE emp21
AS SELECT * FROM emp
	WHERE sal BETWEEN 1000 AND 2000;
SELECT * FROM emp20;
SELECT * FROM emp21;
MERGE INTO emp21 s -- 수정/입력 대상이 되는 테이블은 emp21
USING emp20 t -- emp21을 변경/입력을 위해서 조건을 처리할 테이블 emp20
ON (s.empno = t.empno)
WHEN MATCHED THEN -- emp21과 emp20 컬럼에 empno가 동일한 경우
	UPDATE SET s.ename = t.ename, -- s 즉, emp21의 특정 컬럼을 수정
			   s.job = t.job,
			   s.sal = t.sal
WHEN NOT MATCHED THEN
	INSERT (empno, ename, sal, deptno)
	VALUES (t.empno, t.ename, t.sal, t.deptno);
-- t 즉 emp20의 특정 컬럼을 emp21의 특정에 입력 처리
SELECT * FROM emp21;


/*
 ex) emp22 테이블을 emp의 부서번호가 20인 데이터를 기준으로 생성 하고,
 emp22 테이블을 수정/등록하되 emp의 사원정보가 있으면 사원명, 급여, 부서 정보를 수정하고
 그 외에는 사원정보의 사원명, 급여, 부서를 입력하세요.
 */
CREATE TABLE emp22
AS SELECT * FROM emp WHERE deptno = 20;
MERGE INTO emp22 t
USING emp o
ON (t.empno = o.empno)
WHEN MATCHED THEN
	UPDATE SET t.ename = o.ename,
			   t.sal = o.sal*10,
			   t.deptno = o.deptno
WHEN NOT MATCHED THEN
	INSERT (empno, ename, sal, deptno)
	VALUES (o.empno, o.ename, o.sal, o.deptno);
SELECT * FROM emp22;

/*
 ex) 상반기에 입사한 데이터를 emp기준으로 emp23 테이블을 만들고,
 emp23 테이블에 사원번호 기준으로 직책/관리자/입사일(올해기준)/급여를 수정하고,
 해당 데이터가 없으면 사원번호, 사원명, 직책, 입사일(현재시간), 급여, 부서번호를 입력하세요.
 */
-- 현재연도와 hiredate의 월일
SELECT to_char(sysdate,'YYYY') "현재연도",
	   to_char(hiredatem,'MM') "월",
	   to_char(hiredatem,'DD') "일"
FROM emp;
-- 문자열 형태의 데이터를 날짜로 변경 to_date(문자열날짜,'YYYYMMDD')
SELECT to_date(to_char(sysdate,'YYYY') || to_char(o.hiredate,'MM') || to_char(o.hiredate,'DD'), 'YYYY-MM-DD')
FROM emp o;

DROP TABLE emp23;
-- 상반기 있는 데이터 생성
CREATE TABLE emp23
AS SELECT * FROM emp
WHERE to_number(to_char(hiredate,'MM')) BETWEEN 1 AND 6;

MERGE INTO emp23 t
USING emp o
ON (t.empno = o.empno)
WHEN MATCHED THEN
	UPDATE SET t.job = o.job,
			   t.mgr = o.mgr,
			   t.hiredate = to_date(to_char(sysdate,'YYYY') || to_char(o.hiredate,'MM') || to_char(o.hiredate,'DD'), 'YYYY-MM-DD'),
			   t.sal = o.sal
WHEN NOT MATCHED THEN
	INSERT (empno, ename, job, hiredate, sal, deptno)
	VALUES (o.empno, o.ename, o.job, sysdate, o.sal, o.deptno);
SELECT * FROM emp23;