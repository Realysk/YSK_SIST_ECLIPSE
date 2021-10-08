DROP TABLE calendar;
CREATE TABLE calendar(
	id NUMBER,
	title VARCHAR2(100),
	start1 VARCHAR2(50),
	end1 VARCHAR2(50),
	content VARCHAR2(500), -- 추가할 내용 처리
	borderColor VARCHAR2(20),
	backgroundColor VARCHAR2(20),
	textColor VARCHAR2(20),
	allDay NUMBER(1) -- 종일 여부 // true/false
);

DROP SEQUENCE cal_seq;
CREATE SEQUENCE cal_seq
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 9999;
		
INSERT INTO calendar VALUES (cal_seq.nextval, '일정첫등록', '2020-10-07', '2020-10-08', '일정등록합니다', 'navy', 'blue', 'yellow', 1);
INSERT INTO calendar VALUES (cal_seq.nextval, '일정첫등록', '2021-10-07', '2021-10-08', '일정등록합니다', 'navy', 'blue', 'yellow', 1);

SELECT * FROM calendar;

UPDATE calendar
	SET title = '일정수정',
		start1 = '2021-10-08',
		end1 = '2021-10-09',
		content = '내용수정',
		bordercolor = '#0099cc',
		backgroundcolor = '#0099cc',
		textcolor = '#ccfff',
		allday = 1
WHERE id = 1000;

DELETE FROM calendar WHERE id = '1006';