-- 커뮤니티 메뉴에서 각 게시판 별로 입력 한 게시물 정보를 테이블에 도출
-- (연관관계 필수 - join)

-- JSTUDY 커뮤니티 : 자유 게시판

CREATE TABLE JSCOM_FREE (
	writeNum number, -- 게시물 번호
	writeTitle varchar2(300), -- 게시물 제목
	writer varchar2(100), -- 게시물 작성자
	writeDate date, -- 게시물 작성일자
	writeCont varchar(300) -- 게시물 내용
);

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
	writeNum number, -- 게시물 번호
	writeTitle varchar2(300), -- 게시물 제목
	writer varchar2(100), -- 게시물 작성자
	writeDate date, -- 게시물 작성일자
	writeCont varchar(300) -- 게시물 내용
);

INSERT INTO JSCOM_STUDY VALUES (3, 'HTML 대망의 첫 강의', 'hihihi', sysdate, '파고들면 쉽습니다!');
INSERT INTO JSCOM_STUDY VALUES (2, '오라클 설정방법', 'DB를누벼라', TO_DATE('2021-06-26 09:22:12','YYYY-MM-DD HH:MI:SS'), '깔끔하게 정리해봤습니다.');
INSERT INTO JSCOM_STUDY VALUES (1, 'JAVA 첫 시작! 1강입니다.', '자바를잡으러', TO_DATE('2021-06-25 08:12:55','YYYY-MM-DD HH:MI:SS'), '첫 강의영상입니다! 도움이 되셨으면 좋겠네요~');

SELECT writeNum "No", writeTitle "제목", writer "작성자", writeDate "작성 일자", writeCont "내용"
FROM JSCOM_STUDY;

-- JSTUDY 커뮤니티 : 질문 답변

CREATE TABLE JSCOM_QNA (
	writeNum number, -- 게시물 번호
	writeTitle varchar2(300), -- 게시물 제목
	writer varchar2(100), -- 게시물 작성자
	writeDate date, -- 게시물 작성일자
	writeCont varchar(300) -- 게시물 내용
);

INSERT INTO JSCOM_QNA VALUES (3, 'DB 질문이요', '어려운취준생', sysdate, '이클립스랑 오라클 연결 어떻게 해요?');
INSERT INTO JSCOM_QNA VALUES (2, '자바 관련 질문입니다.', 'byeman', TO_DATE('2021-06-25 06:08:45','YYYY-MM-DD HH:MI:SS'), 'C언어랑 연관있나요?');
INSERT INTO JSCOM_QNA VALUES (1, '뭐하는 사이트에요?', '여긴어디지', TO_DATE('2021-06-25 12:16:25','YYYY-MM-DD HH:MI:SS'), '사이트 주제를 모르겠어요..');

SELECT writeNum "No", writeTitle "제목", writer "작성자", writeDate "작성 일자", writeCont "내용"
FROM JSCOM_QNA;



-- SQL
-- ex1) 부서명, 사원명을 join으로 출력하세요.
SELECT dname, ename -- 출력할 데이터 컬럼
FROM emp e, dept d -- 테이블명
WHERE e.deptno=d.deptno; -- join관계에 있는 컬럼을 지정

-- ex1) 급여가 1000~3000사이의 부서명, 사원명, 급여를 출력하세요.
SELECT dname, ename, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal BETWEEN 1000 AND 3000;

SELECT writeNum, writeTitle, writer, jf.JSCOM_FREE
FROM JSCOM_FREE jf, JSCOM_STUDY js
WHERE jf.JSCOM_FREE=js.JSCOM_STUDY
AND writeNum BETWEEN 1 AND 3;