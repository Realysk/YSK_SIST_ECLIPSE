--1. 테이블 subquery에서 테이블간 조인관계를 
--    급여가 2000이상인 사원테이블, 부서명이 SALES 이거나 RESEARCH 부서테이블 조인하여
--    사원명, 부서명, 급여를 출력하세요.
SELECT ename, sal
FROM emp
WHERE sal>=2000;
SELECT dname
FROM dept
WHERE dname IN ('SALES','RESEARCH');

SELECT ename, dname, sal
FROM ( SELECT ename, sal, deptno
		FROM emp
	  WHERE sal>=2000) e,
     ( SELECT dname, deptno
	   FROM dept
	  WHERE dname IN ('SALES','RESEARCH')
     ) d
WHERE e.deptno = d.deptno;
--2. 직책별 최고급여자의 부서번호, 부서명을 출력하세요.
--    job, sal, deptno, dname
SELECT job, max(sal) sal
FROM emp
GROUP BY job;
SELECT job, sal, deptno
FROM emp ;
SELECT * FROM dept;
SELECT a.job, a.sal, b.deptno, c.dname
FROM 
	( SELECT job, max(sal) sal
		FROM emp
		GROUP BY job ) a,
	( SELECT job, sal, deptno
		FROM emp ) b,
	dept c
WHERE a.job = b.job
 AND a.sal = b.sal
 AND b.deptno = c.deptno;



--3. DB 조작어의 종류와 트랜잭션 명령어의 기능에 대하여 기술하세요.
/*
	DML
	insert : 입력
	update : 수정
	delete : 삭제
	merge : 입력/수정을 함께 처리
	트랜잭션 명령어 : commit - 접속한 session단위로 DML처리를 확정하는 것을
		말하고 다른 접속 session에서 영향을 미친다. 데이터처리 안정성 확보.
		rollback - commit 전에는 rollback을 통하여 복구를 할 수 있다.
 * */

--4. 데이터 입력의 기본형식 중, 단일 행입력, 다중행 입력을 기본예제를 통해서 설명하세요.
/*
	단일행 입력
	insert into emp values(7999,'홍길동','사원',7800,sysdate, 3000,1000,30);
	insert into emp(ename, sal) values('마길동', 5000);
	다중행 입력(하나의 테이블)
	insert into emp01
	select * from emp;
	다중행 입력(여러 테이블)
	insert all||first
	into emp05(empno, ename) values(empno, ename)
	into emp06(empno, ename) values(empno, ename)
	select empno, ename
	from emp;
 * */
--5. 데이터 입력 중, 여러테이블의 한번에 subquery 입력을 기본예제를 통해서 설명하세요.
--	다중행 입력(여러 테이블)
--	insert all||first
--	into emp05(empno, ename) values(empno, ename)
--	into emp06(empno, ename) values(empno, ename)
--	select empno, ename
--	from emp;
--6. emp04 테이블에 사원번호, 사원명, 입사일(2020/01/01 오전 11:30), 급여를 입력하세요.
-- INSERT INTO emp04 VALUES(empno, ename, hiredate, sal)
--	VALUES (7800, '홍길동', to_date('2020/01/01 AM 11:30','YYYY/MM/DD AM HH:MM'), 3000 );
--7. 직급별 최고연봉과 최저연봉을 입력받을 수 있는 구조 테이블을 만들고, 해당 테이블에 emp 테이블의
--    정보를 subquery로 입력하세요.
CREATE TABLE emp001
AS SELECT job, max(sal) xsal, min(sal) nsal
FROM emp
GROUP BY job
HAVING 1=0;
SELECT * FROM emp001;
INSERT ALL
INTO emp001 values(job, xsal, nsal)
SELECT job, max(sal) xsal, min(sal) nsal
FROM emp
GROUP BY job;


--8. emp17, emp18, emp19 테이블을 emp테이블의 구조테이블로 만들고, 
--    부서별 최고급여자의 사원정보전체를 가져와서 해당테이블에 입력하되, 
--    emp17에는 부서번호 최고급여
--    emp18에는 부서번호+1 최고급여*10
--    emp19에는 부서번호+2 최고급여*20 을 처리하여 입력하세요.
CREATE TABLE emp17
AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp18
AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp19
AS SELECT * FROM emp WHERE 1=0;
-- 부서별 최고급여자의 사원정보전체
SELECT b.*
FROM (SELECT deptno, max(sal) sal FROM emp GROUP BY deptno) a,
	 emp b
WHERE a.deptno = b.deptno
AND a.sal = b.sal;
INSERT ALL
INTO emp17 values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
INTO emp18 values(empno, ename, job, mgr, hiredate, sal*10, comm, deptno+1)
INTO emp19 values(empno, ename, job, mgr, hiredate, sal*20, comm, deptno+2)
SELECT b.*
FROM (SELECT deptno, max(sal) sal FROM emp GROUP BY deptno) a,
	 emp b
WHERE a.deptno = b.deptno
AND a.sal = b.sal;
SELECT * FROM emp17;
SELECT * FROM emp18;
SELECT * FROM emp19;




