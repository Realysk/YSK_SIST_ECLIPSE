/*
# 데이터 수정 
1. update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어이다.
2. 기본형식
	update 테이블명
	set 컬럼1 = 변경할데이터,
	    컬럼2 = 변경할데이터,
	    컬럼3 = 변경할데이터
	 where 조건문   
3. 주의 사항
	1) where 절을 생략하면 테이블의 모든 행이 수정된다.
	2) 조건문과 변경할 데이터부분을 subquery를 이용하여 처리할 수 있다.
 * */
SELECT * FROM emp02;
UPDATE emp02
   SET empno = 5005,
       mgr = 7698,
       sal = 3600,
       comm = 500,
       deptno = 40
  WHERE ename = 'SMITH'; 
-- ex1) emp02에서 comm이 null인 데이터를 모두 1000으로 수정 처리하세요.
-- ex2) emp02에서 1/4분에 입사한 사원정보는 현재날짜로 수정 처리하세요. 
UPDATE emp02 
   SET comm = 1000
WHERE comm IS NULL; -- 컬럼명 IS NULL, 컬럼명 IS NOT null
UPDATE emp02
   SET hiredate = sysdate
   WHERE to_char(hiredate, 'Q') = '1';
/*
# subquery를 통한 수정 처리
1. update명령문에 set부분이나 where 조건절에 subquery를 이용하여 수정 처리하는 것을 말한다.
2. 다른 테이블이나 현재 테이블에 정보를 변경할 때, 일단 query를 수행한 결과로 해당 데이터를
	수정을 처리하는 것을 말한다.
3. 변경할 컬럼의 타입과 갯수는 반드시 일치 하여야 한다.
4. 유형
	1) set부분 subquery 활용
		- 한개의 컬럼  set 컬럼명 = (결과가 1개인 컬럼데이터)
		- 두개의 컬럼  set (컬럼명1, 컬럼명2) = (결과가 2개인 컬럼데이터)
 * */  
-- 부서번호가 10인 사원정보의 급여를 부서번호 20인 사원의 최고급여로 변경 처리..  
SELECT ename, sal
FROM emp03
WHERE deptno = 10;
SELECT max(sal)
FROM emp03
WHERE deptno = 20;
UPDATE emp03
	SET sal = (
		SELECT max(sal)
		FROM emp03
		WHERE deptno = 20		
	)
WHERE deptno=10;
SELECT * FROM emp03;
-- ex) job이 SALESMAN인 평균 급여를 사원번호 7499에 급여로 수정처리하세요.[5조]
SELECT avg(sal)
FROM emp03
WHERE job = 'SALESMAN';
SELECT empno, sal
FROM emp03
WHERE empno=7499;
UPDATE emp03
   SET sal = (
	  SELECT avg(sal)
		FROM emp03
	 WHERE job = 'SALESMAN'
   )
WHERE empno=7499;

-- ex) 1사분기 최고급여를 사원명 ALLEN의 급여로 변경처리 하세요.
SELECT max(sal)
FROM emp03
WHERE to_char(hiredate,'Q')='1';
-- cf)
SELECT to_char(hiredate,'Q'), max(sal)
FROM emp03
GROUP BY to_char(hiredate,'Q')
HAVING max(sal)>=2000;
-- having은 그룹함수를 조회조건으로 할 때, 활용된다.
SELECT ename, sal 
FROM emp03
WHERE ename = 'ALLEN';
UPDATE emp03
	SET sal = (
		SELECT max(sal)
		FROM emp03
		WHERE to_char(hiredate,'Q')='1'	
	)
WHERE ename = 'ALLEN';	
select * from emp;



SELECT * FROM emp03;
  
  
 
