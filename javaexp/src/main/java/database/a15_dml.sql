/*
 # 데이터 조작어 (Data Manipulation Language)
 	1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 또는 삭제하기 위한 명령어
 	2. 종류
 		insert : 입력 처리 명령어
 		update : 수정 처리 명령어
 		delete : 삭제 처리 명령어
 		merge : 병합 처리 명령어 (논리적 테이블의 병합-수정과 동시에 입력)
 	3. 트랜잭션
 		여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다.
 		명령어 종류 : commit(정상종료 확정), rollback(비정상종료 복구)
 			ex) DB 클라이언트가 접속해서 변경을 했을 때 본인 계정으로만 변경된 데이터가 보인다.
 				(다른 계정으로 접근하면 변경되지 않는 데이터가 보임)
 				이 때, commit하는 순간 현재 클라이언트뿐만 아니라 다른 계정으로 접속하더라도 변경되게 처리된다.

  # 데이터 입력 처리
 	1. 테이블에 데이터를 입력하기 위한 명령어 insert 구문을 말한다.
 	2. 입력 방법
 		1) 단일 행 입력 : 한 번에 하나의 행을 테이블에 입력하는 구문
 		1) 다중 행 입력 : 서브쿼리(subquery)를 이용하여 한번에 여러 행을 동시에 입력하는 구문
 	3. 단일 행 입력 방법
 		1) 기본 구문
 			insert into 테이블명(컬럼1, 컬럼2..) values(데이터1, 데이터2);
 			insert into 테이블명 values(테이블 구조 순서에 따른 데이터1, 데이터2);
 */

/*
 # 복사테이블 만들기
 	create table 테이블명
 	as select * from 테이블명;
 	제약조건을 제외한 구조와 데이터를 모두 복사하여 새로운 테이블 생성
 	create table 테이블명
 	as select * from 테이블명 where 1=0;
 	제약조건을 제외한 구조만 복사하여 새로운 테이블 생성
 	create table 테이블명
 	as select 컬럼1, 컬럼2, 컬럼3 from 테이블
 	해당 테이블에 특정 컬럼만 지정해서 새로운 테이블 생성
 */
CREATE TABLE emp03
AS SELECT * FROM emp;
SELECT * FROM emp03;
CREATE TABLE emp04
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp04;
CREATE TABLE emp05
AS SELECT ename, job, sal, deptno FROM emp;
SELECT * FROM emp05;

/*
 # 날짜 데이터 처리
 	1. sysdate : 현재 날짜/시간으로 date타입 컬럼에 현재 날짜/시간 입력한다.
 	2. to_date('문자열데이터','문자열데이터의 입력형식') : 문자열 데이터를 지정된 입력 양식에 맞게 data타입 컬럼에 날짜/시간 입력
 		ex) to_date('2021/06/23','YYYY/MM/DD')
 */

-- 1. 전체 데이터 입력
INSERT INTO emp04 values(1000,'홍길동','사원',9999,sysdate,3000,1000,10);
SELECT * FROM emp04;
COMMIT;
-- 2. 특정 컬럼에 데이터 입력
-- 		insert into 테이블명(컬럼명1, 컬럼명2...) values(데이터1, 데이터2..)
INSERT INTO emp04(empno, ename, sal, hiredate) VALUES (1001, '마길동', 4000, to_date('2000/06/06', 'YYYY/MM/DD'));
SELECT * FROM emp04;

-- ex) 부서정보 테이블의 복사테이블을 만들고, 전체 데이터 입력과 특정 컬럼(부서번호와 부서명) 지정 데이터 입력을 처리하세요.
CREATE TABLE dept01
AS SELECT * FROM dept;
INSERT INTO dept01 values(50,'SALES2','LONDON');
INSERT INTO dept01(deptno, dname) values(60,'SALES3');
SELECT * FROM dept01;

/*
 3. null 데이터 처리
 	1) 명시적으로 null을 선언해서 데이터 처리.
 	2) 컬럼 지정시 해당 null을 선언할 컬럼을 지정하지 않음.
 */

INSERT INTO dept01 values(51,NULL,'LONDON');
INSERT INTO dept01(deptno, loc) values(52, '서울 강남');
SELECT * FROM dept01;

-- ex) 사원정보와 부서정보를 혼합 테이블 emp_dept를 복사테이블로 만들고, null을 이용해서 입력한 데이터와 컬럼을 통해 자동 null 처리된 데이터를 입력하세요.
CREATE TABLE emp_dept
AS SELECT *
FROM emp (
	AS SELECT *
	FROM dept) a, dept d;
SELECT a.emp = d.dept
FROM emp_dept;