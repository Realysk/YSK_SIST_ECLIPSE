-- 회의록 테이블 삭제
DROP TABLE OnMeetingNote;
-- 회의록 테이블 생성
CREATE TABLE OnMeetingNote (
	note_no VARCHAR2(10) PRIMARY KEY, -- 회의록번호 (pk) 
	note_name VARCHAR2(50) NOT NULL, -- 회의록명
	note_content VARCHAR2(500) NOT NULL, -- 회의록내용
	note_regdte DATE NOT NULL, -- 회의록 등록일
	note_uptdte DATE NOT NULL, -- 회의록 수정일
	mem_no varchar2(10) -- 회의록 작성자 (프로젝트 맴버)
);

-- 회의록번호 시퀀스 삭제
DROP SEQUENCE OnMeetingNote_seq;
-- 회의록번호 시퀀스 생성
CREATE SEQUENCE OnMeetingNote_seq
	INCREMENT BY 1
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 9999999;

-- 프로젝트 맴버 기본 키를 넣어야 해서 인서트 아직 하지마세요!!
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0901 회의록', '요구사항 분석과 화면설계서를 작성했습니다.', TO_DATE('2021-09-01','YYYY-MM-DD'), sysdate, 'mem1001');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0902 회의록', '분석을 대부분 마치고 팀원들끼리 ERD 설계를 진행했습니다.', TO_DATE('2021-09-02','YYYY-MM-DD'), sysdate, 'mem1002');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0903 회의록', '각자 ERD 설계한 것을 취합했습니다.', TO_DATE('2021-09-03','YYYY-MM-DD'), sysdate, 'mem1003');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0904 회의록', '설계된 ERD를 바탕으로 팀원들끼리 DB 설계를 진행했습니다.', TO_DATE('2021-09-04','YYYY-MM-DD'), sysdate, 'mem1002');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0905 회의록', 'DB 설계한 것을 공유하여 완성했습니다.', TO_DATE('2021-09-05','YYYY-MM-DD'), sysdate, 'mem1001');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0906 회의록', '스프링 환경설정을 진행하여 구현을 시작할 수 있게 되었습니다.', TO_DATE('2021-09-06','YYYY-MM-DD'), sysdate, 'mem1001');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0907 회의록', '팀원들끼리 기능을 사전에 나누어 화면구현을 시작했습니다.', TO_DATE('2021-09-07','YYYY-MM-DD'), sysdate, 'mem1002');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0908 회의록', '중간 보고합니다.', TO_DATE('2021-09-08','YYYY-MM-DD'), sysdate, 'mem1003');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0909 회의록', '화면구현을 중간정도 진행하고 PPT 제작에 돌입했습니다.', TO_DATE('2021-09-09','YYYY-MM-DD'), sysdate, 'mem1004');
INSERT INTO OnMeetingNote VALUES ('mtn'||(OnMeetingNote_seq.nextval), '0910 회의록', 'Spring MVC 설계를 시작했습니다.', TO_DATE('2021-09-10','YYYY-MM-DD'), sysdate, 'mem1005');

SELECT * FROM OnMeetingNote;