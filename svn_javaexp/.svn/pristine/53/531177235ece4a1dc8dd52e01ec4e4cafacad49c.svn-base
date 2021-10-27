--1. 테이블 컬럼의 테이블 타입을 변경할 시, 제약사항을 기술하세요.
/*
1. 데이터 유무가 가장 큰 제약사항이다.
	1) 데이터가 없는 구조만 되어 있는 경우는 제약이 거의 없다.
	2) 데이터가 있는 경우
		같은 유형의 크기 변경은 작은 데이터에서 큰 데이터로 변경이 가능하다.
		같은 유형의 크기 변경은 큰 데이터에서 작은 데이터로 변경은 실제 데이터 저장 
			크기 안에서 가능하다.
			ex) 크기 설정을 varchar2(50)을 설정하였으나, 실제 데이터는
				max(length(컬럼명))으로 확인하여 해당 크기 안에서 변경은
				가능하다.
 * */
--2. emp의 구조만 있는 emp12 테이블을 생성하고, 숫자형 컬럼을 문자형으로 변경하세요.
   DROP TABLE emp12;
   CREATE TABLE emp12 
   AS SELECT * FROM emp WHERE 1=0;
   ALTER TABLE emp12 
   MODIFY sal varchar2(20);
   ALTER TABLE emp12 
   MODIFY mgr varchar2(20); 
   ALTER TABLE emp12 
   MODIFY comm varchar2(20); 
   ALTER TABLE emp12 
   MODIFY empno varchar2(20); 
   ALTER TABLE emp12 
   MODIFY deptno varchar2(20);   

--3. 테이블명과 컬럼명을 변경시키는 코드를 기술하세요.
   RENAME emp12 TO emp12_copy;
   ALTER TABLE emp12_copy
   RENAME COLUMN sal TO salary;
--4. 인덱스의 기본형식과 유형을 기술하세요.
/*	create index 인덱스명 on 테이블명(컬럼명);
 * 1) 일반 인덱스(단일 인덱스 포함)
 * 2) 고유 인덱스 unique
 * 3) 결합 인덱스 on 테이블명(컬럼명1, 컬럼명2....)
 * 4) 결합 정렬 인덱스 on 테이블(컬럼명1 desc, 컬럼명2 asc...)
 * */  
  
  
--5. emp38테이블에 index로 deptno(내림차순)와 empno(오름차순)로 중복 처리되게 하세요.
DROP TABLE emp38;
CREATE TABLE emp38
AS SELECT * FROM emp;

CREATE INDEX idx_emp38_deptno_empno
ON emp38(deptno desc, empno asc);  
--6. user01/8888계정을 생성하고, 접속하여 테이블을 생성하세요.
--	1) 계정생성: create user 계정명 identified by 비밀번호;
	create user user01 identified by 8888;
--	2) session 권한 부여 : grant create session to 계정명;
	grant create session to user01;
--  3) 자원에 대한 사용 권한 부여 : grant resource to 계정명;
	grant resource to user01;
--#	4) 계정의 테이블 스페이스 지정 : alter user 계정 default tablespace 테이블스페이스명;
	alter user user01 default tablespace users;
--# 5) 계정의 테이블 스페이스 용량 지정
--		alter user 계정명 quota unlimited on 테이블스페이스명
	alter user user01 quota unlimited on users;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE 
	TO himan2 IDENTIFIED BY 9999;

--7. 부서정보가 함께 있는 부서명별 최고 급여자 사원 정보가 있는 emp13테이블을 만들고,
--    mgr은 관리자명(내부조인을 통해서 가져와서 입력)으로 데이터유형과 데이터를 변경 처리하세요.
--	1) 부서정보가 함께 있는 부서명별 최고 급여자 사원 정보가 있는 emp13테이블을 만들고
--	2) 내부조인에 의해서 사원번호와 관리자명이 있는 테이블생성(mgrtab)..
--	3) emp13 테이블의 mgr update로 null 처리.
--	4) emp13 테이블의 mgr varchar2(20)로 변경.
--	5) emp13 테이블의 mgr에 mgrtab의 empno를 기준으로 update 처리.
DROP TABLE emp13;
SELECT dname, max(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY dname;
CREATE TABLE emp13
AS SELECT e.*,dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND (dname, sal) IN (
	SELECT dname, max(sal)
	FROM emp e, dept d
	WHERE e.deptno = d.deptno
	GROUP BY dname
);
SELECT * FROM emp13;
-- 사원명과 관리자명 가져오기.
CREATE TABLE mgrtab
AS SELECT e.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;
SELECT * FROM mgrtab;
--	3) emp13 테이블의 mgr update로 null 처리.
UPDATE emp13 
	SET mgr = NULL;
SELECT * FROM emp13;
--	4) emp13 테이블의 mgr varchar2(20)로 변경.
alter TABLE emp13
MODIFY mgr varchar2(20);
--  5) emp13 테이블의 mgr에 mgrtab의 empno를 기준으로 update 처리.
UPDATE emp13 a
SET mgr = (
	SELECT ename
	FROM mgrtab b
	WHERE a.empno = b.empno 
);
SELECT * FROM emp13;




