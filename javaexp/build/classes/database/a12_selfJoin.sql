/*
 # SELF JOIN
 	1. 개요
 		하나의 테이블 내에 있는 컬럼끼리 연결하는 조인이 필요한 경우에 사용된다.
 		조인 대상 테이블이 자신 하나라는 것 외에는 EQUI JOIN과 동일하다.
 	2. WHERE 절을 사용한 SELF JOIN
 		하나의 테이블에서 두 개의 컬럼을 연결하여 EQUI JOIN
 		FROM절에서 하나의 테이블에 테이블 변명 지정
 		ex) 부서테이블에서 where절을 사용하여 self join을 처리.
 	3. 기본 형식
 		SELECT a.*, b.*
 		FROM 테이블1 a, 테이블1 b
 		WHERE a.컬럼1 = b.컬럼2
 */

/*
 empno : 모든 사원 고유 번호
 mgr : 해당 사원의 관리자의 사원 번호
 ex) 7369의 사원명은 SMITH이고 이 사원의 관리자번호는 7902
 	 7902의 사원번호의 이름은 FORD로 처리된다.
 이와 같이 테이블 안에서 컬럼 간의 관계가 있을 때, SELF join이라고 한다.
 */

SELECT *
FROM emp;
-- 사원정보과 이 사원의 관리자 정보 출력.
SELECT e.empno, e.ename, e.mgr, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

SELECT '사원번호가 '|| e.empno ||'인 '|| e.ename ||' 의 관리자번호는 '|| e.mgr ||' 이고, 관리자의 이름은 '|| m.ename || ' 이다.' msg 
FROM emp e, emp m
WHERE e.mgr = m.empno; -- 테이블 내의 두 개의 연관 관계 컬럼을 join으로 지정한다.

-- ex) 연봉이 @@@인 사원 @@@의 관리자 @@의 연봉은 @@@입니다. (self join 활용)
SELECT '연봉이 ' || e.sal ||' 인 사원 ' || e.ename || ' 의 관리자 ' || e.mgr || ' 의 연봉은 ' || m.sal || '입니다.' msg
FROM emp e, emp m
WHERE e.mgr = m.empno;

/*
 ex) 위 계층 관계의 테이블을 이해 했으면 아래와 같은 하나의 테이블 내의 계층 관계가 있는 데이터를 처리해보세요.
 	
 	1. famliy 테이블 만들기
 	NO(번호) POS(역할) NAME(이름) PARNO(부모번호)
 	1		할아버지	 홍말순	   0
 	2		아버지	 홍판서	   1
 	3		큰아들	 홍진희	   2
 	4		작은아들	 홍길동	   3
 	sample 데이터를 3개 이상 입력해보세요.
 	
 	*/
		CREATE TABLE famliy (
			NO number,
			pos varchar2(50),
			name varchar2(50),
			parno number
		);
	/*
 	
 	2. 데이터 입력
 	
 	*/
		INSERT INTO famliy VALUES (1, '할아버지', '홍말순', 0);
		-- 최상위 계층
		INSERT INTO famliy VALUES (2, '아버지', '홍판서', 1);
		-- NO와 parno의 연관관계를 설정하여 데이터를 입력한다.
		INSERT INTO famliy VALUES (3, '큰 아들', '홍진희', 2);
		INSERT INTO famliy VALUES (4, '작은 아들', '홍길동', 2);
		SELECT NO "번호", pos "역할", name "이름", parno "부모번호"
		FROM famliy;
	/*
	
 	3. SQL 이용해서 @@@의 부모의 이름은 @@@입니다. 출력
 	
 	*/
		SELECT a.name || '의 부모의 이름은 ' || b.name || '입니다.' show
		FROM famliy a, famliy b
		WHERE a.parno = b.NO;
	/*
 */


