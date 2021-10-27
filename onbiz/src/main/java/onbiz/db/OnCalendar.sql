


-- 일정관리 테이블 
-- 일정번호, 일정명, 일정시작일, 일정종료일, 일정 내용, 테두리색, 배경색, 글자색, 종일여부
-- 일정 작성자(emp_no)
DROP TABLE OnCalendar;
CREATE TABLE OnCalendar(
	cal_no number PRIMARY KEY, -- 일정번호 
	cal_name varchar2(50) NOT NULL, -- 일정명 
	cal_regDte varchar2(50) NOT NULL, -- 일정 등록일 
	cal_uptDte varchar2(50), -- 일정 수정일 
	cal_startDte varchar2(50),-- 일정 시작일 
	cal_endDte varchar2(50), -- 일정 종료일 
	cal_content varchar2(500), -- 추가할 내용 처리
	cal_bdColor varchar2(20),
	cal_bColor varchar2(20),
	cal_tColor varchar2(20),
	cal_allDay number(1), -- 종일 여부 TRUE/FALSE
	emp_no varchar2(10) -- 일정 작성자
);

DROP SEQUENCE cal_no_seq;
CREATE SEQUENCE cal_no_seq
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;


INSERT INTO OnCalendar values(cal_no_seq.nextval, '일정 첫 등록', to_char(sysdate,'YYYY-MM-DD'), NULL,
	'2021-10-10', '2021-10-12', '일정등록입니다', 'navy', 'blue', 'yellow', 1, '1001');
	
-- 일정등록일 : sysdate의 데이터변환
SELECT to_char(sysdate,'YYYY-MM-DD') FROM dual;
SELECT * FROM OnCalendar WHERE emp_no='1001';

