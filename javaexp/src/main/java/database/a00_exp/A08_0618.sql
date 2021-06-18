/*
# 0618 정리문제 #
	1. 일반 조인과 outer join의 차이점을 기술하세요.
		- 테이블 간의 공통 컬럼을 기준으로 데이터를 join하여 출력하는 것을 말하는데, 테이블 간의 공통 데이터가 없는 경우에도 특정한 테이블의 데이터는 null로 표기하여 출력처리하는 것을 말한다.
		기준이 되는 테이블의 데이터를 확인하여 연결 여부를 전체 보기 위한 내용이다.
		
	2. outer join의 기본문을 dept, emp를 예제로 기술하세요.
		- join시 null이 나올 수 있는 테이블의 컬럼에 (+)를 표시한다.
		
		*/
			SELECT d.*, e.*
			FROM emp e, dept d
			WHERE e.deptno(+) = d.deptno;
		/*	
	
	3. self 조인이 무엇인지 emp 테이블의 empno, mgr을 기준으로 설명하세요.
		- 같은 테이블 내에 존재하는 컬럼과 컬럼끼리 join관계를 설정하는 것을 말한다.
		- 두 개의 컬럼에 특정한 연관관계가 있을 때 가능하다.
		- 일반적으로 계층형 SQL에서 주로 활용된다.
		- emp테이블의 관리자번호(mgr)은 사원번호(empno)와 연관관계가 있다.
		
		*/
			SELECT e.ename "사원명", m.empno "관리자번호", m.ename "관리자명"
			FROM emp e, emp m
			WHERE e.mgr = m.empno;
		/*	
	
	4. self join을 활용하여 사원명(부서명)의 관리자는 관리자명(부서명)을 출력하세요.
	
		*/
			SELECT e.ename || '(' || e.deptno || ')' || '의 관리자는 ' || m.ename || '(' || m.deptno || ')' show
			FROM emp e, emp m
			WHERE e.mgr = m.empno;
		/*	
	
	5. subquery의 개념을 정리하고, 1/4분기 최고 급여자를 예제로 출력처리하세요.
		- SQL에서 포함관계에서 SQL을 다시 처리하여 subquery의 결과 값을 기준으로 다시 mainquery를 수행시키는 것을 말한다.
	
		*/
			SELECT *
			FROM emp
			WHERE sal = (
				SELECT max(sal)
				FROM emp
				WHERE to_char(hiredate,'Q') = '1');
		/*	
	
	6. 3사분기에 입사한 사원들의 최소 연봉과 같은 사람을 출력하세요.
	
		*/
			SELECT *
			FROM emp
			WHERE sal = (
				SELECT min(sal)
				FROM emp
				WHERE to_char(hiredate,'Q') = '3');
		/*	
	
	7. 분기별로 입사한 사람의 최고 연봉자들의 정보를 분기기준으로 정렬하여 출력하세요.
		# subquery
			1) 단일 결과 데이터 처리 : 비교연산자 (=, >=, >, <, <=, !=)
				subquery가 하나의 결과값이 나올 때 처리한다.
					select *
					from 테이블명
					where 컬럼 = (subquery);
			2) 다중 결과 데이터 처리 : in, exists, any, all
				결과 값이 하나 이상일 때 해당 다중 결과를 기준으로 데이터를 처리할 때 활용 된다.
				(1) 1개의 열을 기준으로 결과가 나올 때
					select *
					from 테이블명
					where 컬럼 in (subquery);
					in의 경우는 해당 컬럼의 데이터를 or로 연결해서 처리할 때 활용 된다.
				(2) 2개 이상의 열을 기준으로 결과가 나올 때
					select *
					from 테이블명
					where (컬럼1, 컬럼2, ...) in (select 컬럼1, 컬럼2, ...) from ..);
					컬럼1데이터와 컬럼2데이터가 and로 같이 나올 때를 기준으로 데이터를 로딩한다.
	
		*/
			SELECT to_char(hiredate, 'Q') 분기, max(sal)
			FROM emp
			GROUP BY to_char(hiredate, 'Q')
			ORDER BY 분기;
		
			SELECT to_char(hiredate, 'Q') 분기, e.*
			FROM emp e
			WHERE (to_char(hiredate, 'Q'), sal) IN (
				SELECT to_char(hiredate, 'Q') 분기, max(sal)
				FROM emp
				GROUP BY to_char(hiredate, 'Q'))
			ORDER BY 분기;
			-- 분기별로 최대값을 기준으로 해당 데이터를 검색처리 한다.
			SELECT *
			FROM emp;
			
			-- ex1) 직책별 최저연봉에 해당하는 사원 정보를 subquery로 출력하세요.
				SELECT *
				FROM emp
				WHERE (job, sal) IN (
					SELECT job, min(sal)
					FROM emp
					GROUP BY job);
			
			-- ex2) empno를 짝/홀수로 나눠 짝수/홀수별로 최고연봉자의 사원 정보를 출력하세요.
				SELECT empno, mod(empno,2), decode(mod(empno,2),0, '짝수','홀수') div, sal
				FROM emp
				ORDER BY div;
			
				SELECT decode(mod(empno,2),0, '짝수','홀수') 구분자, max(sal)
				FROM emp
				GROUP BY decode(mod(empno,2),0, '짝수','홀수');
			
				SELECT decode(MOD(empno,2),0,'짝','홀') div, e.*
				FROM emp e
				WHERE (mod(empno,2), sal) IN (
					SELECT mod(empno,2), max(sal)
					FROM emp
					GROUP BY mod(empno,2));
				SELECT * FROM emp;
			-- group by란 특정 컬럼의 데이터를 그룹으로 나누는 것을 말한다.
		/*
	
	8. 직책별 최근 입사자 테이블, 사원테이블을 조인하여 사원 정보를 출력하세요. (테이블 subquery 활용)
	
		*/
			SELECT *
			FROM (
				SELECT job, max(hiredate) hiredate
				FROM emp
				GROUP BY job) a, emp b
			WHERE a.job = b.job
			AND a.hiredate = b.hiredate;
		
			SELECT * FROM emp;
			-- ex) 입사분기별 최고급여 테이블과 사원테이블을 join관계하여 해당 입사분기별 사원정보를 출력하세요.
			SELECT *
			FROM (
				SELECT to_char(hiredate,'Q'), max(sal)
				FROM emp
				GROUP BY to_char(hiredate,'Q')) a, emp b
			WHERE a.max(sal) = b.max(sal)
			AND a.to_char(hiredate,'Q') = b.to_char(hiredate,'Q');
		/*	
	
	9. emp테이블에서 컬럼job과 join할 테이블을 jobs라고 만들고 직책명 권한 직책등급으로 설정하여 처리하세요.
   	   데이터는 사원 대리 과장 차장 부장 입력하여 outer join되게 한 후 out join 결과 출력하세요.
   	   
 		*/
	
		/*  	   
   	   
 */