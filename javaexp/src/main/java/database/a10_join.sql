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
SELECT dname, ename -- 출력할 데이터 컬럼
FROM emp e, dept d -- 테이블명
WHERE e.deptno=d.deptno; -- join관계에 있는 컬럼을 지정

-- ex2) 1/4분기에 입사한 사원의 부서명, 부서위치, 사원명, 분기를 출력하세요.
SELECT dname, loc, ename, to_char(hiredate,'Q')
FROM emp e, dept d
WHERE e.DEPTNO=d.DEPTNO
AND to_char(hiredate,'Q') = '1';

-- ex3) 부서명이 'SALES'인 사원의 사원명과 부서명을 출력하세요.
SELECT ename, dname
FROM emp e, dept d
WHERE e.deptno=d.deptno
AND dname = 'SALES';

-- SQL Error [918] [42000]: ORA-00918: column ambiguously defined
-- 공통되는 컬럼은 반드시 소속된 테이블을 지정해야 한다.
SELECT ename, dname, e.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND d.deptno=20;

-- ex1) 급여가 1000~3000사이의 부서명, 사원명, 급여를 출력하세요.
SELECT dname, ename, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal BETWEEN 1000 AND 3000;

-- ex2) 부서위치별 평균급여를 출력하세요. (부서위치, 평균급여)
SELECT loc, avg(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY loc;
/*
 FROM emp e, dept d
 WHERE e.deptno = d.deptno로 통합된 하나의 테이블에서 그룹을 처리한다.
 */

-- ex3) 하반기 입사한 사람의 이름과 상/하반기구분, 부서명, 부서위치
-- 		to_char(hiredate,'Q') : 1,2(상반기), 3,4(하반기)
-- 		to_char(hiredate,'MM') : 1~6(상반기), 7~12(하반기)
-- 		oracle 서버에서는 숫자형 문자열은 자동 형 변환을 지원하고 있다.
-- 		가능한 한 to_number()함수를 활용해서 처리해야 한다.

SELECT ename, to_char(hiredate,'Q'),
	CASE WHEN to_number(to_char(hiredate,'Q')) <=2 THEN '상반기'
		 ELSE '하반기'
	END "구분",
	dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND to_number(to_char(hiredate,'Q')) >= 3; -- 3,4 하반기에 입사한 사람 조건 처리

-- ex1) 부서이름별 최근에 입사한 사람의 입사일을 출력하세요. (부서이름, 최근입사일)
-- 		hint) 최근입사 max(hiredate)
SELECT max(hiredate) "최근", min(hiredate) "최초"
FROM emp;

SELECT deptno, max(hiredate) "부서별 최근 입사일"
FROM emp
GROUP BY deptno;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- 두 개의 테이블을 join 관계 안에서 group 처리를 했다.
SELECT dname, max(hiredate)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY dname;
-- ==> 부서위치별(loc), 최초 입사한 사람의 입사일을 출력
SELECT loc, min(hiredate)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY loc;

-- ex2) 전체 평균 연봉을 확인하고 평균 연봉 이상을 상급, 미만은 하급으로 나누어 사원명 연봉 연봉구분을 부서번호가 10,20인 경우를 출력하세요.
-- 		전체 평균 연봉 avg(sal) 확인
SELECT avg(sal)
FROM emp;

/*
 case when 조건1 then 데이터1
 	  when 조건2 then 데이터2
 	  else 데이터3
 end
 */

SELECT dname, ename, sal,
		CASE WHEN sal>=2077 THEN '상급'
		ELSE '하급'
		END "구분"
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno IN (10,20);

SELECT avg(sal)
FROM emp;
-- sal >= (SELECT avg(sal) FROM emp)
SELECT dname, ename, sal,
		CASE WHEN sal >= (SELECT avg(sal) FROM emp) THEN '상급'
		ELSE '하급'
		END "구분"
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno IN (10,20);
SELECT * FROM emp;

-- ex) 부서이름, 팀(청/백), 이름을 출력하되 연봉이 3000미만일 때
-- 		팀(청/백) : 사원번호 홀수일 때 청팀, 짝수일 때 백팀으로 처리.
-- 		mod(empno,2), decode() : 중첩함수
SELECT *
FROM emp e, dept d;
-- emp 12 dept 4 => 12x4=48
SELECT *
FROM emp;
SELECT *
FROM dept
WHERE deptno = 20;
SELECT ename, e.deptno, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- emp 테이블의 별칭 e로 설정하면 emp을 지칭한다.
-- dept 테이블의 별칭 d로 설정하면 dept을 지칭한다.
-- where emp.deptno = dept.deptno : emp 테이블의 deptno와 dept 테이블의 deptno를 연동해서 두 테이블의 정보를 다 확인하기 위하여 사용한다.
SELECT ename, dname, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal > 2000;
-- 전체가 연결을 만들어 하나의 테이블로 사용할 수 있다.
-- 1. select로 선택해서 보여주고자 하는 컬럼 출력할 수 있고,
-- 2. where 조건을 통해서 조회 조건을 만들 수 있다.
-- 3. 여러가지 함수나 group함수를 활용할 수 있다.

-- # 테이블1 natural join 테이블2
--	 테이블1과 테이블2의 공통 컬럼을 자동으로 join 시켜서 처리해주는 oracle에서 지원하는 코드이다.
-- 	 SQL : ANSI 방식 SQL 표준 + 각 DB 서버마다 지원하는 SQL
SELECT *
FROM emp NATURAL JOIN dept;
