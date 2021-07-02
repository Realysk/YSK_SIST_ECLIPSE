-- 커뮤니티 메뉴에서 각 게시판 별로 입력 한 게시물 정보를 테이블에 도출

-- JSTUDY 커뮤니티 : 자유 게시판

CREATE TABLE JSCOM_FREE (
	writeNum number(10) PRIMARY KEY, -- 게시물 번호
	writeTitle varchar2(300) CONSTRAINT JSCOM_FREE_writeNum_nn NOT NULL, -- 게시물 제목
	writer varchar2(100) CONSTRAINT JSCOM_FREE_writer_nn NOT NULL, -- 게시물 작성자
	writeDate date CONSTRAINT JSCOM_FREE_writeDate_nn NOT NULL, -- 게시물 작성일자
	writeCont varchar2(300) CONSTRAINT JSCOM_FREE_writeCont_nn NOT NULL); -- 게시물 내용

INSERT INTO JSCOM_FREE VALUES (6, '반갑습니다!', '홍시', sysdate ,'홈페이지 제작 처음입니다!');
INSERT INTO JSCOM_FREE VALUES (5, '너무 좋은 사이트네요ㅎㅎ', 'himan', TO_DATE('2021-06-26 07:12:36','YYYY-MM-DD HH:MI:SS'), '저는 현직 개발자입니다!');
INSERT INTO JSCOM_FREE VALUES (4, 'ㅎㅇ', 'cool', TO_DATE('2021-06-26 07:08:17','YYYY-MM-DD HH:MI:SS'), 'ㅎㅇㅎㅇ');
INSERT INTO JSCOM_FREE VALUES (3, '여기는 뭐하는 곳이죠??', 'byeman', TO_DATE('2021-06-25 11:46:11','YYYY-MM-DD HH:MI:SS'), '처음이라 잘 부탁드려요..ㅎㅎㅎ');
INSERT INTO JSCOM_FREE VALUES (2, '오 드디어 오픈이네요!', '강남살아요', TO_DATE('2021-06-25 08:18:02','YYYY-MM-DD HH:MI:SS'), '배우러 왔습니다!');
INSERT INTO JSCOM_FREE VALUES (1, '안녕하세요!', '홍길동', TO_DATE('2021-06-25 05:11:53','YYYY-MM-DD HH:MI:SS'), '잘 부탁드려요~');

SELECT writeNum "No", writeTitle "제목", writer "작성자", writeDate "작성 일자", writeCont "내용"
FROM JSCOM_FREE;


-- JSTUDY 커뮤니티 : 스터디

CREATE TABLE JSCOM_STUDY (
	writeNum number(10) PRIMARY KEY, -- 게시물 번호
	writeTitle varchar2(300) CONSTRAINT JSCOM_STUDY_writeNum_nn NOT NULL, -- 게시물 제목
	writer varchar2(100) CONSTRAINT JSCOM_STUDY_writer_nn NOT NULL, -- 게시물 작성자
	writeDate date CONSTRAINT JSCOM_STUDY_writeDate_nn NOT NULL, -- 게시물 작성일자
	writeCont varchar2(300) CONSTRAINT JSCOM_STUDY_writeCont_nn NOT NULL); -- 게시물 내용

INSERT INTO JSCOM_STUDY VALUES (6, 'SPRING이란?', '봄이왔네요', sysdate, '봄입니다...');
INSERT INTO JSCOM_STUDY VALUES (5, 'JSP 1강입니다', 'jsp일타강사', TO_DATE('2021-06-27 01:07:46','YYYY-MM-DD HH:MI:SS'), 'JSP 1강입니다');
INSERT INTO JSCOM_STUDY VALUES (4, 'CSS란 무엇인가 -1-', '유길동', TO_DATE('2021-06-26 11:11:11','YYYY-MM-DD HH:MI:SS'), 'HTML과 함께하는 CSS');
INSERT INTO JSCOM_STUDY VALUES (3, 'HTML 대망의 첫 강의', 'hihihi', TO_DATE('2021-06-26 09:22:12','YYYY-MM-DD HH:MI:SS'), '파고들면 쉽습니다!');
INSERT INTO JSCOM_STUDY VALUES (2, '오라클 설정방법', 'DB를누벼라', TO_DATE('2021-06-26 09:22:12','YYYY-MM-DD HH:MI:SS'), '깔끔하게 정리해봤습니다.');
INSERT INTO JSCOM_STUDY VALUES (1, 'JAVA 첫 시작! 1강입니다.', '자바를잡으러', TO_DATE('2021-06-25 08:12:55','YYYY-MM-DD HH:MI:SS'), '첫 강의영상입니다! 도움이 되셨으면 좋겠네요~');

SELECT writeNum "No", writeTitle "제목", writer "작성자", writeDate "작성 일자", writeCont "내용"
FROM JSCOM_STUDY;

-- JSTUDY 커뮤니티 : 질문 답변

CREATE TABLE JSCOM_QNA (
	writeNum number(10) PRIMARY KEY, -- 게시물 번호
	writeTitle varchar2(300) CONSTRAINT JSCOM_QNA_writeNum_nn NOT NULL, -- 게시물 제목
	writer varchar2(100) CONSTRAINT JSCOM_QNA_writer_nn NOT NULL, -- 게시물 작성자
	writeDate date CONSTRAINT JSCOM_QNA_writeDate_nn NOT NULL, -- 게시물 작성일자
	writeCont varchar2(300) CONSTRAINT JSCOM_QNA_writeCont_nn NOT NULL); -- 게시물 내용

INSERT INTO JSCOM_QNA VALUES (6, '호환성 질문이요', '쉽지않네요', sysdate, '맥이랑 호환성 좋나요?');
INSERT INTO JSCOM_QNA VALUES (5, '질문', '마길자', TO_DATE('2021-06-27 04:42:27','YYYY-MM-DD HH:MI:SS'), '안녕하세요~');
INSERT INTO JSCOM_QNA VALUES (4, 'api의 뜻이 뭐죠?', '현직삼성개발자', TO_DATE('2021-06-26 10:23:25','YYYY-MM-DD HH:MI:SS'), 'API가 뭔지 아직 잘 모르겠어요');
INSERT INTO JSCOM_QNA VALUES (3, 'DB 질문이요', '어려운취준생', TO_DATE('2021-06-26 09:22:12','YYYY-MM-DD HH:MI:SS'), '이클립스랑 오라클 연결 어떻게 해요?');
INSERT INTO JSCOM_QNA VALUES (2, '자바 관련 질문입니다.', 'byeman', TO_DATE('2021-06-25 06:08:45','YYYY-MM-DD HH:MI:SS'), 'C언어랑 연관있나요?');
INSERT INTO JSCOM_QNA VALUES (1, '뭐하는 사이트에요?', '여긴어디지', TO_DATE('2021-06-25 12:16:25','YYYY-MM-DD HH:MI:SS'), '사이트 주제를 모르겠어요..');

SELECT writeNum "No", writeTitle "제목", writer "작성자", writeDate "작성 일자", writeCont "내용"
FROM JSCOM_QNA;

-- 게시물 번호 sequence

DROP SEQUENCE JSCOM_SEQ;
CREATE SEQUENCE JSCOM_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 999999;

SELECT JSCOM_SEQ.nextval "게시물 번호"
FROM JSCOM_FREE;

-- join 예정

-- JSTUDY 커뮤니티 : 검색 내역

CREATE TABLE JSCOM_SEARCH (
	jsLoc varchar2(300), -- 검색 지역
	writeNum number(10) PRIMARY KEY -- 게시물 번호
);

INSERT INTO JSCOM_SEARCH VALUES ('서울 중랑구', 1);
INSERT INTO JSCOM_SEARCH VALUES ('서울 강남구', 5);
INSERT INTO JSCOM_SEARCH VALUES ('서울 종로구', 3);
INSERT INTO JSCOM_SEARCH VALUES ('서울 도봉구', 2);
INSERT INTO JSCOM_SEARCH VALUES ('서울 강북구', 4);
INSERT INTO JSCOM_SEARCH VALUES ('서울 노원구', 6);
INSERT INTO JSCOM_SEARCH VALUES ('서울 광진구', 10);
INSERT INTO JSCOM_SEARCH VALUES ('부산 진구', 9);
INSERT INTO JSCOM_SEARCH VALUES ('경기도 의정부', 7);
INSERT INTO JSCOM_SEARCH VALUES ('경기도 남양주', 8);

SELECT jsLoc "검색 지역", writeNum "게시물 번호"
FROM JSCOM_SEARCH;

-- 각 게시판 DB와 검색 내역 DB의 공통으로 적용한 컬럼 : 게시물 번호 (writeNum)

-- SQL (연관 관계 필수 - join)

-- 작성자가 'byeman'인 사용자의 자유 게시판 게시물 정보 출력
SELECT jf.*, jsLoc
FROM JSCOM_FREE jf, JSCOM_SEARCH js2
WHERE jf.writeNum=js2.writeNum
AND writer = 'byeman';

-- 작성자가 'byeman'인 사용자의 스터디 게시판 게시물 정보 출력
SELECT js.*, jsLoc
FROM JSCOM_STUDY js, JSCOM_SEARCH js2
WHERE js.writeNum=js2.writeNum
AND writer = 'byeman';

-- 작성자가 'byeman'인 사용자의 질문 답변 게시판 게시물 정보 출력
SELECT jq.*, jsLoc
FROM JSCOM_QNA jq, JSCOM_SEARCH js2
WHERE jq.writeNum=js2.writeNum
AND writer = 'byeman';

-- 작성자가 'byeman'인 사용자의 모든 게시판 게시물 정보 출력
