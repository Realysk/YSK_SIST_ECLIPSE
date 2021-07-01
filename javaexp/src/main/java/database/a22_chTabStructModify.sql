SELECT * FROM emp;

/*
 컬럼 수정 시 이슈 사항
 	1. 데이터 유형이 변경되는 경우 숫자 => 문자열 (안됨)
 		복사 테이블에 컬럼을 복사하고, 기존 데이터 UPDATE를 통해서 NULL로 처리.
 		컬럼유형을 수정 후 복사 테이블에 컬럼의 데이터를 해당 유형으로 함수를 통해서 변경하면서 등록 처리.
	2. 데이터가 있는 경우 / 데이터가 없는 경우
	3. 같은 유형의 데이터의 크기 변경을 작은 => 큰 데이터 유형으로 변경이 가능
		큰 데이터 => 작은 데이터 변경 불가능. char, varchar2 간의 변경은 크기에 맞게 처리하면 가능하다.
 */

/*
 # 테이블 구조 변경.
	1. 테이블의 컬럼의 타입, 크기, 기본 값은 변경이 가능하다.
	2. 기본 형식은 alter table 테이블명 modify 컬럼명 ...
	3. 변경 시 기본 컬럼에 데이터가 없는 경우
		-> 컬럼 타입이나 크기 변경이 자유롭다.
	4. 기존 데이터가 있는 경우
		1) 타입 변경은 char와 varchar2만 허용된다.
		2) 변경 한 컬럼의 크기가 저장 된 데이터의 크기보다 같거나 클 경우 변경 가능.
		3) 숫자 타입에는 정밀도 증가 가능.
	5. 기본 값의 변경은 변경 후에 입력되는 데이터부터 적용된다.
 */
DROP TABLE emp31;
CREATE TABLE emp31
AS SELECT * FROM emp WHERE 1=0; -- 복사 테이블 생성
-- 데이터가 없는 경우에는 데이터 유형의 변경이 자유롭다.
SELECT * FROM emp31;
-- 1. 크기의 변경
ALTER TABLE emp31
MODIFY ename varchar2(100);
-- 2. 타입의 변경
ALTER TABLE emp31
MODIFY mgr varchar2(30);

-- ex) emp32의 기존 테이블은 삭제하고 데이터가 없는 복사 테이블을 만들고 문자형은 숫자형, 숫자형은 문자형, 날짜형은 문자형으로 변경하세요.
DROP TABLE emp32;
CREATE TABLE emp32
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp32;
-- 문자형 -> 숫자형
ALTER TABLE emp32
MODIFY ename NUMBER(30);
ALTER TABLE emp32
MODIFY job NUMBER(30);
-- 숫자형 -> 문자형
ALTER TABLE emp32
MODIFY empno varchar(30);
ALTER TABLE emp32
MODIFY mgr varchar(30);
ALTER TABLE emp32
MODIFY hiredate varchar(30);
ALTER TABLE emp32
MODIFY sal varchar(30);
ALTER TABLE emp32
MODIFY comm varchar(30);
ALTER TABLE emp32
MODIFY deptno varchar(30);

/*
 # 데이터가 있을 때
 */
DROP TABLE emp33;
CREATE TABLE emp33
AS SELECT * FROM emp;
SELECT * FROM emp33;
-- 1. 같은 유형의 데이터의 변경
--	1) 작은 데이터 유형을 큰 데이터 유형으로 변경은 가능하다.
ALTER TABLE emp33
MODIFY ename varchar2(50);
--	2) 큰 데이터 유형을 작은 데이터 유형으로 변경은 저장 된 데이터 크기의 범위 안에서 가능하다.
SELECT max(LENGTH(ename)) FROM emp33;
ALTER TABLE emp33
MODIFY ename varchar2(10);
ALTER TABLE emp33
MODIFY ename varchar2(5);

-- ex) emp33의 테이블의 문자형에 데이터를 50으로 변경 후 각 문자형 데이터를 최대 크기를 확인한 후 해당 데이터로 변경하세요.
-- 데이터 유형 크기 변경
ALTER TABLE emp33
MODIFY ename varchar(50);
ALTER TABLE emp33
MODIFY job varchar(50);
-- 데이터 크기 확인 : 6, 9
SELECT max(LENGTH(ename)), max(LENGTH(job))
FROM emp33;
-- 데이터 크기 변경 : 6, 9
ALTER TABLE emp33
MODIFY ename varchar2(6);
ALTER TABLE emp33
MODIFY ename varchar2(9);
SELECT * FROM emp33;

-- 2. 데이터가 있을 때 다른 유형의 데이터 type 변경은 불가능하다.
ALTER TABLE emp33
MODIFY empno varchar2(10);
-- column to be modified must be empty to change datatype
/*
 # 제한 경우에 데이터 타입을 변경 할 경우
 	1. 변경 할 type으로 함수를 통해서 변하는 컬럼을 복사 테이블을 통해서 만든다.
 	2. 변경 한 type을 컬럼을 update를 통해서 null 처리한다.
 	3. 컬럼의 type을 변경한다.
 	4. 복사 테이블의 데이터를 통해서 현재 데이터를 입력 처리한다.
 */
SELECT * FROM emp33;
-- hiredate : date => varchar2로 변경 처리
CREATE TABLE hiredate_cpy
AS SELECT empno, to_char(hiredate,'YYYY/MM/DD') hiredate -- 함수를 통해서 문자열로 변경
FROM emp33;
SELECT * FROM hiredate_cpy;
UPDATE emp33
	SET hiredate = NULL;
SELECT * FROM emp33;
ALTER TABLE emp33
MODIFY hiredate varchar2(10);
UPDATE emp33 a
	SET hiredate = (
		SELECT hiredate
		FROM hiredate_cpy b
		WHERE a.empno = b.empno);
-- ex) emp33을 기준으로 mgr 숫자형을 문자형으로 변경하되 복사 테이블을 만들고 mgr null까지 진행하세요.
SELECT * FROM emp33;
-- 데이터 유형 변경 시 반드시 해당 테이블의 식별 키와 함께 복사테이블을 만들되 해당 유형으로 변경하여 테이블을 만든다.
CREATE TABLE mgr_cpy
AS SELECT empno, to_char(mgr) mgr FROM emp33;
SELECT * FROM mgr_cpy;
-- 해당 테이블의 컬럼을 null로 수정 처리
UPDATE emp33 SET mgr = NULL;
-- 데이터 유형을 변경
ALTER TABLE emp33 MODIFY mgr varchar2(10);
-- 수정 시 해당 테이블과 변경 할 테이블의 key를 조건으로 변경 처리