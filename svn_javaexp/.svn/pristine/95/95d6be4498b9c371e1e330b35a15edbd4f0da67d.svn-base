/*
# check
1. 특정한 데이터를 조건이나 범위를 지정해서, 해당 범위에 데이터만 입력되도록 처리하는 것을 말한다.
2. 형식
	 컬럼명 데이터유형 constraint 제약명 check (조건문-where에 들어가는 sql문장)
	 컬럼명 데이터유형 check (조건문-where에 들어가는 sql문장)
 * */
CREATE TABLE student05(
	gender varchar2(1) check( gender IN ('F','M') )
);
INSERT INTO student05 values('F');
INSERT INTO student05 values('M');
INSERT INTO student05 values('K');
-- org.jkiss.dbeaver.model.sql.DBSQLException: SQL Error [2290] [23000]: ORA-02290:
--  check constraint (SCOTT.SYS_C008277) violated
INSERT INTO student05 values(null);
INSERT INTO student05 values('M');
SELECT * FROM student05;
-- ex) student07 테이블만들고,  이름, 학년(1~4년 제약조건), 국어(1~100 제약조건설정) 
--  6조
CREATE TABLE student07(
   name varchar2(30),
   grade NUMBER(1) CONSTRAINT student07_grade_ck check(grade BETWEEN 1 AND 4),
   kor NUMBER(3) check(kor BETWEEN 1 AND 100)
);
INSERT INTO STUDENT07 values('홍길동',1,90);
INSERT INTO STUDENT07 values('신길동',2,90);
INSERT INTO STUDENT07 values('홍길동',5,90);
-- 데이터유형은 ''(문자열입력시), 25(숫자입력시)
-- org.jkiss.dbeaver.model.sql.DBSQLException: SQL Error [2290] [23000]: ORA-02290:
-- check constraint (SCOTT.SYS_C007086) violated
INSERT INTO STUDENT07 values('홍길동',1,150);
-- org.jkiss.dbeaver.model.sql.DBSQLException: SQL Error [2290] [23000]: ORA-02290:
-- check constraint (SCOTT.SYS_C007087) violated
INSERT INTO STUDENT07 values('홍길동',3,null);
INSERT INTO STUDENT07 values('김길동',1,90);
SELECT * FROM student07;
/*
# 외래키 설정 관계(foreign key)
1. 연관관계에 있는 두 테이블에 대하여, 한쪽 테이블에 있는 데이터 기준으로 다른쪽 테이블의
데이터를 입력할 수 있게 하는 것을 말한다.
2. 기본 형식
	컬럼명 데이터유형 constraint 테이블명_컬럼명_fk references 테이블명(컬럼명)
 * */
-- 교수테이블 생성..
CREATE TABLE teacher01(
	tno NUMBER PRIMARY key
);
INSERT INTO teacher01 values(10);
INSERT INTO teacher01 values(11);
INSERT INTO teacher01 values(12);
SELECT * FROM teacher01;
CREATE TABLE STUDENT08(
	name varchar2(50),
	tno NUMBER constraint STUDENT08_tno_fk REFERENCES teacher01(tno)
);
INSERT INTO STUDENT08 values('홍길동',10);
INSERT INTO STUDENT08 values('신길동',11);
INSERT INTO STUDENT08 values('마길동',13);
-- integrity constraint (SCOTT.STUDENT08_TNO_FK) violated - parent key not found
INSERT INTO STUDENT08 values('오길동',12);
-- ex) 물건테이블(물건번호, 물건명, 가격, 재고량)
--     구매테이블(구매번호, 구매수량, 물건번호-외래키설정) 1조
CREATE TABLE product001(
   pno NUMBER PRIMARY KEY,
   pname varchar2(20),
   price NUMBER,
   rcnt NUMBER -- 재고량과 구매수량을 컬럼명을 구분해서 설정을 할 수 있도록 한다.
);
INSERT INTO product001 values(1,'사과',2000,3);
INSERT INTO product001 values(2,'수박',8000,2);
INSERT INTO product001 values(3,'바나나',3000,7);
CREATE TABLE pbuy(
   bno NUMBER,
   bcnt NUMBER,
   pno NUMBER CONSTRAINT pbuy_pno_fk REFERENCES product001(pno)
);
INSERT INTO pbuy VALUES(10,2,1);
INSERT INTO pbuy VALUES(20,4,2);
INSERT INTO pbuy VALUES(30,1,4); -- 에러발생.
-- 구매한 물건정보
SELECT pname, price "판매가격", bcnt "구매갯수", price*bcnt "총계", rcnt-bcnt "현재고량"
FROM product001 p, pbuy b
WHERE p.pno = b.pno;









