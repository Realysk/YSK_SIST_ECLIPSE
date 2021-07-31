-- [상품정보] 테이블

DROP TABLE prodinfo;
CREATE TABLE prodinfo ( -- 상품정보
	prodkey varchar2(8) PRIMARY KEY, -- 상품 코드
	platform varchar2(100) NOT NULL, -- 플랫폼
	pname varchar2(100) NOT NULL, -- 상품명
	cnt NUMBER NOT NULL, -- 수량
	price NUMBER NOT NULL, -- 가격
	onsale varchar2(100) NOT NULL, -- 판매상황
	regdate DATE NOT NULL -- 등록일
);
DROP SEQUENCE prodkey;
CREATE SEQUENCE prodkey
	START WITH 999
	MINVALUE 999
	MAXVALUE 9999999999999;
SELECT prodkey.nextval FROM dual;
SELECT prodkey.currval FROM dual;
INSERT INTO prodinfo VALUES ('PD'||prodkey.nextval, 'Steam', 'BATTLEGROUND', 1, 32000, '판매중', sysdate);
INSERT INTO prodinfo VALUES ('PD'||prodkey.nextval, 'BattleNet', 'OVERWATCH', 1, 47000, '판매중', sysdate);
SELECT * FROM prodinfo ORDER BY prodkey DESC;
-- SELECT * FROM prodinfo ORDER BY prodkey DESC -- [상품정보] 조회
-- INSERT INTO prodinfo VALUES ('PD'||prodkey.nextval, ?, ?, ?, ?, ?, sysdate) -- [상품정보] 등록

-- [위시리스트] 테이블

DROP TABLE wishlist;
CREATE TABLE wishlist (
	wishkey varchar2(8) PRIMARY KEY,
--	prodkey varchar2(8) CONSTRAINT wishlist_prodkey_fk REFERENCES prodinfo(prodkey),
	prodkey varchar2(8),
	regdate DATE NOT NULL
);
DROP SEQUENCE wishkey;
CREATE SEQUENCE wishkey
	START WITH 999
	MINVALUE 999
	MAXVALUE 9999999999999;
SELECT prodkey.currval FROM dual;
SELECT wishkey.currval FROM dual;
INSERT INTO wishlist VALUES ('WI'||wishkey.nextval, 'PD'||prodkey.nextval, sysdate);
INSERT INTO wishlist VALUES ('WI'||wishkey.nextval, 'PD'||prodkey.nextval, sysdate);
SELECT * FROM wishlist ORDER BY wishkey DESC;