SELECT DISTINCT job FROM emp;
/*
 JOB      |
---------+
CLERK    |
SALESMAN |
PRESIDENT|
MANAGER  |
ANALYST  |
 */

SELECT DISTINCT e.mgr, m.ename
FROM emp m, emp e
WHERE e.mgr = m.empno;
/*
 MGR |ENAME|
----+-----+
7566|JONES|
7782|CLARK|
7839|KING |
7698|BLAKE|
7902|FORD |
 */

SELECT deptno, dname
FROM dept;
/*
DEPTNO|DNAME     |
------+----------+
    10|ACCOUNTING|
    20|RESEARCH  |
    30|SALES     |
    40|OPERATIONS| 
 */