/*
 # View란?
 	1. 하나 이상의 기본 테이블이나 다른 뷰를 이용하여 생성 되는 가상 테이블
 	2. 장점
 		1) 데이터를 보호하기 위하여 활용된다. (보안적인 필요성)
 			- 지정 된 권한이 있는 사람만이 전체 테이블의 컬럼을 확인하고 활용할 수 있고,
 			그 외 사람은 뷰를 통해서 허용된 컬럼만을 조회하게 할 수 있다.
 		2) 사용자 편의성을 지원한다.
 			- query의 결과를 뷰로 만들었기 때문에 다른 테이블과 조인하거나 group 함수등을 통해서 출력한 query를
 			view라는 가상테이블로 간단하게 sql 조회할 수 있다.
 			- 복잡한 sql을 하나의 가상테이블로 간단하게 만들어 사용 가능하다.
 	3. 뷰의 종류
 		1) 단순 뷰 : 하나의 기본 테이블에 의해 정의 된 뷰
 		2) 복합 뷰 : 두 개 이상의 기본 테이블로 구성한 뷰
 			여러 테이블의 조인 관계를 통한 결과를 처리한 뷰
 		# 인라인 뷰 (inline view)
 			- from절에 참조하는 테이블의 크기가 클 경우 필요한 행과 컬럼만으로 구성된 집합을 재정의하여 질의문을 효율적으로 구성하는 것을 말한다.
 			- from 절에서 서버쿼리를 사용하여 생성한 임시 뷰를 말한다.
 			- SQL 명령문이 실행되는 동안만 임시적으로 정의한다.
 			select 컬럼
			from (inline view)
 			where 조건
 	4. 뷰의 한계
 		1. 단순 뷰
 			하나의 테이블로 생성
 			그룹 함수의 사용이 가능
 			distinct 사용이 가능
 			dml 사용 가능
 		2. 복합 뷰
 			여러 개의 테이블로 생성
 			그룹 함수의 사용이 불가능
 			distinct 사용이 가능
 			dml 사용 불가능
 		
 		1) 제한적 사용 : 무결성 제약조건, 표현식, group by 유무에 따라 DML명령문은 제한적으로 사용된다.
 		2) 수행 불가능 : distinct , 그룹함수, group by, start with, connect by, rownum은 포함할 수 없다.
 	5. 뷰 생성 기본
 		1) create [or replace] view 뷰 이름
 			as (subquery - select * from ***)
 		2) 옵션
 			or replace : 뷰를 생성할 때 생성 된 뷰가 있으면 동일한 이름의 뷰를 재 생성한다.
 			force : 기본 테이블의 존재 여부에 상관없이 뷰 생성
 				ex) 뷰를 먼저 만들고 테이블을 생성할 때 사용
 			noforce : 기본 테이블이 존재 할 경우에만 뷰 생성 [기본 값 default]
 */

-- 1981에 입사한 사원의 부서번호, 사원번호, 사원명, 사원급여가 있는 view 생성
CREATE VIEW v_emp
AS SELECT deptno, empno, ename, sal
FROM emp
WHERE to_char(hiredate,'YYYY') = '1981';
SELECT * FROM v_emp;
-- view는 실제적으로 물리적으로 테이블이 만들어지는 것이 아니기에 기존 emp에 영향을 미치거다 받는다.

-- ex) 부서별 인원, 최대급여, 최소급여를 뷰로 (v_emp_sum) 만들어 조회하세요.
CREATE VIEW v_emp_sum
AS SELECT count(*) cnt, max(sal) maxsal, min(sal) minsal
FROM emp
GROUP BY deptno;
SELECT * FROM v_emp_sum;

-- 단순 view를 통한 dml 처리
DROP TABLE emp31;
CREATE TABLE emp31
AS SELECT * FROM emp;
CREATE VIEW view_emp31
AS SELECT empno, ename, sal, deptno
FROM emp31
WHERE deptno = 10;
SELECT * FROM view_emp31;
-- view에 DML 처리
INSERT INTO view_emp31 VALUES (7999,'ANGEL',7000,10);
SELECT * FROM emp31;

-- 복합 뷰 만들기
CREATE TABLE dept04
AS SELECT * FROM dept;
CREATE VIEW view_emp_dept
AS SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp31 e, dept04 d
WHERE e.deptno = d.deptno
ORDER BY empno DESC;
SELECT * FROM view_emp_dept;
-- 복합 뷰의 데이터 입력
INSERT INTO view_emp_dept VALUES (8000,'HIMAN',3000,20,'인사','서울');
-- cannot modify a column which maps to a non key-preserved table
-- 복합 뷰는 에러가 발생한다.

-- 뷰의 삭제
-- drop view 뷰이름
DROP VIEW view_emp_dept;

-- ex) 복합 뷰 연습 : 사원정보 + 급여등급(salgrade) + 부서정보가 통합 된 복합 뷰를 만드세요.
SELECT * FROM salgrade;

CREATE VIEW view_emp_grade_dept
AS SELECT e.*, s.grade, dname, loc
FROM emp e, salgrade s, dept d
WHERE sal BETWEEN losal AND hisal
AND e.deptno = d.deptno;
SELECT * FROM view_emp_grade_dept;