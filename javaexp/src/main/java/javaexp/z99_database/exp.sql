SELECT *
FROM emp02;

SELECT *
FROM emp02
WHERE ename LIKE '%A%'
AND job LIKE '%A%';

-- A01_Dao ex1)
SELECT *
FROM dept;
----------

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

SELECT *
FROM emp; -- 숫자형 데이터 조회


-- 사원 번호로 검색
SELECT *
FROM emp
WHERE empno = 7369;
/*
 # 프로그래밍에서는 위 내용을 sql로 만들어서 처리
   매개변수로 넘겨오는 숫자변수
   public ArrayList<Emp> getEmpno(int empno) {
   String sql = "SELECT *
   				 FROM emp
   				 WHERE empno = " + empno};
 */

-- 문자열 데이터 조회
SELECT *
FROM emp
WHERE ename = 'ALLEN';
/*
   public ArrayList<Emp> getEmpno(String ename) {
   String sql = "SELECT *
   				 FROM emp
   				 WHERE ename = '" + ename + "' "};
 */

-- 키워드 검색
SELECT *
FROM emp
WHERE ename LIKE '%'||'A'||'%'
AND job LIKE '%'||'MAN'||'%';
/*
   public ArrayList<Emp> schEmp(String ename, String job) {
   String sql = "SELECT *
   				 FROM emp
   				 	WHERE WHERE ename LIKE '%'||'" + ename + "'||'%'
					AND job LIKE '%'||'" + job + "'||'%' "};
					
   public ArrayList<Emp> schEmp(Emp sch) {
   String sql = "SELECT *
   				 FROM emp
   				 	WHERE WHERE ename LIKE '%'||'" + sch.getEname() + "'||'%'
					AND job LIKE '%'||'" + sch.getJob() + "'||'%' "};
 */

SELECT *
FROM emp01
WHERE ename LIKE '%'||'A'||'%'
AND job LIKE '%'||'C'||'%';


-- ex) A04_DaoSch.java로 sql을 출력까지 작성하세요.
SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND ename LIKE '%'||'A'||'%'
AND dname LIKE '%'||'A'||'%';

SELECT *
FROM emp02
WHERE empno=7369;

-- ex) A02_DeptDao.java에 부서번호를 통해서 검색되게 기능 메서드를 구현하세요.
SELECT *
FROM dept
WHERE deptno = 10;

/*
 ex) A05_PreparedDao.java에서 기능 메서드 추가하여
 	 PreparedStatement를 활용하여 위 SQL을 처리하세요.
SELECT *
FROM emp01
WHERE ename LIKE '%'||?||'%'
AND job LIKE '%'||?||'%';
 */