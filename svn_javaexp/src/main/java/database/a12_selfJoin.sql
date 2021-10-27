/*
# SELF JOIN
1. 개요
	하나의 테이블내에 있는 컬럼끼리 연결하는 조인이 필요한 경우에 사용된다.
	조인 대상 테이블이 자신 하나라는 것 외에는 EQUI JOIN과 동일하다.
2. WHERE절을 사용한 SELF JOIN
	하나의 테이블에서 두 개의 컬럼을 연결하여 EQUI JOIN
	FROM절에서 하나의 테이블에 테이블 변명지정
	EX) 부서테이블에서 where 절을 사용하여 self join을 처리.
3. 형식
	select a.*, b.*
	from 테이블1 a, 테이블1 b
	where a.컬럼1 = b.컬럼2	

empno : 모든 사원 고유 번호
mgr : 해당사원의 관리자의 사원번호
ex) 7369의 사원명은 SMITH이고 이 사원의 관리자번호는 7902
	7902의 사원번호의 이름은 FORD로 처리된다.
이와같이 테이블 안에서 컬럼간의 관계가 있을 때, SELF join이라고 한다.	
 * */

SELECT *
FROM emp;
-- 사원정보과 이 사원의 관리자 정보를 출력하자.
SELECT e.empno, e.ename, e.mgr, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;
-- 사원테이블의 mgr은 관리자의 사원번호인데 이것을 empno와
-- 연관관계를 가지고 내부 join을 통해서 확인할 수 있다.



SELECT '사원번호'||e.empno||' '||e.ename||'의 관리자번호'
	||e.mgr||'이고, 관리자의 이름은'|| m.ename ||'이다!!' msg
FROM emp e, emp m
WHERE e.mgr = m.empno; 
-- 테이블 내의 두개의 연관관계 컬럼을 join으로 지정한다.

-- ex) 연봉 @@@인 사원 @@@의 관리자 @@의 연봉은 @@@입니다.
--    self 조인을 통해서 출력하세요  
SELECT '연봉 '||E.SAL||'인 사원 '||E.ENAME||'의 관리자 '
||M.ENAME||'의 연봉은 '||M.SAL||'입니다.' AS SHOW
FROM EMP E, EMP M 
WHERE E.MGR=M.EMPNO;
/*
위 계층 관계의 테이블을 이해했으면, 아래와 같은 하나의 테이블 내에 계층 관계가 있는
데이터를 처리해보세요.
1. 테이블 만들기
family 테이블  
no(번호)  pos(역할) name(이름) parno(부모번호) 
1        할아버지   홍말순      0
2        아버지     홍판서      1
3        아들1      홍진희      2
4        아들2      홍길동      2       
sample 데이터를 3개 이상 입력해보세요.  
2. 데이터 입력               
3. sql이용해서  @@@의 부모의 이름은 @@@이다. 출력.4조
 * */
CREATE TABLE family(
	NO NUMBER,
	pos varchar2(50),
	name varchar2(50),
	parno number
);
INSERT INTO family values(1, '할아버지','홍말순',0);
-- 최상위 계층..
INSERT INTO family values(2, '아버지','홍판서',1);
-- NO와 parno의 연관관계를 설정하여 데이터를 입력한다.
INSERT INTO family values(3, '아들1','홍진희',2);
INSERT INTO family values(4, '아들2','홍길동',2);
-- @@@의 부모의 이름은 @@@이다
SELECT a.name||'의 부모의 이름은 '||b.name||'이다!' show 
FROM family a, family b
WHERE a.parno = b.no;

