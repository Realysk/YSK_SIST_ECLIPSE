/*
 # check
 	1. 특정한 데이터를 조건이나 범위를 지정해서 해당 범위에 데이터만 입력되도록 처리하는 것을 말한다.
 	2. 형식
 		컬럼명 데이터유형 constraint 제약명 check (조건문-where에 들어가는 SQL 문장)
 		컬럼명 데이터유형 check (조건문-where에 들어가는 SQL 문장)
 */

CREATE TABLE student05(
	gender varchar2(1) CHECK(gender IN ('F','M')));
INSERT INTO student05 VALUES('F');
INSERT INTO student05 VALUES('M');
INSERT INTO student05 VALUES('K');
-- org.jkiss.dbeaver.model.sql.DBSQLException:
-- SQL Error [2290] [23000]: ORA-02290: check constraint (SCOTT.SYS_C007107) violated
INSERT INTO student05 VALUES(NULL);
INSERT INTO student05 VALUES('M');
SELECT * FROM student05;

-- ex) student06 테이블을 만들고 이름, 학년(1~4학년 제약조건), 국어(1~100 제약조건)
CREATE TABLE student06(
	name varchar(30),
	class NUMBER(3) CONSTRAINT student06_class_ck CHECK(class BETWEEN 1 AND 4),
	kor NUMBER(3) CHECK(kor BETWEEN 1 AND 100));
INSERT INTO student06 VALUES('가길동', 1, 90);
INSERT INTO student06 VALUES('나길동', 2, 90);
INSERT INTO student06 VALUES('다길동', 5, 90);
-- org.jkiss.dbeaver.model.sql.DBSQLException:
-- SQL Error [2290] [23000]: ORA-02290: check constraint (SCOTT.STUDENT06_CLASS_CK) violated
INSERT INTO student06 VALUES('라길동', 1, 150);
-- org.jkiss.dbeaver.model.sql.DBSQLException:
-- SQL Error [2290] [23000]: ORA-02290: check constraint (SCOTT.SYS_C007111) violated
INSERT INTO student06 VALUES('라길동', 3, NULL);
INSERT INTO student06 VALUES('마길동', 1, 90);
SELECT * FROM student06;