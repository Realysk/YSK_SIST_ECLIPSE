--5. 날짜형 함수 중에, 월단위로 추가하거나 두 날짜 사이의 개월수을 확인하는 함수를 기본예제와 함께 기술하세요.
/*		months 기본으로 해서,
 * 		add_months(컬럼, 추가할개월수)
 * 		months_between(비교컬럼1, 비교컬럼2)*/
	SELECT ADD_MONTHS(hiredate, 2) "입사후 2개월 후",
		   MONTHS_BETWEEN(sysdate, hiredate ) 
		   	"입사후 개월수"
	FROM emp;
--6. 날짜/숫자를 처리시, 절삭/반올림/올림 처리하는 경우를 기술하세요.
/*	날짜데이터 + 1 : 날짜데이터는 1일을 기준으로 시간데이터는 소숫점으로 표기된다.
 * 	월단위 처리 메서드를 통해서는 월을 1을 기준으로 그 이하의 데이터는 소숫점으로
 * 	표기된다.
 *  floor() : 무조건 정수로 절삭처리
 * 	trunc(데이터, 자리수) : 해당 자리수로 절삭처리.
 * 	round(데이터, 자리수) : 해당 자리수로 반올림처리
 *  ceil() : 정수로 올림처리.
 * */
--7. 3/4 분기에 입사한 사원의 이름과 입사년월일 분기를 출력
	SELECT ename, to_char(hiredate,'YYYY/MM/DD') "입사년월일"
	FROM emp
	WHERE to_char(hiredate,'Q') = '3';
--8. nvl, nvl2, nullif 함수의 차이점을 기술하세요.
/*	nvl(컬럼명, 해당컬럼이 null일때 데이터)
 *  nvl2(컬럼명, null일 아닐때 데이터, null일때 데이터)
 *  nullif(비교1, 비교2) : 두개컬럼이 동일할 때, null을 리턴,
 * 		그외는 비교1데이터 처리
 * */
--9. decode와 case 함수의 기본형식을 기술하세요.
/*	# decode(컬럼, 컬럼케이스1, 출력할데이터1, 그외의출력할데이터2)
 * 		짝수의 케이스를 지정해서 해당 데이터일때, switch case와 비슷한 구조로
 * 		되어 있다.
 *  case 컬럼
 * 		when 케이스1 then 처리할 데이터
 * 		when 케이스2 then 처리할 데이터
 *      else 그외에 경우 처리할 데이터
 *	end
 *  # case when 비교|논리 then 처리할 데이터
 * 		   when 비교|논리 then 처리할 데이터
 * 		   ..
 * 		   else 그외 경우 처리할 데이터
 *  end
 * */

--10. 그룹함수를 이용하여 job의 갯수를 중복을 제외하고 출력할려는 sql을 작성하세요.
	-- 직책별 데이터 건수
	SELECT job, count(job)
	FROM emp
	GROUP BY job;
	-- 직책의 전체 데이터 건수
	SELECT count(job)
	FROM emp;
	-- 중복을 제외한 JOB의 갯수
	SELECT count(DISTINCT job)
	FROM emp;
--11. 부서별 최고 연봉자가 3000이상인 부서를 출력하세요.
	SELECT b.*
	FROM (SELECT DEPTNO, MAX(SAL)
		    FROM EMP
			GROUP BY DEPTNO
			HAVING MAX(SAL)>=3000) a, DEPT b
	WHERE a.deptno = b.deptno;

-- ex1) 분기별 최고 급여자가 2000이상으로 소속된 부서정보를 출력하세요. 1조
-- 1) 분기별 최고 급여자
SELECT to_char(hiredate, 'Q') q, max(sal) msal
FROM emp
GROUP BY to_char(hiredate, 'Q')
HAVING max(sal)>=2000;
-- 2) 부서정보와 join된 사원테이블
SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- 분기별 최고 급여자와 부서정보와 join된 사원테이블을 조인관계를
-- 설정하여, 부서정보를 출력하여야 한다.
SELECT d.*
FROM (
	-- 분기별 최고 급여자 ==> 부서정보를 출력하세요
	-- 분기별 최고 급여자 ==> 사원정보  ==> 부서정보
	-- 	1) 분기별 최고 급여자 ==> 사원정보 : 분기정보, 급여정보를 조인
	--  2) 사원정보와 부서정보 : 부서번호로 조인	
	SELECT to_char(hiredate, 'Q') q, max(sal) msal
	FROM emp
	GROUP BY to_char(hiredate, 'Q')
	HAVING max(sal)>=2000 ) a, emp e, dept d
WHERE a.q = to_char(e.hiredate, 'Q') -- 사원정보에 급여정보를 조인
AND a.msal = e.sal				     -- 사원정보에서 분기정보를 조인	
AND e.deptno = d.deptno; -- 사원정보와 부서정보를 조인
--12. 급여가 2000~3000사이의 부서명, 사원명, 급여를 출력하세요.
SELECT dname, ename, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal BETWEEN 2000 AND 3000;

--13. subquery 종류를 기본 예제를 통해서 기술하세요.
--   1) where 조건 결과를 통한 subquery
--		단일 데이터 subquery
SELECT *
FROM emp
WHERE sal = (SELECT max(sal) FROM emp);
--		다중 데이터 subquery
SELECT *
FROM emp
WHERE (deptno, sal) in(
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno
);
--   2) 테이블 subquery
SELECT *
FROM (SELECT * FROM emp WHERE sal >=3000) e,
(SELECT * FROM dept WHERE deptno= 10) d
WHERE e.deptno = d.deptno;
--	 3) select subquery
SELECT (SELECT max(sal) 
		FROM emp 
		WHERE deptno=a.deptno) "소속부서최고급여", 
	a.*
FROM emp a;
--14. 2등급에 해당하는 사원들의 정보를 출력하세요.
--   non equi join 처리
SELECT g.grade, e.*
FROM emp e, SALGRADE g
WHERE e.sal BETWEEN losal AND hisal
AND g.GRADE = '2';


