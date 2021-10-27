-- ============================================================================================================================================================================================================ --
-- 매칭 정보 (마인핏) 테이블
DROP TABLE Wanna_Minefit;
CREATE TABLE Wanna_Minefit (
	mf_num varchar2(50) PRIMARY KEY, -- 마인핏 번호
	mf_date DATE, -- 마인핏 진행일
	mf_resultnum varchar2(50) CONSTRAINTS Wanna_Minefit_mf_resultnum_fk REFERENCES Wanna_Minefit-RESULT(mf_resultnum), -- 마인핏 결과 번호 (외래키)
	wm_id varchar2(50) CONSTRAINTS Wanna_Minefit_wm_id_fk REFERENCES Wanna_Member(wm_id) -- 회원 ID (외래키)
);
DROP SEQUENCE mf_num;
CREATE SEQUENCE mf_num
	INCREMENT BY 1   
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 9999999;
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan01');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan02');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan03');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan04');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan05');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan06');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan07');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan08');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), TO_DATE('2021-09-06','YYYY/MM/DD'), '', 'himan09');	
INSERT INTO Wanna_Minefit VALUES('MF'||(mf_num.nextval), sysdate, '', 'himan10');	
SELECT * FROM Wanna_Minefit ORDER BY mf_num DESC;

-- ============================================================================================================================================================================================================ --
-- 매칭 결과 (마인핏 결과) 테이블
DROP TABLE Wanna_Minefit-RESULT;
CREATE TABLE Wanna_Minefit-RESULT (
	mf_resultnum varchar2(50) PRIMARY KEY, -- 마인핏 결과 번호
	mf_result varchar2(1000), -- 마인핏 결과
	wm_id varchar2(50) CONSTRAINTS Wanna_Minefit-RESULT_wm_id_fk REFERENCES Wanna_Member(wm_id) -- 회원 ID (외래키)
);
DROP SEQUENCE mf_resultnum;
CREATE SEQUENCE mf_resultnum
	INCREMENT BY 1   
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 9999999;
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan01');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan02');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan03');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan04');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan05');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan06');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan07');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan08');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan09');	
INSERT INTO Wanna_Minefit-RESULT VALUES('MR'||(mf_resultnum.nextval), '', 'himan10');	
SELECT * FROM Wanna_Minefit-RESULT ORDER BY mf_num DESC;