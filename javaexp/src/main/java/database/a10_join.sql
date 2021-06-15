/*
 # join
 	1. 하나의 SQL 명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능을 말한다.
 	2. 관계형 데이터베이스 분야의 표준으로 자리 잡고 있다.
 	3. 두 개 이상의 테이블을 결합한다는 의미이다.
 */

-- 1. join이 필요하지 않는 경우
-- 사원 정보 테이블에서 해당 관련 부서 정보를 출력할 때,
-- ex) 연봉이 3000이상인 사원이 있는 부서번호를 가져오기.
SELECT deptno
FROM emp
WHERE sal >= 3000;
-- ex) 위에서 확인된 부서번호를 통해서 부서 테이블의 상세 정보를 확인
SELECT *
FROM dept
WHERE deptno IN (10,30);

-- 2. join이 필요한 경우
-- ex) 연봉이 3000이상인 사원의 정보와 부서 정보를 한번에 확인할 때
SELECT empno, ename, sal, e.deptno, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal >= 3000;
-- select 선택 컬럼 : 중복된 컬럼만 alias 이름을 지정해도 된다. e.deptno
-- from 테이블명 별칭, 테이블명 별칭 : join할 테이블을 별칭과 함께 나열한다.
-- where 별칭.컬럼명 = 별칭.컬럼 : 두개 테이블에서 공통으로 연결한 컬럼명을 별칭과 함께 join해준다. inner join이라 한다.
-- and 기타조건 : 그 외 join한 내용의 데이터를 기준으로 조회 조건을 처리한다.

-- ex1) 부서명, 사원명을 join으로 출력하세요.
SELECT dname, ename
FROM emp, dept;

-- ex2) 1/4분기에 입사한 사원의 부서명, 부서위치, 사원명, 분기를 출력하세요.
SELECT dname, loc, ename
FROM dept d
WHERE to_char(hiredate,'Q') = '1';

-- ex3) 부서명이 'SALES'인 사원의 사원명과 부서명을 출력하세요.
SELECT d.ename, e.dname
FROM emp e, dept d
WHERE dname = 'SALES';