--1. 그룹함수의 기본 형식을 기술하세요.
/*
	select 컬럼명, 그룹함수명(), 그룹함수명2()...
	from 테이블명
	group by 컬럼명
	having 그룹함수명의 조건;
 */
--2. 그룹함수의 종류와 내용을 기본예제를 통해서 기술하세요.
/*
	종류 : count, max, min, sum, avg
	
 * */
	SELECT deptno, count(*), sum(sal), max(sal)
	FROM emp
	GROUP BY deptno;

--3. 전체내용을 그룹함수로 처리하는 부분과 특정 컬럼의 데이터를 기준으로
--    그룹함수를 처리할 때, 코드의 차이점을 예제로 기술하세요.
/*  1) 전체내용을 그룹함수로 처리 : 특정한 컬럼의 데이터를 기준으로하지 않고,
 * 		테이블내에 특정한 컬럼의 전체 데이터의 기준으로 함수처리를 한다.
 * 		select count(*), sum(sal)
 *  	from emp;
 * 		count(*) : emp 테이블의 전체 카운터 갯수
 *  	sum(컬럼명) : emp 테이블의 특정한 컬럼의 전체 총계
 *  2) 특정 컬럼의 데이터를 기준 : 특정 컬럼명의 데이터를 기준으로 
 * 		데이터를 그룹으로 나누어서 처리하는 것을 말한다.
 *      select deptno, sum(sal)
 *      from emp
 * 		group by deptno;
 * 		부서번호 데이터 종류별로 급여의 합계를 처리하여 출력한다.*/
SELECT deptno, SAL 
FROM emp
ORDER BY deptno;
SELECT deptno, sum(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;
--4. 입사월별 인원수를 출력하세요. 입사월  인원
SELECT to_char(hiredate,'MM')
FROM emp;
SELECT to_char(hiredate,'MM') "입사월",count(*)
FROM emp
GROUP BY to_char(hiredate,'MM')
ORDER BY 입사월;
--  ex1) 사원번호별 짝수/홀수의 건수를 출력 
SELECT decode(mod(empno, 2),1,'홀수','짝수') "구분", count(*)
FROM emp
GROUP BY mod(empno, 2);
--  ex2) 입사 분기별 건수를 출력  
SELECT to_char(hiredate,'Q') "분기", count(*)
FROM emp
GROUP BY to_char(hiredate,'Q')
ORDER BY 분기;
--5. 직책(job)별 최고 급여자가 2000이상인 경우를 출력하세요
--    직책  최고급여
SELECT job, max(sal)
FROM emp
GROUP BY job
HAVING max(sal)>=2000;

--6. 조인테이블의 연결이 없는 카티시안 조인과 equi join의 차이점을 기술하세요
/*
카티시안 조인 : 테이블간의 공통 컬럼 연결 없이 조회 처리한다.
	데이터건수가 테이블건수X테이블건수로 나타난다.
equa join : 테이블간의 공통 컬럼으로 연결하여 해당 내용을 조회 처리된다.
	데이터건수는 두 테이블간의 데이터의 연결된 것을 기준으로 나타난다.	
 * */
	SELECT count(*)
	FROM emp, dept;
	SELECT count(*)
	FROM emp e, dept d
	WHERE e.deptno = d.deptno;
--7. 급여가 2000~4000사이의 사원의 번호, 이름, 부서명을 출력하세요.
	SELECT empno, ename, dname
	FROM emp e, dept d
	WHERE e.deptno = d.deptno
	AND sal BETWEEN 2000 AND 4000;
--8. non equi join이란 무엇인가?
--  두개 테이블의 데이터를 비교하여 = (비교연산자)자 아닌 범위나 다른
--  형태로 데이터를 비교하여 join 하는 것을 말한다.
--	ex) 급여 등급 테이블과 사원테이블의 급여를 between로 비교하는 것이
--    예시로 들 수 있다.
--9. salgrade의 1,2등급에 해당하는 사원 정보를 출력하세요.
SELECT * FROM salgrade;
	SELECT e.*, grade
	FROM emp e, salgrade s
	WHERE sal BETWEEN losal AND hisal
	AND grade IN (1,2);


