SELECT * FROM emp;

/*
 # between 구문
 	1. 컬럼명 between A and B
 		동일한 결과 내용으로 컬럼명 >= A and 컬럼명 <= B
 */

-- sal가 1000에서 2000사이 데이터 출력
SELECT * FROM emp
WHERE sal BETWEEN 1000 AND 2000;

-- ex) empno가 7600~7900 사이의 데이터를 출력하세요.
SELECT *
FROM emp
WHERE empno BETWEEN 7600 AND 7900;


/*
 # null 데이터 처리.
 	1. 데이터가 할당되지 않는 경우를 의미한다.
 		'' 공백으로 들어간 데이터와 숫자형인 경우 0으로 들어간 데이터와 차이가 있다는 것을 반드시 확인해야 한다.
 	
 	2. 처리 내용
 		1) 조건문 처리 (where)
 			컬럼명 is null : 해당 컬럼에 데이터가 할당되지 않는 경우
 			컬럼명 is not null : 해당 컬럼에 데이터가 할당된 경우
 		2) 함수 처리 nvl
 			nvl(컬럼명, null일 때 나올 데이터)
 			숫자형 nvl(comm, 0)
 			문자형 nvl(ename, '')
 			null은 연산 처리가 되지 않기에 연산처리가 조건문에서 활용할 때 사용된다.
 			* (주의) *
 			컬럼과 null일 때, 나올 데이터는 동일해야 한다.
 			nvl(ename,0) (X) : 해당 컬럼의 데이터 유형에 맞게 default 데이터를 할당해야 한다.
 			nvl(comm,'') (X) :
 			nvl(''||comm, '') (O)
 			ex) sal + nvl(comm,0) : 연산 처리
 				where nvl(comm,0) = 0;
 					조건문에서 null값 0을 둘 다 해당하는 데이터 검색 처리
 */

-- comm이 null인 경우에 숫자가 안되기에 연산이 불가능하다.
-- nvl을 활용하면 해당 내용에 대한 연산이 가능하다.
SELECT sal, comm, sal + comm "합산1",
		sal + nvl(comm, 0) "합산2"
FROM emp;
-- 프로그램으로 처리하여 나타날 0과 null을 동일시 하여 처리 조건에도 사용할 수 있다.
SELECT sal, comm
FROM emp
WHERE nvl(comm,0) != 0;
SELECT * FROM emp;

-- ex1) 사원명과 관리자번호(mgr)- null인 경우 0으로 출력하세요. (30%)
SELECT ename, nvl(mgr,0) mgr
FROM emp;

-- ex2) 중복되지 않는 관리자번호를 출력하세요. null이 아닌 경우만 (nvl 함수 이용) (60%)
SELECT DISTINCT mgr
FROM emp
WHERE nvl(mgr,0) != 0;

/*
 # in 구문
 	1. 데이터는 or 조건에 관련된 내용은 '이거나'로 해당 조건 이외에 조건에 대한 내용을 논리적으로 처리해준다.
 	2. 이 때 하나의 컬럼을 기준으로 많은 or 조건을 처리할 때, 효과적이고 간편하게 처리하기 위해 in 구문을 제공한다.
*/

SELECT ename, deptno
FROM EMP e 
WHERE deptno = 10 OR deptno 20;

-- 컬럼명 in (데이터1, 2) : 해당 컬럼에 데이터1이거나 데이터2인 함수
SELECT ename, deptno
FROM EMP e 
WHERE deptno IN (10,20);

SELECT empno, ename, deptno
FROM emp
WHERE empno IN (7369, 7521, 7654);

-- ex) job이 SALESMAN 이거나 MANAGER 인 경우를 IN 구문을 이용해서 출력하세요.
SELECT *
FROM emp
WHERE job IN ('SALESMAN', 'MANAGER');
-- subquery : 수행된 결과값을 기준으로 다시 조회 조건을 처리하는 구문
-- 부서번호가 30번인 사원번호를 검색해서 그 사원번호에 해당하는 사원정보를 처리.
SELECT *
FROM emp
WHERE empno IN (
	SELECT empno
	FROM emp
	WHERE deptno = 30);
-- 연봉이 최고인 사람의 정보를 출력하세요.
SELECT max(sal)
FROM emp;
SELECT *
FROM EMP e
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp); -- 부서별 최고 연봉자의 정보를 출력

-- 부서별 최고 급여자 정보 표시
SELECT deptno, max(sal)
FROM emp
GROUP BY deptno;

SELECT *
FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno
);

-- ex) 직책별 최근 입사한 사람들 정보 출력
-- ex) 부서별로 최저 급여자들 정보 출력

/*
 # like 연산자를 이용한 keyword 조건 검색
 	1. 컬럼에 저장된 문자열 중에서 like 연산자에서 지정한 문자 패턴과 부분적으로 일치하면 참이 되어 조건문에서 검색되게 하는 것을 말한다.
 	ex) 사원명에 'A'라는 문자열을 포함하면 조회되게 한다.
 		1) 위치 상관없이 검색 : 컬럼명 like '%A%'
 		2) 'A'로 시작하면 검색 : 컬럼명 like 'A%'
 		3) 'N'로 끝나는 검색 : 컬럼명 like '%N'
 		4) 자릿수 위치에 맞는 데이터 검색 - 세번째 자리에 'A'가 나오는 데이터 검색 : 검색할 컬럼명 like '__A%'
 			두번째 4번째 자리에 A B 나오게 like '_A_B%'
*/
-- 1)
SELECT *
FROM emp
WHERE ename LIKE '%A%';
-- 2)
SELECT *
FROM emp
WHERE ename LIKE 'A%';
-- 3)
SELECT empno, ename
FROM emp
WHERE ename LIKE '%N';
-- 4)
SELECT empno, ename
FROM emp
WHERE ename LIKE '__A%';

-- ex1) job컬럼에 MAN이라는 글자가 포함되어 있으면 출력하세요.
SELECT *
FROM emp
WHERE job LIKE '%MAN%';

-- ex2) ename에서 'S'로 끝나는 글자와 'S'를 포함하는 글자가 있는 데이터를 구분해서 SQL을 2개 작성하세요.
SELECT *
FROM emp
WHERE ename LIKE '%S';
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- ex3) ename이나 job의 마지막에서 두번째 글자가 'E'가 들어가는 데이터를 조회하세요.
SELECT *
FROM emp
WHERE ename LIKE '%E_' OR job LIKE '%E_';

/*
 # 정렬 처리
 	1. SQL 명령문에서 검색된 결과는 테이블에 데이터가 입력된 순서대로 출력
 	2. 데이터의 출력 순서를 특정 컬럼을 기준으로 오름차순/내림차순으로 정렬하는 경우가 발생한다.
 	3. 여러 개의 컬럼에 대해 정렬 순서를 지정해서 처리해야 할 경우가 발생한다.
 		- 입사일은 오름차순, 급여 기준은 내림차순
 	4. 기본적인 정렬방법
 		- 문자값을 알파벳순으로 출력되고 한글은 가나다라 순으로 출력된다.
 		- 숫자 값을 가장 작은 값으로 먼저 출력.
 		- 날짜는 과거의 날짜순으로 출력된다.
 	5. 기본 형식
 		select *
 		from 테이블
 		where  ..
 		order by 컬럼명 [ASC/DESC]
 		ASC : default 오름차순 정렬
 		DESC : 역순으로 정렬
*/

-- 사원번호를 역순으로 사원번호와 이름을 조회
SELECT empno, ename
FROM emp
ORDER BY empno DESC;

-- ex1) 입사일(hiredate) 기준 역순으로 출력하세요.
SELECT hiredate
FROM emp
ORDER BY hiredate DESC;

-- ex2) 연봉을(sal) 오름차순으로 출력하세요.
SELECT sal
FROM emp
ORDER BY sal;

-- ex3) 부서번호(deptno) 오름차순, 연봉(sal) 내림차순으로 동시에 출력하세요.
SELECT deptno "부서번호", sal "급여", a.*
FROM emp a -- FROM 테이블명 별칭
ORDER BY deptno, sal DESC;