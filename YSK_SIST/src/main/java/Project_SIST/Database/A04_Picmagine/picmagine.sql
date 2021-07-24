/*
 # DB 처리 화면 구성
 	1. DB 구조 만들기, 데이터 입력, SQL 작성
 	2. VO 만들기
 	3. DAO, 기능 메서드 구현
 	4. 화면에서 호출 출력
 */

-- 회원가입을 위한 테이블 생성
DROP TABLE Picmagine_join;
CREATE TABLE Picmagine_join (
	memcode varchar2(6) PRIMARY KEY, -- 회원 번호
	name varchar2(100), -- 이름
	id varchar2(100), -- ID
	pw varchar2(100), -- PW
	tel varchar2(100), -- 휴대폰 번호
	email varchar2(100) -- 이메일
);
DROP SEQUENCE pic_memcode;
CREATE SEQUENCE pic_memcode
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 99999999;
SELECT pic_memcode.nextval FROM dual;
INSERT INTO Picmagine_join VALUES('PM' || pic_memcode.nextval, '홍길동', 'hong798', '1589', '010-1111-1111', 'hong111@gmail.com');
INSERT INTO Picmagine_join VALUES('PM' || pic_memcode.nextval, '김길동', 'Kkd294', 'abcd5049', '010-2452-1393', 'Kkd222@naver.com');
INSERT INTO Picmagine_join VALUES('PM' || pic_memcode.nextval, '고길동', 'gogo586', 'bngk954', '010-0508-9496', 'gogo333@gmail.com');
SELECT * FROM Picmagine_join ORDER BY memcode DESC;
-- SELECT * FROM Picmagine_join ORDER BY memcode DESC -- 회원 정보 조회
-- INSERT INTO Picmagine_join VALUES('PM' || pic_memcode.nextval, ?, ?, ?, ?, ?) -- 회원 가입
-- SELECT * FROM Picmagine_join WHERE memcode = ? -- 로그인 
-- SELECT * FROM Picmagine_join WHERE id LIKE '%'||?||'%' ORDER BY memcode DESC -- ID 검색
-- SELECT * FROM Picmagine_join WHERE pw LIKE '%'||?||'%' ORDER BY memcode DESC -- PW 검색

-- 게시물 업로드를 위한 테이블 생성

DROP TABLE Picmagine_upload;

CREATE TABLE Picmagine_upload (
	title varchar2(100), -- 게시물 제목
	contents varchar2(300), -- 게시물 내용
	pic_file varchar2(100), -- 파일명
	tag varchar2(100), -- 태그
	storyname varchar2(100), -- 스토리 제목
	storycontents varchar2(100), -- 스토리 제목
	stroytitle varchar2(100) -- 스토리 주제
);
INSERT INTO Picmagine_upload VALUES('안녕하세요!', '인사드립니다!', 'flower.png', '#처음', '재밋어요', '첫 스토리!', '배경');
INSERT INTO Picmagine_upload VALUES('ㅎㅇㅎㅇ', '........', NULL, '#뭐지', NULL, NULL, NULL);
INSERT INTO Picmagine_upload VALUES('여기 좋네용', '반갑습니다', 'panda.png', '#팬더 #동물 #사계', '너무좋아요', '자주올래요!', '자연');
SELECT * FROM Picmagine_upload;
-- SELECT * FROM Picmagine_upload
-- INSERT INTO Picmagine_upload VALUES(?, ?, ?, ?, ?, ?, ?)


