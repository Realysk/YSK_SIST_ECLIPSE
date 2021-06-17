/*
 # non equi join
 	1. join하는 두 개의 테이블의 값이 동일하지 않고, 범위로써 join하는 경우를 말한다.
 */
SELECT ename, sal
FROM emp;
SELECT *
FROM salgrade;
SELECT ename, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;

-- ex1) 4등급에 해당하는 사원들의 정보를 출력하세요.
SELECT e.*, s.GRADE 
FROM emp e, salgrade s
WHERE sal BETWEEN LOsAL AND hisal
AND grade=4;

-- ex2) SMITH의 급여와 등급을 출력하세요.
SELECT ENAME, SAL, GRADE
FROM emp e, salgrade s
WHERE sal BETWEEN LOsAL AND hisal
AND ename = 'SMITH';

-- ex3) job이 SALESMAN의 급여와 등급을 출력하세요.
SELECT ENAME, JOB, SAL, GRADE
FROM emp e, salgrade s
WHERE sal BETWEEN LOsAL AND hisal
AND JOB = 'SALESMAN';

-- ex) 부서별 최고급여와 그 등급을 출력하세요.
SELECT DEPTNO, MSAL, GRADE
FROM (SELECT deptno, MAX(SAL) MSAL
	  FROM EMP e 
      GROUP BY deptno), SALGRADE S
WHERE MSAL  BETWEEN LOsAL AND hisal;

SELECT deptno, MAX(SAL) MSAL
	  FROM EMP e 
      GROUP BY deptno;
SELECT DISTINCT deptno
FROM emp;
SELECT *
FROM dept;

/*
 # Outer Join
 	1. EQUI JOIN의 join 조건에서 양측 칼럼 값 중 어느 하나라도 null이면 '='
 		비교 결과가 거짓이 되어 null 값을 가진 행은 join 결과로 출력 불가
 		null에 대해서 어떠한 연산을 적용하더라도 연산 결과는 null
 		일반적인 EQUI JOIN의 예 :
 			학생 테이블의 학과번호 컬럼과 부서 테이블의 부서번호 컬럼에 대한
 			EQUI JOIN(student.deptno = department.deptno) 한 경우
 			학생 테이블의 deptno 컬럼이 null인 경우 해당 학생은 결과로 출력되지 못함.
 	2. EQUI JOIN에서 양측 컬럼 값 중 하나가 null이지만 join 결과로 출력 할 필요가 있는 경우 OUTER JOIN 사용
 		OUTER JOIN의 예 :
 			학생 테이블과 교수 테이블을 EQUI JOIN하여 학생의 지도 교수 이름 출력
 			조건 : 지도 학생을 한 명도 배정받지 못한 교수 이름도 반드시 함께 출력
 	3. (+) 기호를 사용한 OUTER JOIN
 		WHERE 절의 join 조건에서 OUTER JOIN 연산자인 '(+)' 기호 사용
 		join 조건문에서 null이 출력 되는 테이블의 컬럼에 (+) 기호 추가
 	4. 기본 구문
 		SELECT		table.column, table2.column
 		FROM		table1, table2
 		WHERE		table1.column(+) = table2.column
 			또는 ; 	table1.column = table2.column(+)
 */

SELECT DISTINCT deptno
FROM emp;
SELECT *
FROM dept;
SELECT e.ename, e.deptno, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;
-- 이와 같이 dept에는 있으나 emp에 할당되지 않아 보이지 않는 데이터도 join 현황에서 확인하고자 할 때 out join을 활용한다.