/*
 # DB 처리 화면 구성
 	1. DB 구조 만들기, 데이터 입력, SQL 작성
 	2. VO 만들기
 	3. DAO, 기능 메서드 구현
 	4. 화면에서 호출 출력
 */

-- 게시물 업로드를 위한 테이블 생성
DROP TABLE Picmagine_upload;
CREATE TABLE Picmagine_upload (
	title varchar2(100) CONSTRAINT Picmagine_upload_title_nn NOT NULL, -- 게시물 제목
	contents varchar2(300) CONSTRAINT Picmagine_upload_contents_nn NOT NULL, -- 게시물 내용
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
-- INSERT INTO Picmagine_upload VALUES(?, ?, ?, ?, ?, ?, ?);

