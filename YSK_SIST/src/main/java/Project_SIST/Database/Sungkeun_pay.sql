-- 상품 정보 테이블
DROP TABLE games_product;
CREATE TABLE games_product ( -- 상품정보
	pdnum varchar2(50) PRIMARY KEY, -- 상품 번호
	pdname varchar2(100) NOT NULL, -- 상품명
	pdimage varchar2(100) NOT NULL, -- 상품 이미지
	pdprice NUMBER NOT NULL, -- 가격
	discount NUMBER, -- 할인율
	platform varchar2(100) NOT NULL, -- 플랫폼
	RELEASE DATE NOT NULL, -- 출시일
	LANGUAGE char(1) NOT NULL, -- 언어
	pdmedia varchar2(100), -- 영상 URL
	isdlc char(1) NOT NULL, -- DLC 여부
	genre varchar2(100) NOT NULL, -- 장르
	company varchar2(100) NOT NULL, -- 개발사
	publisher varchar2(100) NOT NULL, -- 퍼블리셔
	ispad char(1) NOT NULL, -- 패드 지원여부
	pdstate varchar2(100) NOT NULL, -- 판매상태
	pdage varchar2(100) NOT NULL -- 심의
);
DROP SEQUENCE pdnum_seq;
CREATE SEQUENCE pdnum_seq
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
SELECT pdnum_seq.currval FROM dual;
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '아웃 오브 라인', 'outofline.png', 13500, 0.04, 'Steam', TO_DATE('2021-06-23','YYYY-MM-DD'), 'K', 'https://youtu.be/WhWxpTX8mtQ', 'N', '퍼즐', 'Nerd Monkeys', 'Hatinh Interactive', 'Y', '판매중', '전체 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '엘디스트 소울', 'eldestsoul.png', 20500, 0.2, 'Steam', TO_DATE('2021-07-29','YYYY-MM-DD'), 'K', 'https://youtu.be/cas2BMrShLA', 'Y', '액션', 'Fallen Flag Studio', 'United Label', 'Y', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '휴먼카인드 디지털 디럭스 에디션', 'humankind.png', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
SELECT * FROM games_product ORDER BY pdnum DESC;

-- 회원 테이블
DROP TABLE games_member;
CREATE TABLE games_member (
	mbnum varchar2(50) PRIMARY KEY, -- 회원 번호
	mbid varchar2(100) NOT NULL, -- ID
	mbpass varchar2(100) NOT NULL, -- PASS
	nickname varchar2(100) NOT NULL, -- 닉네임
	mail varchar2(100) NOT NULL, -- 이메일
	mail_agree char(1) NOT NULL, -- 이메일 수집 여부
	name varchar2(100) NOT NULL, -- 이름
	birth DATE NOT NULL, -- 생년월일
	auth varchar2(100) NOT NULL -- 회원권한
);
DROP SEQUENCE mbnum_seq;
CREATE SEQUENCE mbnum_seq
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
SELECT mbnum_seq.currval FROM dual;
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'hong1111', 'hkd0203', '홍서방', 'hong111@gmail.com', 'Y', '홍길동', TO_DATE('1990-01-23','YYYY-MM-DD'), '회원');
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'gogo1023', '1023gogo', '가즈아', 'gogo1023@naver.com', 'Y', '김철수', TO_DATE('1989-12-20','YYYY-MM-DD'), '회원');
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'hong1111', 'hkd0203', '홍서방', 'hong111@gmail.com', 'Y', '홍길동', TO_DATE('1990-01-23','YYYY-MM-DD'), '회원');
SELECT * FROM games_member ORDER BY mbnum DESC;

-- 위시리스트 테이블
DROP TABLE games_wishlist;
CREATE TABLE games_wishlist ( -- 위시리스트
	pdnum CONSTRAINTS games_wishlist_pdnum_fk REFERENCES games_product(pdnum), -- 상품 번호 (외래키)
	whdate DATE NOT NULL, -- 저장일
	mbnum CONSTRAINTS games_member_mbnum_fk REFERENCES games_member(mbnum) -- 회원 번호 (외래키)
);
INSERT INTO games_wishlist VALUES ('pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
INSERT INTO games_wishlist VALUES ('pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
INSERT INTO games_wishlist VALUES ('pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
SELECT * FROM games_wishlist;

-- 장바구니 테이블
DROP TABLE games_cart;
CREATE TABLE games_cart (
	ctnum varchar2(50) PRIMARY KEY, -- 장바구니 번호
	pdnum CONSTRAINTS games_cart_pdnum_fk REFERENCES games_product(pdnum), -- 상품 번호 (외래키)
	ctdate DATE NOT NULL, -- 저장일
	mbnum CONSTRAINTS games_member_mbnum_fk REFERENCES games_member(mbnum) -- 회원 번호 (외래키)
);
DROP SEQUENCE ctnum_seq;
CREATE SEQUENCE ctnum_seq
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
SELECT ctnum_seq.currval FROM dual;
INSERT INTO games_cart VALUES ('ct'||lpad(ctnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
INSERT INTO games_cart VALUES ('ct'||lpad(ctnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
INSERT INTO games_cart VALUES ('ct'||lpad(ctnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate, 'mb'||lpad(mbnum_seq.currval,4,0));
SELECT * FROM games_cart ORDER BY ctnum DESC;
