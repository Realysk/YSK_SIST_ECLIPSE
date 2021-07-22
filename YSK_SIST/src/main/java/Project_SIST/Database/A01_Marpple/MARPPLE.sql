-- 회원가입된 정보를 로그인 테이블에 도출

CREATE TABLE MPMEMBER (
	nmkey varchar2(100),
	id varchar2(100),
	pw varchar2(100),
	name varchar2(100),
	score varchar2(100)
);

INSERT INTO MPMEMBER VALUES ('NO_004','mong@gmail.com','1111','마길동',40);
INSERT INTO MPMEMBER VALUES ('NO_003','yong@gmail.com','1029','유길동',30);
INSERT INTO MPMEMBER VALUES ('NO_002','kong@gmail.com','0604','김길동',20);
INSERT INTO MPMEMBER VALUES ('NO_001','chong@gmail.com','9603','최길동',10);
SELECT nmkey "회원 번호", id "ID(EMAIL)", pw "PW", name "이름", score
FROM MPMEMBER;


-- 장바구니에 담을 상품 정보를 장바구니 테이블에 도출(미완성)

CREATE TABLE MPCART (
	prodKey varchar2(100),
	prodName varchar2(150),
	price number,
	cnt number,
	tot1 number,
	delivery number,
	tot2 number,
	score number
);

INSERT INTO MPCART VALUES ('CA_004','투명 폰 스트랩',5400,3,16200,2500,18700,40);
INSERT INTO MPCART VALUES ('CA_003','아이폰 12 PRO MAX 투명 범퍼케이스 (블랙)',21900,4,87600,0,87600,30);
INSERT INTO MPCART VALUES ('CA_002','페어플레이 에센셜 후드 집업',33000,1,33000,2500,35500,20);
INSERT INTO MPCART VALUES ('CA_001','챔피온 스트릿 후드',37900,2,75800,0,75800,10);
SELECT prodKey "주문 번호", prodName "상품명", price "가격", cnt "수량", tot1 "상품 총 가격",
delivery "배송비", tot2 "총 가격", score
FROM MPCART;