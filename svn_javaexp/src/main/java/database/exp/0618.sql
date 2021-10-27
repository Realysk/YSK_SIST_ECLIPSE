--# 전날 정리 문제
--1. 일반 조인과 outer join의 차이점을 기술하세요.
/*	테이블간의 공통 컬럼을 기준으로 데이터를 조인하여 출력하는 것을 말하는데,
 * 	테이블간의 공통데이터가 없는 경우에도 특정한 테이블의 데이터는 null로
 *  표기하여 출력처리하는 것을 말한다.
 *  기준이 되는 테이블의 데이터를 확인하여, 연결여부를 전체 보기 위한
 *  내용이다.
 * 
 * */
--2. outer join의 기본문을 dept, emp를 예제로 기술하세요.
--   join시 null이 나올 수 있는 테이블의 컬럼에 (+)를 표시한다.
	SELECT d.*, e.*
	FROM emp e, dept d
	WHERE e.deptno(+) = d.deptno;


--3. self 조인이 무엇인지 emp 테이블의 empno, mgr을 기준으로 설명하세요.
--	같은 테이블내부에 존재하는 컬럼과 컬럼끼리 조인관계를 설정하는 것을 말한다.
--  두 개의 컬럼에 특정한 연관관계가 있을 때, 가능하다.
--  일반적으로 계층형 sql에서 주로 활용된다.
--  emp테이블의 관리자번호(mgr)은 사원번호(empno)와 연관관계가 있다.
	SELECT e.ename "사원명", m.empno "관리자번호", m.ename "관리자명"
	FROM emp e, emp m
	WHERE e.mgr = m.empno;
	
--4. self 조인을 활용하여 사원명(부서명)의 관리자는 관리자명(부서명)을 출력하세요.
	SELECT e.ename|| '('|| e.deptno||')'||'의 관리자는 '||
			m.ename || '('|| m.deptno||')' show
	FROM emp e, emp m
	WHERE e.mgr = m.empno;

--5. subquery의 개념을 정리하고, 1/4분기 최고 급여자를 예제로 출력처리하세요.
/*	sql에서 포함관계에서 sql을 다시 처리하여 sub query의 결과값을 기준으로 
 * 	다시 main query를 수행시키는 것을 말한다.
 * 
 * */
	SELECT *
	FROM emp
	WHERE sal = (
		SELECT max(sal)
		FROM emp
		WHERE to_char(hiredate,'Q') = '1');

--6. 3사분기에 입사한 사원들의 최소 연봉과 같은 사람을 출력하세요.
	SELECT *
	FROM emp
	WHERE sal = (
		SELECT min(sal)
		FROM emp
		WHERE to_char(hiredate,'Q') = '3');	
	
--7. 분기별로 입사한 사람의 최고 연봉자들의 정보를 분기기준으로 정렬하여 출력하세요
/*
# subquery
1. 단일결과 데이터 처리 : 비교연산자(=,>=,>,<,<=,!=)
	subquery가 하나의 결과값이 나올 때, 처리한다.
	select *
	from 테이블명
	where 컬럼 = ( subquery);
2. 다중결과 데이터 처리 : in, exists, any, all	
	결과값이 하나이상일 때, 해당 다중의 결과를 기준으로 데이터를 처리할 때
	활용된다.
	1) 1개의 열을 기준으로 결과가 나올 때
	select *
	from 테이블명
	where 컬럼 in (subquery );
	in의 경우는 해당 컬럼의 데이터를 or로 연결해서 처리할 때, 활용된다.
	2) 2개 이상의 열을 기준으로 결과가 나올 때
	select *
	from 테이블명
	where (컬럼1, 컬럼2, ...) in(select 컬럼1, 컬럼2 ...) from ..);
	컬럼1데이터와 컬럼2데이터가 and로 같이 나올 때를 기준으로 데이터를
	로딩한다.
	
 * */	
	
	SELECT to_char(hiredate,'Q') 분기, max(sal)
	FROM emp
	GROUP BY to_char(hiredate,'Q')
	ORDER BY 분기;
	SELECT to_char(hiredate,'Q') 분기, e.*
	FROM emp e
	WHERE (to_char(hiredate,'Q'), sal) in(
		SELECT to_char(hiredate,'Q'), max(sal)
		FROM emp
		GROUP BY to_char(hiredate,'Q')		
	)
	ORDER BY 분기;
--  분기별로 최대값을 기준으로 해당 데이터를 검색처리 한다.
--
SELECT *
FROM emp;
-- ex1) 직책별 최저연봉에 해당하는 사원 정보를 subquery로 출력하세요
SELECT *
FROM emp
WHERE (job, sal) in(
	SELECT job, min(sal)
	FROM emp
	GROUP BY job);

-- ex2) empno를 짝홀수로 나누어서 짝수/홀수별로 최고연봉자의 사원 정보를 출력하세요.
-- 6조
SELECT empno, mod(empno,2), 
	decode(mod(empno,2),0,'짝','홀') div, sal
FROM emp
ORDER BY div;

SELECT decode(mod(empno,2),0,'짝','홀') 구분자, 
		max(sal)
FROM emp
GROUP BY decode(mod(empno,2),0,'짝','홀');

SELECT decode(mod(empno,2),0,'짝','홀') div, e.* 
FROM emp e
WHERE (mod(empno,2), sal) in(
	SELECT mod(empno,2), 
			max(sal)
	FROM emp
	GROUP BY mod(empno,2)
);
SELECT * FROM emp;
-- group by란 특정 컬럼의 데이터를 그룹으로 나누는 것을 말한다.
--8. 직책별 최근 입사자 테이블, 사원테이블을 조인하여 사원 정보를 출력하세요.
--	 (테이블 subquery 활용)
SELECT *
FROM (
SELECT job, max(hiredate) hiredate
FROM emp
GROUP BY job) a, emp b
WHERE a.job = b.job
AND a.hiredate = b.hiredate; 

SELECT * FROM emp;
-- ex) 입사분기별 최고급여 테이블과 사원테이블을 조인관계하여, 
--    입사분기별 사원정보를 출력하세요.
SELECT *
FROM ( SELECT to_char(hiredate, 'Q') div, max(sal) sal
		FROM emp
		group BY to_char(hiredate, 'Q')) a, emp b
WHERE a.div = to_char(b.hiredate, 'Q')
AND a.sal = b.sal
ORDER BY div;
SELECT *
FROM ( SELECT to_char(hiredate, 'Q') div, max(sal) sal
		FROM emp
		group BY to_char(hiredate, 'Q')) a, emp b
WHERE a.sal = b.sal;
/* 분기별 최고급여가 같은 경우...1분기, 4분기가 같은 경우
   위와 같은 경우에 1분기뿐만 아니라 4분기데이터도 같이 로딩이 된다.
   검색을 1분기와 4분기 별로 추가하여 where 조건을 하는 경우에도 
   문제가 발생을 한다.
 * */
--9. emp테이블에서 컬럼job과 join할 테이블테이블 jobs라고 만들고 
--   직책명 권한 직책등급으로 설정하여 처리하세요.
--   데이터는 사원 대리 과장 차장 부장 입력하여 outer join되게 한후, 
--   out join 결과 출력하세요
SELECT DISTINCT job, '권한    ' auth, '       ' grade
   FROM emp;


SELECT ename, job
FROM emp;

CREATE TABLE jobs
AS SELECT DISTINCT job, 
		  '권한    ' auth, 
		  '       ' grade
   FROM emp;
SELECT * FROM jobs;


SELECT e.ename, e.job, j.*
FROM emp e, jobs j
WHERE e.job(+) = j.job;
  
SELECT * FROM jobs;






