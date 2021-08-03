DROP TABLE games_product;
CREATE TABLE games_product ( -- 상품정보
   pdnum varchar2(100) PRIMARY KEY, -- 상품 번호
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
SELECT pdnum_seq.nextval FROM dual;
SELECT pdnum_seq.currval FROM dual;
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), 'NAA 2k22', 'imgA01.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://www.youtube.com/user/H2Interactive', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), 'NBA 2k22 NBA 75주년 에디션', 'imgA02.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://www.youtube.com/user/H2Interactive', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '에이리언:파이어팀엘리트', 'imgA03.png', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://www.youtube.com/user/H2Interactive', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '에이리언 파이어팀 엘리트 디럭스 에디션', 'imgA04.png', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://www.youtube.com/user/H2Interactive', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '트라이브오브미드가르드', 'imgA05.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://www.youtube.com/user/H2Interactive', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '트라이브오브미드가르드 디럭스 에디션', 'imgA06.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '크리스테일즈', 'imgA07.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '베어너클4-mr.X의 악몽', 'imgA08.png', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '몬스터헌터 스토리즈2파멸의 날개(예약판)', 'imgA09.jpg', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '더 크루2 스페셜', 'imgA10.JPG', 13000, 0.17, 'Steam', TO_DATE('2021-08-17','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '어드벤처', 'AMPLITUDE Studios', '11bit studio S.A', 'N', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '포 아너 5년차 시즌 2배틀 패스', 'imgA11.JPG', 56000, 0.17, 'Bethesda', TO_DATE('2021-07-16','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '레이싱/스포츠', 'gearbox software', '1C online Games ltd', 'Y', '판매중', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '레인보우 식스 시즈-오퍼레이터' , 'imgA12.JPG', 166000, 0.17, 'Epic', TO_DATE('2021-09-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '롤플레잉', 'Focus home interactive', '2k', 'N', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '아노1800-시즌', 'imgA13.JPG', 15000, 0.17, 'Rocstar games Launcher', TO_DATE('2021-10-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '슈팅/FPS', 'only by Midnight ltd', '34bigThings srl', 'Y', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '스콧 필그림 vs 더월드', 'imgA14.JPG', 67000, 0.17, 'Steam', TO_DATE('2021-11-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '퍼즐', 'Hatinh Interactive', '505 games ', 'Y', '판매예약', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '포 아너 그리폰', 'imgA15.JPG', 36000, 0.17, 'Ubisoft Connect', TO_DATE('2021-12-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '시뮬레이션', 'gearbox', 'ACCOUNT Design', 'Y', '판매예약', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '톰 클랜시의 디비전2', 'imgA16.JPG', 78000, 0.17, 'Ubisoft', TO_DATE('2021-01-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '전략', 'Hatinh Interactive', 'arc  system works', 'Y', '판매예약', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '고스트 리콘 브레이크 포인트', 'imgA17.JPG', 25000, 0.17, 'Ubisoft', TO_DATE('2021-02-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '액션/RPG', 'Focus home interactive', 'aspyr', 'Y', '판매예정', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '고스트리콘 브레이크포인트1년차 패스', 'imgA18.JPG', 34000, 0.17, 'Ubisoft', TO_DATE('2021-03-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '액션/어드벤처', 'AMPLITUDE Studios', 'atari', 'N', '판매증', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '레이지2', 'imgA19.JPG', 78000, 0.17, 'Steam', TO_DATE('2021-03-16','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '스포츠', 'AMPLITUDE Studios', 'bandland Games', 'N', '판매중', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '레드데드 디뎀션1', 'imgA20.JPG', 32000, 0.17, 'Rocstar', TO_DATE('2021-05-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '어드벤처', 'Focus home interactive', 'behavior interactive inc', 'Y', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '그랜트 테프트 오토 v -범죄 조직 스타터팩', 'imgA21.JPG', 82000, 0.17, 'Rocstar', TO_DATE('2021-04-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '어드벤처', 'AMPLITUDE Studios', 'bethesda softwork', 'N', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), 'LA-smdhkfm', 'imgA22.JPG', 98000, 0.17, 'Rocstar', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '롤플레잉', 'Focus home interactive', 'capcom', 'Y', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '맥스 페인 3', 'imgA23.JPG', 35000, 0.17, 'Steam', TO_DATE('2021-07-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '롤플레잉', 'AMPLITUDE Studios', 'capcom', 'Y', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '시드 마이어의 문명', 'imgA24.JPG', 11000, 0.17, 'Epic', TO_DATE('2021-01-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '롤플레잉', 'AMPLITUDE Studios', 'bethesda softwork', 'N', '판매중', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '아우터월드', 'imgA25.JPG', 73000, 0.17, 'Epic', TO_DATE('2020-10-18','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'Y', '액션/어드벤처', 'Focus home interactive', 'behavior interactive inc', 'N', '판매중', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '웨어울프', 'imgA26.JPG', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '액션/어드벤처', 'gearbox software', 'bandland Games', 'Y', '판매중', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '웨어울프-디아포칼립스', 'imgA27.JPG', 34000, 0.17, 'Bethesda', TO_DATE('2021-08-16','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'atari', 'Y', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '시드마이어의 문명-에픽게임즈 바벨론팩', 'imgA28.JPG', 62000, 0.17, 'Bethesda', TO_DATE('2021-08-19','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '액션/RPG', 'gearbox software', 'aspyr', 'N', '판매예약', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '마피아데피니티', 'imgA29.JPG', 62000, 0.17, 'Steam', TO_DATE('2021-08-12','YYYY-MM-DD'), 'E', 'https://youtu.be/wnFSinRJFwo', 'N', '액션/RPG', 'AMPLITUDE Studios', 'arc  system works', 'Y', '판매예정', '15세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '컨트롤 얼티밋 에디션', 'imgA30.JPG', 25000, 0.17, 'Steam', TO_DATE('2021-08-15','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'N', '전략', 'gearbox software', 'ACCOUNT Design', 'N', '판매예정', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '아웃 오브 라인', 'imgA31.JPG', 13500, 0.04, 'Steam', TO_DATE('2021-06-23','YYYY-MM-DD'), 'K', 'https://youtu.be/WhWxpTX8mtQ', 'N', '퍼즐', 'Nerd Monkeys', 'Hatinh Interactive', 'Y', '판매중', '전체 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '엘디스트 소울', 'imgA32.JPG', 20500, 0.2, 'Steam', TO_DATE('2021-07-29','YYYY-MM-DD'), 'K', 'https://youtu.be/cas2BMrShLA', 'Y', '액션', 'Fallen Flag Studio', 'United Label', 'Y', '판매중', '12세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '휴먼카인드 디지털 디럭스 에디션', 'imgA33.JPG', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '18세 이용가');
INSERT INTO games_product VALUES ('pd'||lpad(pdnum_seq.currval,4,0), '타이니티나의원더랜드', 'imgA34.png', 62000, 0.17, 'Steam', TO_DATE('2021-08-18','YYYY-MM-DD'), 'K', 'https://youtu.be/wnFSinRJFwo', 'Y', '전략', 'AMPLITUDE Studios', 'SEGA', 'N', '판매예정', '18세 이용가');
SELECT * FROM games_product ORDER BY pdnum DESC;

--=====================================================================================================================================================================================================================================================================================================

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
CREATE SEQUENCE mbnum_seq -- 회원 시퀀스
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
SELECT mbnum_seq.nextval FROM dual;
SELECT mbnum_seq.currval FROM dual;
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'hong1111', 'hkd0203', '홍서방', 'hong111@gmail.com', 'Y', '홍길동', TO_DATE('1990-01-23','YYYY-MM-DD'), '회원');
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'gogo1023', '1023gogo', '가즈아', 'gogo1023@naver.com', 'Y', '김철수', TO_DATE('1989-12-20','YYYY-MM-DD'), '회원');
INSERT INTO games_member VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'hong1111', 'hkd0203', '홍서방', 'hong111@gmail.com', 'Y', '홍길동', TO_DATE('1990-01-23','YYYY-MM-DD'), '회원');
SELECT * FROM games_member ORDER BY mbnum DESC;

--=====================================================================================================================================================================================================================================================================================================

-- 위시리스트 테이블
DROP TABLE games_wishlist;
CREATE TABLE games_wishlist ( -- 위시리스트
	mbnum CONSTRAINTS games_member_mbnum_fk REFERENCES games_member(mbnum), -- 회원 번호 (외래키)
	pdnum CONSTRAINTS games_wishlist_pdnum_fk REFERENCES games_product(pdnum), -- 상품 번호 (외래키)
	whdate DATE NOT NULL -- 저장일
);
INSERT INTO games_wishlist(mbnum, pdnum, whdate) VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
INSERT INTO games_wishlist(mbnum, pdnum, whdate) VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
INSERT INTO games_wishlist(mbnum, pdnum, whdate) VALUES ('mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
SELECT * FROM games_wishlist ORDER BY pdnum DESC;

--=====================================================================================================================================================================================================================================================================================================

-- 장바구니 테이블 (현재 여기서 생성이 안됨...)
DROP TABLE games_cart;
CREATE TABLE games_cart (
	ctnum varchar2(50) PRIMARY KEY, -- 장바구니 번호
	mbnum CONSTRAINTS games_member_mbnum_fk REFERENCES games_member(mbnum), -- 회원 번호 (외래키)
	pdnum CONSTRAINTS games_cart_pdnum_fk REFERENCES games_product(pdnum), -- 상품 번호 (외래키)
	ctdate DATE NOT NULL -- 저장일
);
DROP SEQUENCE ctnum_seq;
CREATE SEQUENCE ctnum_seq -- 장바구니 시퀀스
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 99999999;
SELECT ctnum_seq.nextval FROM dual;
SELECT ctnum_seq.currval FROM dual;
INSERT INTO games_cart(ctnum, mbnum, pdnum, ctdate) VALUES(ctnum, mbnum, pdnum, ctdate) ('ct'||lpad(ctnum_seq.currval,4,0), 'mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
INSERT INTO games_cart(ctnum, mbnum, pdnum, ctdate) VALUES(ctnum, mbnum, pdnum, ctdate) ('ct'||lpad(ctnum_seq.currval,4,0), 'mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
INSERT INTO games_cart(ctnum, mbnum, pdnum, ctdate) VALUES(ctnum, mbnum, pdnum, ctdate) ('ct'||lpad(ctnum_seq.currval,4,0), 'mb'||lpad(mbnum_seq.currval,4,0), 'pd'||lpad(pdnum_seq.currval,4,0), sysdate);
SELECT * FROM games_cart ORDER BY ctnum DESC;

--=====================================================================================================================================================================================================================================================================================================


