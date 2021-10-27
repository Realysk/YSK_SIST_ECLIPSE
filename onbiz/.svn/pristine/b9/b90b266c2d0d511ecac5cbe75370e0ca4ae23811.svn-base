

-- 산출물 OnOutput 
-- 산출물번호(pk), 산출물 종류, 산출물명, 산출물 파일분류, 산출물 파일경로, 회의록번호(fk), 작업번호(fk)
-- opt_no, opt_kind, opt_name, opt_doctype, opt_docpath, note_no, task_no
DROP TABLE OnOutput;
CREATE TABLE OnOutput (
	opt_no varchar2(10) NOT NULL, -- 작업_파일번호
	opt_name varchar2(50), -- 작업_파일명
	opt_doctype varchar2(30), -- 작업_파일분류
	opt_regDte varchar2(30), -- 작업_파일등록일
	task_no NUMBER -- 작업번호
);


DROP SEQUENCE OnOutput_seq;
CREATE SEQUENCE OnOutput_seq
   INCREMENT BY 1   
   START WITH 1
   MINVALUE 1
   MAXVALUE 999999;

  
-- 산출물번호(pk), 산출물 종류, 산출물명, 산출물 파일분류, 작업번호(fk), 회의록번호(fk)
-- opt_no, opt_kind, opt_name, opt_doctype, task_no, note_no
INSERT INTO OnOutput values('opt'||lpad(OnOutput_seq.nextval, 6, 0), 'UI화면 설계서', 'pptx', '2021-09-02', 2);
INSERT INTO OnOutput values('opt'||lpad(OnOutput_seq.nextval, 6, 0), 'UI화면 설계서', 'pptx', '2021-09-02', 4);
INSERT INTO OnOutput values('opt'||lpad(OnOutput_seq.nextval, 6, 0), '화면구현 소개서', 'pptx', '2021-09-12', 6);
INSERT INTO OnOutput values('opt'||lpad(OnOutput_seq.nextval, 6, 0), 'DB구현 소개서', 'sql', '2021-09-15', 8);
INSERT INTO OnOutput values('opt'||lpad(OnOutput_seq.nextval, 6, 0), 'UI화면 설계서', 'pptx', '2021-09-20', 10);

SELECT * FROM OnOutput;


SELECT to_char(sysdate, 'YYYY-MM-DD') FROM dual;

