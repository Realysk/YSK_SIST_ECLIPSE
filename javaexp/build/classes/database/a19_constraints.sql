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

/*
 # 외래 키 설정 관계 (foreign key)
 	1. 연관 관계에 있는 두 테이블에 대하여 한쪽 테이블에 있는 데이터 기준으로 다른 쪽 테이블의 데이터를 입력할 수 있게 하는 것을 말한다.
 	2. 기본 형식
 		컬럼명 데이터유형 constraint 테이블명_컬럼명_fk references 테이블명(컬럼명)
 */

-- 교수 테이블 생성
CREATE TABLE teacher01(
	tno NUMBER PRIMARY KEY);
INSERT INTO teacher01 VALUES(10);
INSERT INTO teacher01 VALUES(11);
INSERT INTO teacher01 VALUES(12);
SELECT * FROM teacher01;

CREATE TABLE student07(
	name varchar2(50),
	tno NUMBER CONSTRAINT student07_tno_fk REFERENCES teacher01(tno));
INSERT INTO student07 VALUES('홍길동',10);
INSERT INTO student07 VALUES('신길동',11);
INSERT INTO student07 VALUES('마길동',13);
-- org.jkiss.dbeaver.model.sql.DBSQLException:
-- SQL Error [2291] [23000]: ORA-02291: integrity constraint (SCOTT.STUDENT07_TNO_FK) violated - parent key not found
INSERT INTO student07 VALUES('오길동',12);
SELECT * FROM student07;

-- 조별과제에서 활용 가능한 예제
-- ex) 물건테이블(물건번호, 물건명, 가격, 재고량)
--	   구매테이블(구매번호, 구매수량, 물건번호-외래키 설정)

CREATE TABLE product(
	prodNum NUMBER(10) PRIMARY KEY,
	prodName varchar2(50),
	price NUMBER(30),
	prodCnt NUMBER(30)); -- 재고량과 구매수량을 컬럼명을 구분해서 설정할 수 있도록 한다.
INSERT INTO product VALUES(1, '사과', 2000, 3);
INSERT INTO product VALUES(2, '수박', 8000, 2);
INSERT INTO product VALUES(3, '바나나', 3000, 7);
SELECT * FROM product;

CREATE TABLE prodBuy(
	buyNum NUMBER(10),
	buyCnt NUMBER(10),
	prodNum NUMBER(10) CONSTRAINT prodBuy_prodNum_fk REFERENCES product(prodNum));
INSERT INTO prodBuy VALUES(10, 2, 1);
INSERT INTO prodBuy VALUES(20, 4, 2);
INSERT INTO prodBuy VALUES(30, 1, 4); -- 에러 발생
-- org.jkiss.dbeaver.model.sql.DBSQLException:
-- SQL Error [2291] [23000]: ORA-02291: integrity constraint (SCOTT.PRODBUY_PRODNUM_FK) violated - parent key not found
SELECT * FROM prodBuy;

-- 구매한 물건 정보
SELECT prodName "물건명", price "판매 가격", buyCnt "구매 수량", price*buyCnt "총계", prodCnt-buyCnt "현 재고량"
FROM product p, prodBuy b
WHERE p.prodNum = b.prodNum;