/*
# 0616 정리문제 #
	1. 그룹함수의 기본 형식을 서술하세요.
	
	 	select 컬럼명, 그룹함수1, 그룹함수2...
 		from 테이블명
 		where 조건
 		group by 그룹할컬럼
 		having 그룹함수의조건;
	
	2. 그룹함수의 종류와 내용을 기본예제를 통해서 기술하세요.
	
	 	count() : 행의 갯수
 		max() : null을 제외한 모든 행의 최대값
 		min() : null을 제외한 모든 행의 최소값
 		sum() : null을 제외한 모든 행의 합산값
 		avg() : null을 제외한 모든 행의 평균값
 		stddev() : null을 제외한 모든 행의 표준편차
 		variance() : null을 제외한 모든 행의 분산
	
		*/
			-- 부서번호가 30인 comm의 데이터 건수를 출력
			SELECT count(comm), max(comm), min(comm), sum(comm), avg(comm), stddev(comm), variance(comm)
			FROM emp
			WHERE deptno=30;
			SELECT *
			FROM emp;
		/*
	
	3. 전체 내용을 그룹함수로 처리하는 부분과 특정 컬럼의 데이터를 기준으로 그룹함수를 처리할 때 코드의 차이점을 예제로 기술하세요.		
	
		1) 전체 내용을 그룹함수로 처리 : 특정한 컬럼의 데이터를 기준으로 하지 않고 테이블 내에 특정한 컬럼의 전체 데이터의 기준으로 함수 처리를 한다.
		
			SELECT count(*), sum(sal)
			FROM emp;
			count(*) : emp 테이블의 전체 카운터 갯수
			sum(컬럼명) : emp 테이블의 특정한 컬럼의 전체 총계
		
			*/
				SELECT count(*), sum(sal)
				FROM emp;
			/*
	
		2). 특정 컬럼의 데이터를 기준 : 특정 컬럼명의 데이터를 기준으로 데이터를 그룹으로 나누어서 처리하는 것을 말한다.
		
			SELECT deptno, sum(sal)
			FROM emp
			GROUP BY deptno;
			부서번호 데이터 종류별로 급여의 합계를 처리하여 출력한다.
			
			*/
				SELECT deptno, sal
				FROM emp
				ORDER BY deptno;
				SELECT deptno, sum(sal)
				FROM emp
				GROUP BY deptno
				ORDER BY deptno;
			/*
		
	4. 입사월별 인원 수를 출력하세요. (입사월 인원)
	
		*/
			SELECT TO_CHAR(hiredate, 'MM')
			FROM EMP;
			SELECT TO_CHAR(hiredate, 'MM') "입사월", count(*)
			FROM EMP
			GROUP BY to_char(hiredate,'MM')
			ORDER BY 입사월;
		
			-- ex1) 사원번호별 짝수/홀수의 건수를 출력.
				SELECT decode(mod(empno, 2),1,'홀수','짝수') "구분", count(*)
				FROM EMP
				GROUP BY mod(empno, 2);
				
			-- ex2) 입사 분기별 건수를 출력.
				SELECT to_char(hiredate,'Q') "분기", count(*)
				FROM emp
				GROUP BY to_char(hiredate,'Q')
				ORDER BY 분기;
		/*
	
	5. 직책(job)별 최고 급여자가	2000 이상인 경우를 출력하세요. (직책, 최고급여)			
	
		*/
			SELECT job "직책", max(sal) "최대 급여"
			FROM emp
			GROUP BY job
			HAVING max(sal) >= 2000;
		/*
	
	6. join 테이블의 연결이 없는 카티시안 join과 equi join의 차이점을 기술하세요.
	
		카티시안 join : 테이블간의 공통 컬럼 연결 없이 조회 처리한다.
					  테이블 건수가 테이블건수X테이블건수로 나타난다.
		equa join : 테이블 간의 공통 컬럼으로 연결하여 해당 내용을 조회 처리된다.
					데이터 건수는 두 테이블 간의 데이터의 연결된 것을 기준으로 나타난다.
					
			*/
				SELECT count(*)
				FROM emp, dept;
				SELECT count(*)
				FROM emp e, dept d
				WHERE e.deptno = d.deptno;
			/*
		
	7. 급여가 2000~4000사이의 사원의 번호, 이름, 부서명을 출력하세요.
	
		*/
			SELECT empno, ename, dname
			FROM emp e, dept d
			WHERE e.deptno = d.deptno
			AND sal BETWEEN 2000 AND 4000;
		/*
	
	8. non equi join의 정의를 기술하세요.
	
		- 두 개 테이블의 데이터를 배교하여 = (비교연산자)가 아닌 범위나 다른 형태로 데이터를 비교하여 join 하는 것을 말한다.
		ex) 급여 등급 테이블과 사원 테이블의 급여를 between로 비교하는 것이 예시로 들 수 있다.
	
	9. salgrade의 1,2등급에 해당하는 사원 정보를 출력하세요.
	
		*/
		SELECT * FROM salgrade;
			SELECT e.*, grade
			FROM emp e, salgrade s
			WHERE sal BETWEEN losal AND hisal
			AND grade IN (1,2);
		/*
	 
*/