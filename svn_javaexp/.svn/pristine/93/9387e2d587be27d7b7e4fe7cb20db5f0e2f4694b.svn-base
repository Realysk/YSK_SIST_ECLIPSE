/*
# non equi join
1. 조인하는 두개의 테이블의 값이 동일하지 않고, 범위로서
	join하는 경우를 말한다.
 * */
SELECT ename, sal
FROM emp;
SELECT *
FROM SALGRADE;
SELECT ename, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;
-- ex1) 4등급에 해당하는 사원들의 정보를 출력하세요
SELECT e.*, s.GRADE 
FROM emp e, salgrade s
WHERE sal BETWEEN LOsAL AND hisal
AND grade=4;
-- ex2) SMITH의 급여와 등급의 출력하세요.
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
# outer join
1. EQUI JOIN의 조인 조건에서 양측 칼럼 값 중, 어느 하나라도 NULL 이면 
‘=‘ 비교 결과가 거짓이 되어 NULL 값을 가진 행은 조인 결과로 출력 불가
NULL 에 대해서 어떠한 연산을 적용하더라도 연산 결과는 NULL
	일반적인 EQUI JOIN 의 예 : 
	학생 테이블의 학과번호 칼럼과 부서 테이블의 부서번호 칼럼에 대한 
	EQUI JOIN ( student.deptno = department.deptno ) 한 경우
	학생 테이블의 deptno 칼럼이 NULL 인 경우 해당 학생은 결과로 
	출력되지 못함
2. EQUI JOIN에서 양측 칼럼 값중의 하나가 NULL 이지만 조인 결과로 
	출력할 필요가 있는 경우 OUTER JOIN 사용
	OUTER JOIN의 예 : 
	학생 테이블과 교수 테이블을 EQUI JOIN하여 학생의 지도 교수 이름 출력
	조건 : 지도 학생을 한 명도 배정받지 못한 교수 이름도 반드시 함께 출력
3. (+) 기호를 사용한 OUTER JOIN
WHERE 절의 조인 조건에서 OUTER JOIN 연산자인 ‘(+)’ 기호 사용
조인 조건문에서 **NULL 이 출력되는 테이블의 칼럼에 (+) 기호 추가
4. 기본구문
SELECT		table.column, table2.column
FROM		table1, table2
WHERE		table1.column(+) = table2.column
      또는 ;	table1.column = table2.column(+)
 * */
SELECT DISTINCT deptno
FROM emp;
SELECT *
FROM dept;
SELECT e.ename, e.deptno, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;
SELECT * FROM emp;
-- 이와 같이 dept에는 있으나 emp에 할당되지 않아 보이지 않는 데이터
-- 도 join 현황에서 확인하고자 할 때, outer join을 활용한다.
-- ex1) 사원테이블과 부서테이블을 아웃조인 하여, 
--     아래와 같이 출력하세요..
--     사원명  부서명  : 사원명이 할당되는 않았을 때, nvl을 이용해 
--                    할당된 사원없음이라고 표시하세요.. 2조
-- ex2) 부서별 인원수를 표시하되 부서에 할당된 인원이 없으면 0으로 표기
--     부서명  인원수
		
SELECT nvl(ename,'사원없음'), dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;
-- count(e.deptno) : 
-- 	e.deptno가 해당 컬럼에 null을 제외한 데이터를 count하여 처리한다.
--  그러므로, outer join에 의해서 할당이 되지 않는 데이터는 0으로 처리되어
--  그룹함수의 적용 결과를 볼 수 있다. 
SELECT dname, count(e.deptno)
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
GROUP BY dname;
SELECT * 
FROM emp;




