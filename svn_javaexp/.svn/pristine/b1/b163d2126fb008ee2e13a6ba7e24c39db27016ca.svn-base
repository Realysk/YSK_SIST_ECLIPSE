/*
# 인덱스란?
1. sql명령문 중에 주로 조회성 데이터의 처리 속도를 향상시키기 위해
	컬럼에 대해 생성하는 객체
2. 인덱스는 포인트를 이용하여 테이블에 저장된 데이터를 랜덤 액세스
	하기 위한 목적으로 사용된다.
3. 인덱스가 필요한 경우
	1) where 절이나 join 조건절이 자주 사용되는 컬럼
	2) 전체 데이터 중에서 10~15%이내의 데이터를 검색하는 경우 활용
	3) 두 개 이상의 컬럼이 where절이나 조인 조건에서 자주 사용되는 경우
	4) 테이블에 저장된 데이터의 변경(입력, 수정,삭제)가 드문 경우
		- index 구조도 함께 변경되기에 입력/수정/삭제 속도 문제 발생.
	5) 열에 null값이 많이 포함된 경우, 열에 광범위한 값이 포함된 경우
4. 형식
	create index 인덱스명
	on table명(컬럼명)	  ~ 14:13
 */
DROP TABLE emp33;
CREATE TABLE emp33
AS SELECT * FROM emp;
SELECT * FROM emp33;
/* 데이터 딕션너리를 통해서 index 정보 확인 user_ind_columns*/
SELECT *
FROM user_ind_columns
WHERE table_name = 'EMP33';
SELECT *
FROM user_ind_columns
WHERE table_name = 'DEPT';
/*
# 인덱스 생성
CREATE INDEX 인덱스명 on 테이블(컬럼)
 * */
CREATE INDEX idx_empno_emp33
ON emp33(empno);
-- ex) emp34 테이블에  empno를index를 만든 후, 데이터 딕션너리를 통해서 확인하세요 5조
CREATE TABLE emp34
AS SELECT * FROM emp;
CREATE INDEX idx_empno_emp34
ON emp34(empno);
SELECT *
FROM user_ind_columns
WHERE table_name = 'EMP34';
/*
# 인덱스의 종류
1. 일반 인덱스 : 데이터의 중복가능 인덱스.
2. 고유 인덱스 : 유일한 값을 가지는 컬럼에 대해 생성하는 인덱스로 모든 인덱스 키는 테이블의 하나의 행과
	연결되어 있다.
	1) 기본 형식
	create unique index 인덱스명
	on 테이블(컬럼명)
3. 제약조건 가운데 primary key는 자동으로 index도 함께 생성이 된다.
	
	
 * */
CREATE TABLE dept10
AS SELECT * FROM dept;
CREATE UNIQUE INDEX idx_dept10_deptno
ON dept10(deptno);
SELECT *
FROM user_ind_columns
WHERE table_name = 'DEPT10';
-- EX) DEPT11테이블을 복사테이블로 생성하고, dname을 고유인덱스로 생성하고, 확인하세요. 6조
CREATE TABLE dept11
AS SELECT * FROM dept;
CREATE UNIQUE INDEX idx_dept11_dname
ON dept11(dname);
SELECT *
FROM user_ind_columns 
WHERE table_name='DEPT11';
/*
3. 단일 인덱스 : 하나의 컬럼으로만 구성된 인덱스
4. 결합 인덱스 : 두 개 이상의 컬럼을 결합하여 생성하는 인덱스.
	create index 인덱스명
	on 테이블명(컬럼명1, 컬럼명2)
 * */
CREATE TABLE emp35
AS SELECT ename, job, deptno, sal, hiredate FROM emp;
SELECT * FROM emp35;
CREATE INDEX idx_emp35_ename_deptno
ON emp35(ename, deptno);
SELECT *
FROM user_ind_columns
WHERE table_name = 'EMP35';
-- EX) 사원정보와 부서정보가 조인된 테이블에서 empno와 deptno를 제외한 복사테이블 emp36을
--      만들고, ename, dname이 결합된 결합 인덱스를 생성하고 확인하세요 1조
CREATE TABLE emp36
AS SELECT ename, job, mgr, hiredate, sal, comm, dname, loc 
FROM emp e, dept d 
WHERE e.deptno=d.deptno;
SELECT * FROM emp36;
CREATE INDEX idx_emp36_ename_dname
ON emp36(ename, dname);
SELECT *
FROM user_ind_columns 
WHERE table_name='EMP36';
/*
# descending index
1. 검색시, 특정한 컬럼의 정렬 기준으로 뒤쪽에서부터 주로 처리되는 경우
	활용된다.
	create index 인덱스명
	on 테이블명(컬럼명1 desc, 컬럼명2 asc)
 * */


