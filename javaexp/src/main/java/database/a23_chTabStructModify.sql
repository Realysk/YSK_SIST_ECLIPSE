/*
 # 테이블 이름 변경
 	rename 테이블명 to 변경할테이블명;
 # 컬럼명 변경
 	alter table 테이블명
 	rename column 컬럼명 to 변경할컬럼명;
 */
SELECT * FROM emp33;
SELECT * FROM emp33_new;
RENAME emp33 TO emp33_new;
ALTER TABLE emp33_new
RENAME COLUMN empno TO NO;


-- ex) 1) 분기별 최고 연봉자의 테이블 emp34로 만들고
SELECT * FROM emp;
-- 분기별 최고 연봉자 테이블
SELECT to_char(hiredate,'Q') part, max(sal)
FROM emp
GROUP BY to_char(hiredate,'Q');
-- 분기별 최고 연봉자의 테이블 emp34 만들기
DROP TABLE emp34;
CREATE TABLE emp34
AS SELECT * FROM emp
WHERE (to_char(hiredate,'Q'),sal) IN (
	SELECT to_char(hiredate,'Q') part, max(sal)
	FROM emp
	GROUP BY to_char(hiredate,'Q'));
SELECT * FROM emp34;
-- 	 2) 해당 job은 데이터의 최대 크기를 확인하여 해당 크기 유형으로 변경하고
SELECT max(length(job)) FROM emp34;
ALTER TABLE emp34 MODIFY job varchar2(9);
-- 	 3) empno는 char(4)로 변경하여 만들고
--		empno는 문자를 넣을 수 있는 컬럼을 추가. empnos - char(4)
--		empno와 문자형 empno 컬럼의 복사 테이블(생략도 가능)을 만들고
--		empnos에 update로 데이터 수정
--		empno를 삭제
--		empnos => empno로 컬럼명 수정
SELECT * FROM emp34;
-- 1) empnos로 임시 컬럼 추가
ALTER TABLE emp34
ADD empnos char(4);
-- 2) 데이터를 입력 할 복사테이블 만들기
CREATE TABLE empno_cp
AS SELECT empno, to_char(empno) empnos FROM emp;
-- 3) 해당 데이터 내용 key를 기준으로 update 처리
UPDATE emp34 a
	SET empnos = (
		SELECT empnos FROM empno_cp b
		WHERE a.empno = b.empno);
SELECT * FROM emp34;
ALTER TABLE emp34
DROP TABLE empno;
-- 위의 기존 방식을 2), 3) 항목을 아래의 코드로 한번에 처리가 가능.
UPDATE emp34 a
	SET empnos = to_char(empno);
ALTER TABLE emp34
DROP COLUMN empno;
SELECT * FROM emp34;
-- 	 4) 테이블명을 emp34 => emp_upt, sal => salary로 변경하세요.
RENAME emp34 TO emp_upt;
ALTER TABLE emp_upt
RENAME COLUMN sal TO salary;
SELECT * FROM emp_upt;