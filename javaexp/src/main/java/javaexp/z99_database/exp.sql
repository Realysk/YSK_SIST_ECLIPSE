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

SELECT * FROM emp; -- 여러 행을 사용하는 데이터 ArrayList<VO>
SELECT sum(sal), avg(sal), count(*)
FROM emp; -- 단일 행의 결과 값을 받은 데이터 VO

SELECT count(*) -- 단일 행의 단일 변수 (숫자)
FROM emp;

SELECT ename -- 단일 행의 단일 변수 (문자)
FROM emp
WHERE sal = (SELECT max(sal) FROM emp);

SELECT * -- rs.next()로 boolean을 return할 수 있다.
FROM emp
WHERE empno = 7780; -- key를 입력하여 있는지 여부만 확인할 때