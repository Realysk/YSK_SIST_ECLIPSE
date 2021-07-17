/*
 # 테이블 구조 변경
 	1. 개요
 		테이블을 사용하다보면 여러가지 상황에 따라 테이블의 구조를 변경하는 경우가 발생한다.
 		테이블의 구조를 변경하는데 필요한 명령어를 파악하고 테이블 구조의 변경 시 발생하는 데이터 처리에 대한 내용을 파악해보자.
 		1) 유형
 			컬럼 추가, 삭제, 속성의 변경, 제약 조건의 변경 등등
 	2. 컬럼 추가
 		alter table 테이블명
 		add 컬럼명 데이터유형 [default 디폴트데이터, 제약 조건]
		
*/
DROP TABLE emp27;
CREATE TABLE emp27
AS SELECT empno, ename, job, sal FROM emp;
SELECT * FROM emp27;
ALTER TABLE emp27
ADD address varchar2(20) DEFAULT '주소입력없음';
SELECT * FROM emp27;

-- ex) emp28 테이블로 부서명, 사원명, 직책, 급여로 복사테이블을 만들어 해당 테이블에 bonus 컬럼을 추가 하고 default 데이터로 0을 입력하세요.
CREATE TABLE emp28
AS SELECT dname, ename, job, sal
	FROM emp e, dept d
WHERE e.deptno=d.deptno;
SELECT * FROM emp28;
ALTER TABLE emp28
ADD bonus NUMBER DEFAULT 0;
SELECT * FROM emp28;
-- # default는 테이블 생성시에도 컬럼명 데이터 유형 default 기본데이터로 설정이 가능하다.

/*
 	3. 컬럼 삭제
 		alter table 테이블명 drop column 컬럼명;
 */
SELECT * FROM emp28;
ALTER TABLE emp28
DROP COLUMN job;

-- ex) 부서별 최고급여자의 테이블을 emp29로 만들고 deptno 컬럼을 삭제하세요.
SELECT deptno, max(sal)
FROM emp e
GROUP BY deptno;
CREATE TABLE emp29
AS SELECT * FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp e
	GROUP BY deptno);
SELECT * FROM emp29;
ALTER TABLE emp29
DROP COLUMN deptno;
SELECT * FROM emp29;