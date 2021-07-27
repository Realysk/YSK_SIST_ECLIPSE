/*
 # DB 처리 화면 구성
 	1. DB 구조 만들기, 데이터 입력, SQL 작성
 	2. VO 만들기
 	3. DAO, 기능 메서드 구현
 	4. 화면에서 호출 출력
 */

-- 맴버 테이블
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	mno number PRIMARY KEY,
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER,
	regdte date
);
INSERT INTO MEMBER VALUES(1001, 'himan', '7777', '홍길동', '관리자', 5000, sysdate);
INSERT INTO MEMBER VALUES(1002, 'goodman', '1111', '김길동', '사용자', 1000, sysdate);
INSERT INTO MEMBER VALUES(1003, 'badman', '1212', '마길동', '사용자', 2000, sysdate);
SELECT * FROM MEMBER ORDER BY mno DESC;

-- 회원가입을 위한 테이블 생성
DROP TABLE pic_member;
CREATE TABLE pic_member (
	memno varchar2(6) PRIMARY KEY, -- 회원 번호
	memid varchar2(100), -- ID
	mempw varchar2(100), -- PW
	memtel varchar2(100), -- 휴대폰 번호
	mememail varchar2(100), -- 이메일
	memauth varchar2(100) -- 사용 권한
);
DROP SEQUENCE memno;
CREATE SEQUENCE memno
	START WITH 1001
	MINVALUE 1000
	MAXVALUE 99999999;
INSERT INTO pic_member VALUES('mb'||memno.nextval, 'hong798', 'hkd1589', '010-1111-1111', 'hong111@gmail.com', '회원');
INSERT INTO pic_member VALUES('mb'||memno.nextval, 'Kkd294', 'abcd5049', '010-2452-1393', 'Kkd222@naver.com', '회원');
INSERT INTO pic_member VALUES('mb'||memno.nextval, 'gogo586', 'bngk954', '010-0508-9496', 'gogo333@gmail.com', '회원');
SELECT * FROM pic_member ORDER BY memno DESC;
-- SELECT * FROM pic_member ORDER BY memno DESC -- 회원 정보 조회
-- INSERT INTO pic_member VALUES('mb' || memno.nextval, ?, ?, ?, ?, ?) -- 회원 가입
-- SELECT memno, memid, mempw FROM pic_member WHERE memno = ? -- 로그인
-- SELECT * FROM pic_member WHERE memid LIKE '%'||?||'%' ORDER BY memno DESC -- ID 검색
-- SELECT * FROM pic_member WHERE mempw LIKE '%'||?||'%' ORDER BY memno DESC -- PW 검색







-- 작가 작품 업로드를 위한 테이블 생성
DROP TABLE artworks;
CREATE TABLE artworks (
	artno varchar2(6) PRIMARY KEY, -- 작품 번호
	artcategory varchar2(100), -- 카테고리
	artimgtitle varchar2(100), -- 작품 이미지
	arttitle varchar2(100), -- 작품 제목
	artcontent varchar2(100), -- 작품 소개
	artdate date, -- 업로드 시간
	artpicauth varchar2(100) -- 저작권 권한
);
DROP SEQUENCE artno;
CREATE SEQUENCE artno
	START WITH 2001 
	MINVALUE 2001
	MAXVALUE 99999999;
INSERT INTO artworks VALUES('wk'||artno.nextval, '배경화면', 'spring.jpg', '봄입니다!', '화사한 봄이에요~', TO_DATE('2021-07-24 06:12:36','YYYY-MM-DD HH:MI:SS'), '작가');
INSERT INTO artworks VALUES('wk'||artno.nextval, '추상', 'summer.jpg', '여름입니다!', '무더운 여름입니다!', TO_DATE('2021-07-25 07:12:36','YYYY-MM-DD HH:MI:SS'), '작가');
INSERT INTO artworks VALUES('wk'||artno.nextval, '사계', 'winter.jpg', '겨울을 그려봤어요~', '한번 구경하고 가세요!', sysdate, '작가');
SELECT * FROM artworks ORDER BY artno DESC;
-- SELECT * FROM artworks ORDER BY artno DESC -- 게시물 조회
-- INSERT INTO artworks VALUES('wk'||artno.nextval, ?, ?, ?, ?, sysdate, ?) -- 게시물 업로드


-- 작가 작품 업로드 전 시리즈를 위한 테이블 생성
DROP TABLE series;
CREATE TABLE series (
	serno varchar2(6) PRIMARY KEY, -- 시리즈 번호
	sercategory varchar2(100), -- 시리즈 카테고리
	sertitle varchar2(100), -- 시리즈 제목
	sercontent varchar2(100) -- 시리즈 내용
);
DROP SEQUENCE serno;
CREATE SEQUENCE serno
	START WITH 6001
	MINVALUE 6001
	MAXVALUE 99999999;
INSERT INTO series VALUES('se'||serno.nextval, '가상', '가상의 배경', '첫 시리즈입니다.');
INSERT INTO series VALUES('se'||serno.nextval, '배경', '멋진 배경', '첫번째 컬렉션');
INSERT INTO series VALUES('se'||serno.nextval, '일러스트', '직접 그린 여름', '시리즈에 담아둡니다~');
SELECT * FROM series ORDER BY serno DESC;
-- SELECT * FROM series ORDER BY serno DESC -- 시리즈 정보 조회
-- INSERT INTO series VALUES(?, ?, ?, ?) -- 시리즈 등록







-- 태그 등록을 위한 테이블
DROP TABLE tag;
CREATE TABLE tag(
	tagno varchar2(6) PRIMARY KEY, -- 태그 번호
	tagname varchar2(100) -- 태그명
);
DROP SEQUENCE tagno;
CREATE SEQUENCE tagno
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
INSERT INTO tag VALUES('tg'||tagno.nextval, '#제주도');
INSERT INTO tag VALUES('tg'||tagno.nextval, '#사계절');
INSERT INTO tag VALUES('tg'||tagno.nextval, '#비행기');
SELECT * FROM tag ORDER BY tagno DESC;

/*
-- 업로드와 태그 테이블 join
SELECT a.*, g.*
FROM artworks a, tag g
WHERE a.tagno = g.tagno
ORDER BY tagno DESC;

-- 업로드와 시리즈 테이블 join
SELECT a.*, s.*
FROM artworks a, series s
WHERE a.serno = s.serno
ORDER BY artno DESC;
*/

/*
 SELECT a.*, s.*
FROM artworks a, series s
WHERE a.serno = s.serno
ORDER BY artno DESC
 */