SELECT *
FROM emp02;

SELECT *
FROM emp02
WHERE ename LIKE '%A%'
AND job LIKE '%A%';

-- ex1)
SELECT *
FROM dept;


SELECT deptno, empno, ename, job, sal
FROM emp02
WHERE ename='CLARK';