-- 커뮤니티 : QUIZ에서 출제 된 문제의 정답을 입력 한 퀴즈 정보를 테이블에 도출

-- JSTUDY 커뮤니티 : QUIZ (무결성 조건 활용)

CREATE TABLE JSCOM_QUIZ (
	quest varchar2(200) CONSTRAINT JSCOM_QUIZ_quest_nn NOT NULL, -- 퀴즈 문제
	usrans varchar2(30) CONSTRAINT JSCOM_QUIZ_usrans_nn NOT NULL, -- 유저 답안
	answer varchar2(30) CONSTRAINT JSCOM_QUIZ_answer_nn NOT NULL); -- 문제 정답
	
INSERT INTO JSCOM_QUIZ VALUES ('각종 개발환경 중 오랜 역사를 지닌 이 프로그램은 무엇일까요?', '아톰', '이클립스');
INSERT INTO JSCOM_QUIZ VALUES ('영상처리에 최적화 된 이 언어는 무엇일까요?','모름','OpenCV');
INSERT INTO JSCOM_QUIZ VALUES ('HTML로 판을 깔고 CSS로 디자인을 하며 JSP로 학습시키는 이 작업을 무엇이라 할까요?','Frontend','Frontend');
INSERT INTO JSCOM_QUIZ VALUES ('JAVA에서 생산하고 DB에서 관리하는 이 작업을 무엇이라 할까요?','글쎄요','Backend');
INSERT INTO JSCOM_QUIZ VALUES ('영상처리에 최적화 된 이 언어는 무엇일까요?','모름','OpenCV');
INSERT INTO JSCOM_QUIZ VALUES ('지금 하고 있는 이것은 무엇일까요?','DB','DB');

SELECT quest "QUIZ 문제", usrans "유저 답안", answer "문제 정답"
FROM JSCOM_QUIZ;


-- QUIZ 정답 일치 여부
SELECT quest "퀴즈 문제",
	CASE WHEN usrans = answer THEN '정답'
		 WHEN usrans != answer THEN '오답'
		 ELSE '정답 혹은 오답만 판단'
	END "정답 여부"
FROM JSCOM_QUIZ;
