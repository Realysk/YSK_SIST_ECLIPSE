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
		/*	
	
	8. 직책별 최근 입사자 테이블, 사원테이블을 조인하여 사원 정보를 출력하세요. (테이블 subquery 활용)
	
		*/
	
		/*	
	
	9. emp테이블에서 컬럼job과 join할 테이블을 jobs라고 만들고 
   	   직책명 권한 직책등급으로 설정하여 처리하세요.
   	   데이터는 사원 대리 과장 차장 부장 입력하여 outer join되게 한 후 out join 결과 출력하세요.
   	   
 		*/
	
		/*  	   
   	   
 */