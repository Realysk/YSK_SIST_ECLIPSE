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

DELETE FROM emp02 WHERE empno IS NULL;
SELECT * FROM emp02 ORDER BY empno DESC;
INSERT INTO emp02 VALUES(emp_seq_01.nextval,'홍길동' ,'사원' ,7902 ,sysdate ,3500 ,1000 ,10);

/*
 INSERT INTO emp02 VALUES(emp_seq_01.nextval,?,?,?,sysdate,?,?,?)
 */

CREATE SEQUENCE emp_seq_01
START WITH 7935
INCREMENT BY 1
MAXVALUE 9999
MINVALUE 1000
CYCLE;

CREATE TABLE dept02
AS SELECT * FROM dept;
INSERT INTO dept02 VALUES(11,'회계','서울');
SELECT * FROM dept02;
-- INSERT INTO dept02 VALUES(?,?,?);

/*
 1) 회원 테이블 만들기, 데이터 입력 member (회원번호, 아이디, 패스워드, 회원명, 권한, 포인트, 등록일)
 2) SQL 작성 및 확인 insert into member values(...);
 */
CREATE TABLE member02(
	mno number PRIMARY KEY,
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER,
	regdte date
);

CREATE SEQUENCE member_seq
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 9999;
SELECT member_seq.nextval FROM dual;
INSERT INTO member02 VALUES (member_seq.nextval, 'himan','7777','홍길동','admin',1000,sysdate);
INSERT INTO member02 VALUES (member_seq.nextval, 'higirl','9999','김리나','admin',2000,sysdate);
SELECT * FROM MEMBER02;
UPDATE member02
	SET id = 'goodgirl',
		pass = '8888',
		name = '이미나',
		auth = 'normal',
		point = 2000,
		regdte = to_date('2021/07/01','YYYY/MM/DD')
WHERE mno = 1003;

UPDATE member02
	SET id = ?,
		pass = ?,
		name = ?,
		auth = ?,
		point = ?,
		regdte = to_date(?,'YYYY/MM/DD')
WHERE mno = ?

-- SELECT * FROM member02 WHERE id = ? AND pass = ?;

/*
 # 수정 처리
 	1. 수정 구문 emp02
 */
SELECT * FROM emp02 ORDER BY empno DESC;
UPDATE emp02
	SET ename = ename ||'(승진)',
		job = '차장',
		mgr = 7780,
		hiredate = to_date('2021/01/01','YYYY/MM/DD'),
		sal = sal + 1000,
		comm = comm + 300,
		deptno = 20
WHERE empno = 7936;

UPDATE emp02
	SET ename = ?
		job = ?,
		mgr = ?,
		hiredate = to_date(?,'YYYY/MM/DD'),
		sal = ?,
		comm = comm + ?,
		deptno = ?
WHERE empno = ?
	
-- ex) Member02 테이블을 mno 기준으로 수정하세요.

-- ex) Product 테이블 생성
CREATE TABLE Product02 (
	pno char(7),
	name varchar2(50),
	price number,
	cnt number
);
CREATE SEQUENCE prod_seq
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 9999;
INSERT INTO product02 VALUES('PRO'||prod_seq.nextval, '사과',2000,300);
INSERT INTO product02 VALUES('PRO'||prod_seq.nextval, '바나나',4500,500);
INSERT INTO product02 VALUES('PRO'||prod_seq.nextval, '딸기',12000,200);
INSERT INTO product02 VALUES('PRO'||prod_seq.nextval, '수박',15000,500);
-- INSERT INTO product02 VALUES('PRO'||prod_seq.nextval,?,?,?);
SELECT *
FROM product02
WHERE name LIKE '%'||''||'%'
AND price BETWEEN 0 AND 999999;
/*
SELECT *
FROM product02
AND price BETWEEN ? AND ?;
UPDATE product02
	SET name = ?,
		price = ?,
		cnt = ?
	WHERE pno = ?;
*/
UPDATE product02
	SET name = '딸기(특)',
		price = 15000,
		cnt = cnt+100
	WHERE pno = 'PRO1002';