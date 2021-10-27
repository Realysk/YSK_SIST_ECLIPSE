/*
# 데이터 조작어(Data Manipulation Language)    
1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 또는 삭제하기 
	위한 명령어이다.
2. 종류 
	insert : 입력 처리 명령어
	update : 수정 처리 명령어
	delete : 삭제 처리 명령어
	merge : 병합처리 명령어(논리적 테이블의 병합-수정과 동시에 입력)
3. 트랜잭션
	여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다.
	명령어 종류 : commit(정상종료 확정), rollback(비정상종료 복구)	
	ex) DB클라이언트가 접속해서 변경을 했을 때, 본인 계정으로만
		변경된 데이터가 보인다(다른 계정으로 접근하면 변경되지
		않는 데이터가 보임). 이때, commit하는 순간 현재 클라이언트
		뿐만아니라 다른 계정으로 접속하더라도 변경되게 처리된다.
# 데이터 입력 처리
1. 테이블에 데이터를 입력하기 위한 명령어 insert 구문을 말한다.
2. 입력방법
	1) 단일 행 입력 : 한 번에 하나의 행을 테이블에 입력하는 구문
	2) 다중 행 입력 : 서브 쿼리(subquery)를 이용하여 
		한번에 여러 행을 동시에 입력하는 구문
3. 단일행 입력 방법
	1) 기본 구문
		insert into 테이블명(컬럼1, 컬럼2.. ) values(데이터1, 데이터2);
		insert into 테이블명 values(테이블 구조 순서에 따른 데이터1, 데이터2); 
4. 다중행 입력 
	1) 데이터를 하나의 테이블에 여러 행을 한 번에 입력하는 query를 말한다.
	2) 형식
		- insert명령문에서 서버퀄리로 다른 테이블에서 조회해 와서 입력처리.
		- insert명령문에 의해 한 번에 여러행을 동시에 입력.
		- 기타형식
			insert all
			first insert
					
 **/
/*
# 복사테이블 만들기
create table 테이블명
as select * from 테이블명;
제약조건을 제외한 구조와 데이터를 모두 복사하여 새로운 테이블 생성.
create table 테이블명
as select * from 테이블명 where 1=0;
제약조건을 제외한 구조만 복사하여 새로운 테이블 생성
create table 테이블명
as select 컬럼1, 컬럼2, 컬럼3 from 테이블
해당 테이블에 특정 컬럼만 지정해서 새로운 테이블 생성
 * */
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
2. to_date('문자열데이터', '문자열데이터의 입력형식') :
	 문자열 데이터를 지정된 입력양식에 맞게 data타입 컬럼에 날짜/시간 입력
	ex) to_date('2021/06/23', 'YYYY/MM/DD')
 * */

-- 1. 전체 데이터 입력.
INSERT INTO emp04 values(1000,'홍길동','사원',9999,
							sysdate,3000,1000,10);
SELECT * FROM emp04;
COMMIT;
-- 2. 특정 컬럼에 데이터 입력
--    insert into 테이블명(컬럼명1, 컬럼명2...) values(데이터1, 데이터2..)
INSERT INTO emp04(empno, ename, sal, hiredate)
		   values(1001,'마길동',4000, 
		    to_date('2000/06/06','YYYY/MM/DD'));
SELECT * FROM emp04;
/*
ex) 부서정보 테이블의 복사테이블을 만들고, 전체데이터 입력과
	특정 컬럼(부서번호와 부서명) 지정 데이터 입력을 처리하세요.
	[1조]
 * */
CREATE TABLE dept01 AS SELECT * FROM dept;
INSERT INTO dept01 values(50,'SALES2','LONDON');
INSERT INTO dept01(deptno, dname) values(60,'SALES3');
SELECT * FROM dept01;
/*
-- 3. null 데이터 처리..
	1) 명시적으로 null을 선언해서 데이터 처리.
	2) 컬럼지정시 해당 null을 선언할 컬럼을 지정하지 않음.
 * */
INSERT INTO dept01 values(51,null,'LONDON');
INSERT INTO dept01(deptno, loc) values(52, '서울강남');
SELECT * FROM dept01;
-- ex) 사원정보와 부서정보를 혼합 테이블 emp_dept을 복사테이블로 만들고, 
--     null을 이용해서 입력한 데이터와 컬럼을 통해 자동 null 처리된 데이터를
--     입력처리하세요.
CREATE TABLE emp_dept
AS SELECT e.*, dname, loc 
FROM emp e, dept d
WHERE e.deptno = d.deptno;
SELECT * FROM EMP_DEPT;
INSERT INTO EMP_DEPT VALUES(7999,'홍길동','사원',7782,SYSDATE,
	1000, NULL, 60,'인사팀','강남');
INSERT INTO emp_dept(empno, ename, deptno, dname) 
		values(7888,'마길동',70,'방배동');
-- ex) 부서별 최고급여, 최저급여, 평균급여로 복사테이블(emp_statics)을 만들고,
-- 	 	null 명시, 컬럼지정 null 처리하세요.
	
CREATE TABLE emp_statics2
AS SELECT deptno, max(sal) msal,
		min(sal) isal,
		avg(sal) asal
FROM emp
GROUP BY deptno;
SELECT * FROM emp_statics;
INSERT INTO emp_statics values(40, NULL, 1000, null);
INSERT INTO EMP_STATICS(deptno, asal) values(50,3000.27);

SELECT * FROM dept;
-- 1. 전체 컬럼 입력
-- insert into 테이블명
-- subquery
-- 2. 지정된 컬럼 입력
-- insert into 테이블명(컬럼1, 컬럼2...)
-- 해당 컬럼의 갯수와 type에 맞는 subquery
SELECT * FROM emp01;
INSERT INTO emp01
SELECT *
FROM emp
WHERE sal BETWEEN 3000 AND 5000;
INSERT INTO emp01(deptno, hiredate)
SELECT deptno, max(hiredate)
FROM emp
GROUP BY deptno;
SELECT * FROM emp01;
/*
-- ex1) emp의 구조만 복사된 emp10 복사테이블을 만들고, 
--     emp테이블에서 부서번호가 10이 데이터를 subquery로 emp10에 입력하세요. 
-- ex2) emp 테이블에서 직책별 최고급여를 emp10 테이블에 입력 처리하세요.
 * */
CREATE TABLE emp100
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp100;
INSERT INTO emp100
SELECT * FROM emp WHERE deptno = 10;
INSERT INTO emp100(job, sal)
SELECT job, max(sal)
FROM emp
GROUP BY job;
/*
# 하나의 sql로 여러 테이블 입력 처리.
1. 서버퀄리의 결과 집합을 조건없이 여러 테이블에 동시에 입력
2. 형식
	insert all|first  : all(전체), first(첫번째 데이터)
	into 테이블1 values(컬럼명1, 컬럼명2 ...)
	into 테이블2 values(컬럼명1, 컬럼명2 ...)
	into 테이블3 values(컬럼명1, 컬럼명2 ...)
	서버 쿼리;
 * */
CREATE TABLE emp05 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp06 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp07 AS SELECT * FROM emp WHERE 1=0;
SELECT *  FROM emp05;
SELECT *  FROM emp06;
SELECT *  FROM emp07;
INSERT ALL
INTO emp05(empno, ename, sal) values(empno, ename, sal)
INTO emp06(empno, ename, sal) values(empno, ename, sal)
INTO emp07(empno, ename, sal) values(empno, ename, sal)
SELECT empno, ename, sal
FROM emp
WHERE deptno=10;
-- ex) emp08, emp09, emp11 emp의 구조 복사.
--     sal가 2000~4000사이의 emp의 ename, sal, hiredate를 입력처리
CREATE TABLE emp08 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp09 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp10 AS SELECT * FROM emp WHERE 1=0;
INSERT ALL
INTO emp08(ename,sal,hiredate) values(ename,sal,hiredate)
INTO emp09(ename,sal,hiredate) values(ename,sal,hiredate)
INTO emp10(ename,sal,hiredate) values(ename,sal,hiredate)
SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 2000 AND 4000;
SELECT * FROM emp08;
SELECT * FROM emp09;
SELECT * FROM emp10;

DROP TABLE emp12;
DROP TABLE emp13;
DROP TABLE emp14;
CREATE TABLE emp12 
AS SELECT deptno, max(hiredate) mdate, min(hiredate) idate 
FROM emp 
GROUP BY deptno having 1=0;

CREATE TABLE emp13 AS SELECT deptno, max(hiredate) mdate, min(hiredate) idate FROM emp 
GROUP BY deptno having 1=0;
CREATE TABLE emp14 AS SELECT deptno, max(hiredate) mdate, min(hiredate) idate FROM emp 
GROUP BY deptno having 1=0;

INSERT ALL
INTO emp12 values(deptno, mdate, idate)
INTO emp13 values(deptno, mdate, idate)
INTO emp14 values(deptno, mdate, idate)
SELECT deptno, max(hiredate) mdate, min(hiredate) idate 
FROM emp
GROUP BY deptno;
SELECT * FROM emp12;
SELECT * FROM emp13;
SELECT * FROM emp14;




















