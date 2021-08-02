-- 맴버 테이블
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER
);
INSERT INTO MEMBER VALUES('himan', '7777', '홍길동', '관리자', 5000);
INSERT INTO MEMBER VALUES('goodman', '1111', '김길동', '사용자', 1000);
INSERT INTO MEMBER VALUES('badman', '1212', '마길동', '사용자', 2000);
SELECT * FROM MEMBER;
-- INSERT INTO MEMBER VALUES(?,?,?,?,?)

UPDATE MEMBER
	SET pass = '5555',
		name = '김천사',
		auth = '관리자',
		point = 9999
	WHERE id = 'goodman';
/*
UPDATE MEMBER
	SET pass = ?,
		name = ?,
		auth = ?,
		point = ?
	WHERE id = ?
DELETE FROM MEMBER WHERE ID = ? 
 */


CREATE TABLE Studentexp1(
	sno number,
	name varchar2(100),
	kor number,
	eng number,
	math number
);

INSERT INTO Studentexp1 VALUES (1001, '홍길동', 70, 80, 90);
INSERT INTO Studentexp1 VALUES (1002, '김길동', 60, 70, 100);
INSERT INTO Studentexp1 VALUES (1003, '신길동', 50, 60, 50);
INSERT INTO Studentexp1 VALUES (1004, '마길동', 40, 90, 70);
SELECT * FROM Studentexp1;
-- SELECT * FROM Studentexp1;
-- INSERT INTO Studentexp1 VALUES (?, ?, ?, ?, ?);

/*
 # DB 처리 화면 구성
 	1. DB 구조 만들기, 데이터 입력, SQL 작성
 	2. VO 만들기
 	3. DAO, 기능 메서드 구현
 	4. 화면에서 호출 출력
 */

-- 0726 정리 문제 7번 문제
DROP TABLE memberexp1;
CREATE TABLE memberexp1(
	mno_exp1 varchar2(6),
	id varchar2(50),
	pass varchar2(50),
	name varchar2(50),
	point varchar2(50),
	auth varchar2(50)
);
DROP SEQUENCE mno_exp1;
CREATE SEQUENCE mno_exp1
	START WITH 1001
	MINVALUE 1000
	MAXVALUE 99999999;
INSERT INTO memberexp1 VALUES('MN'||mno_exp1.nextval, 'hong', '1111', '홍길동', '10000', '관리자');
INSERT INTO memberexp1 VALUES('MN'||mno_exp1.nextval, 'kong', '2222', '김길동', '1000', '회원');
INSERT INTO memberexp1 VALUES('MN'||mno_exp1.nextval, 'nong', '3333', '노길동', '2000', '회원');
INSERT INTO memberexp1 VALUES('MN'||mno_exp1.nextval, 'yong', '4444', '유길동', '3000', '회원');
INSERT INTO memberexp1 VALUES('MN'||mno_exp1.nextval, 'song', '5555', '송길동', '4000', '회원');
SELECT * FROM memberexp1 ORDER BY mno_exp1 DESC;
-- SELECT * FROM memberexp1 ORDER BY mno_exp1 DESC








SELECT * 
FROM dept
WHERE dname LIKE '%'||'A'||'%'
AND loc LIKE '%'||'A'||'%'
;

/*
 SELECT * 
 FROM dept
 WHERE dname LIKE '%'||?||'%'
 AND loc LIKE '%'||?||'%'
 */

CREATE TABLE dept05
AS SELECT * FROM dept;
SELECT * FROM dept05;

SELECT * FROM dept02;