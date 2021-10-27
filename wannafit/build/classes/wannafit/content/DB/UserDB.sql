
DROP TABLE Wanna_Member;

/* --------------------------- ( 사용테이블 생성 ) ------------------------------------------------ */


-- 회원테이블
-- 필수정보 : 회원아이디, 비밀번호, 이메일, 핸드폰번호, 회원구분, 신고횟수, 프로필이미지, 사업자번호(fk)
-- 선택정보(일반회원 테이블과 조인) : 아이디, 성별, 연령대, 운동분야, 가입이유
CREATE TABLE Wanna_Member (
	wm_id varchar2(50) PRIMARY KEY, 
	wm_pass varchar2(50) NOT NULL,
	wm_email varchar2(50) NOT NULL,
	wm_nick varchar2(50) NOT NULL,
	wm_tel NUMBER NOT NULL,
	wm_usrGroup varchar2(30) not null check(wm_usrGroup IN (0, 100, 200, 300, 400)), 
	wm_repCnt NUMBER NOT NULL default 0, 
	wm_imgSrc varchar2(50),
	wb_num varchar2(50)
);

-- 일반 회원 테이블 : 회원 정보 중 선택사항
CREATE TABLE Wanna_Mem_Com (
	wm_id varchar2(50) PRIMARY KEY,
	wm_gender char(1) check(wm_gender IN ('M', 'W')),
	wm_age NUMBER check(wm_age IN (10, 20, 30, 40, 50)),
	wm_sports NUMBER check(wm_sports IN (0, 1)),
	wm_result varchar2(50)
);


-- 회원 필수 정보 : 아이디(pk), 패스, 이메일, 닉네임, 번호, 회원구분, 신고횟수, 프로필이미지, 사업자정보번호(fk)
INSERT INTO Wanna_Member values('himan01', 'as7777', 'himan01@gmail.com', '홍길동', 01012341234, 100, 0, /mem01.png, null);
INSERT INTO Wanna_Member values('himan02', 'as7778', 'himan02@gmail.com', '김길동', 01012341235, 100, 1, /mem02.png, null);
INSERT INTO Wanna_Member values('himan03', 'as7779', 'himan03@gmail.com', '이길동', 01012341236, 100, 2, /mem03.png, null);
INSERT INTO Wanna_Member values('himan04', 'as7780', 'himan04@gmail.com', '박길동', 01012341237, 100, 3, null, null);
INSERT INTO Wanna_Member values('himan05', 'as7781', 'himan05@gmail.com', '유길동', 01012341238, 100, 1, /mem05.png, null);
INSERT INTO Wanna_Member values('himan06', 'as7782', 'himan06@gmail.com', '온길동', 01012341239, 100, 2, /mem06.png, null);
INSERT INTO Wanna_Member values('himan07', 'as7783', 'himan07@gmail.com', '사길동', 01012341240, 100, 3, /mem07.png, null);
INSERT INTO Wanna_Member values('himan08', 'as7784', 'himan08@gmail.com', '가길동', 01012341241, 100, 4, /mem08.png, null);
INSERT INTO Wanna_Member values('himan09', 'as7785', 'himan09@gmail.com', '나길동', 01012341242, 100, 5, null, null);
INSERT INTO Wanna_Member values('himan10', 'as7786', 'himan10@gmail.com', '다길동', 01012341243, 100, 1, /mem10.png, null);
INSERT INTO Wanna_Member values('himan11', 'as7787', 'himan11@gmail.com', '라길동', 01012341244, 100, 1, /mem11.png, null);
INSERT INTO Wanna_Member values('himan12', 'as7788', 'himan12@gmail.com', '마길동', 01012341245, 100, 2, /mem12.png, null);
INSERT INTO Wanna_Member values('himan13', 'as7789', 'himan13@gmail.com', '바길동', 01012341246, 100, 4, /mem13.png, null);
INSERT INTO Wanna_Member values('himan14', 'as7790', 'himan14@gmail.com', '아길동', 01012341247, 100, 0, /mem14.png, null);
INSERT INTO Wanna_Member values('himan15', 'as7791', 'himan15@gmail.com', '자길동', 01012341248, 100, 0, /mem15.png, null);
INSERT INTO Wanna_Member values('himan16', 'as7792', 'himan16@gmail.com', '차길동', 01012341249, 100, 0, /mem16.png, null);
INSERT INTO Wanna_Member values('himan17', 'as7793', 'himan17@gmail.com', '파길동', 01012341250, 100, 1, /mem17.png, null);


INSERT INTO Wanna_Member values('daily03', 'wedaily1', 'daily03@hanmail.net', '데일리1', 01011111111, 200, 0, /image301.png, null);
INSERT INTO Wanna_Member values('daily04', 'wedaily2', 'daily04@hanmail.net', '데일리2', 01011111112, 200, 1, /image302.png, null);
INSERT INTO Wanna_Member values('daily05', 'wedaily3', 'daily05@hanmail.net', '데일리3', 01011111113, 200, 2, /image303.png, null);
INSERT INTO Wanna_Member values('daily06', 'wedaily4', 'daily06@hanmail.net', '데일리4', 01011111114, 200, 3, /image304.png, null);
INSERT INTO Wanna_Member values('daily07', 'wedaily5', 'daily07@hanmail.net', '데일리5', 01011111115, 200, 4, /image305.png, null);
INSERT INTO Wanna_Member values('daily08', 'wedaily6', 'daily08@hanmail.net', '데일리6', 01011111116, 200, 1, /image306.png, null);
INSERT INTO Wanna_Member values('daily09', 'wedaily7', 'daily09@hanmail.net', '데일리7', 01011111117, 200, 1, /image307.png, null);
INSERT INTO Wanna_Member values('daily10', 'wedaily8', 'daily10@hanmail.net', '데일리8', 01011111118, 200, 2, /image308.png, null);
INSERT INTO Wanna_Member values('daily11', 'wedaily9', 'daily11@hanmail.net', '데일리9', 01011111119, 200, 2, /image309.png, null);
INSERT INTO Wanna_Member values('daily12', 'wedaily10', 'daily12@hanmail.net', '데일리10', 01011111110, 200, 9, /image310.png, null);

INSERT INTO Wanna_Member values('cookie01', 'ck9999', 'cookie01@gmail.com', '용감한맛쿠키1', 01082829999, 300, 1, /image401.png, null);
INSERT INTO Wanna_Member values('cookie02', 'ck9998', 'cookie02@gmail.com', '용감한맛쿠키2', 01082829998, 300, 2, /image402.png, null);
INSERT INTO Wanna_Member values('cookie03', 'ck9997', 'cookie03@gmail.com', '용감한맛쿠키3', 01082829997, 300, 3, /image403.png, null);
INSERT INTO Wanna_Member values('cookie04', 'ck9996', 'cookie04@gmail.com', '용감한맛쿠키4', 01082829996, 300, 4, /image404.png, null);
INSERT INTO Wanna_Member values('cookie05', 'ck9995', 'cookie05@gmail.com', '용감한맛쿠키5', 01082829995, 300, 5, /image405.png, null);
INSERT INTO Wanna_Member values('cookie06', 'ck9994', 'cookie06@gmail.com', '용감한맛쿠키6', 01082829994, 300, 6, /image406.png, null);
INSERT INTO Wanna_Member values('cookie07', 'ck9993', 'cookie07@gmail.com', '용감한맛쿠키7', 01082829993, 300, 7, /image407.png, null);
INSERT INTO Wanna_Member values('cookie08', 'ck9992', 'cookie08@gmail.com', '용감한맛쿠키8', 01082829992, 300, 8, /image408.png, null);
INSERT INTO Wanna_Member values('cookie09', 'ck9991', 'cookie09@gmail.com', '용감한맛쿠키9', 01082829991, 300, 9, /image409.png, null);

INSERT INTO Wanna_Member values('himan17', 'as7793', 'himan17@gmail.com', '파길동', 01012341250, 400, 1, /mem17.png, null);

INSERT INTO Wanna_Member values('heygirl01', 'cv0000', 'hey3333@naver.com', '에보시', 0103334444, 0, 0, null, null);
INSERT INTO Wanna_Member values('heygirl02', 'cv0000', 'hey3322@naver.com', '에보스', 0103334422, 0, 0, null, null);



-- 일반 회원 선택 정보 : 아이디(pk), 성별, 연령대, 운동분야유무, 가입이유
-- 가입이유(자세교정, 근력향상, 다이어트, 근력향상, 성장기어린이)
INSERT INTO Wanna_Member_Com values('himan01', 'M', 30, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan02', 'W', 20, 0, '자세교정');
INSERT INTO Wanna_Member_Com values('himan03', 'M', 10, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan04', 'M', 50, 0, '다이어트');
INSERT INTO Wanna_Member_Com values('himan05', 'W', 30, 0, '자세교정');
INSERT INTO Wanna_Member_Com values('himan06', 'W', 20, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan07', 'W', 20, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan08', 'M', 20, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan09', 'W', 20, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan10', 'M', 10, 0, '성장기어린이');
INSERT INTO Wanna_Member_Com values('himan11', 'W', 10, 0, '성장기어린이');
INSERT INTO Wanna_Member_Com values('himan12', 'M', 30, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan13', 'M', 50, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan14', 'M', 40, 0, '다이어트');
INSERT INTO Wanna_Member_Com values('himan15', 'W', 30, 0, '근력향상');
INSERT INTO Wanna_Member_Com values('himan16', 'W', 20, 0, '다이어트');
INSERT INTO Wanna_Member_Com values('himan17', 'M', 30, 0, '근력향상');



-- 테이블 컬럼명 변경
ALTER TABLE wanna_Member RENAME COLUMN wm_excuse TO wm_result;



-- 트레이너 테이블 (기본키:시퀀스 사용) 수정x
-- 개인트레이너번호,아이디,비밀번호,닉네임,핸드폰번호,이메일, 전공운동,사업자번호,사업자구분,요금제,요금제결제일, 신고횟수
CREATE TABLE Wanna_Trainer (
	wt_num varchar2(50) PRIMARY KEY,
	wt_id varchar2(50) NOT NULL,
	wt_pass varchar2(50) NOT NULL,
	wt_nick varchar2(50) NOT NULL,
	wt_tel NUMBER NOT NULL,
	wt_email varchar2(50) NOT NULL,
	wt_major_Sports char(1) check(major_sports IN (1, 2, 3)) NOT NULL,
	wt_busNum varchar2(50),
	wt_busKind varchar2(50),
	wt_plan varchar2(50),
	wt_planDate DATE,
	wt_repCnt NUMBER NOT NULL
);

CREATE SEQUENCE wanna_Trainer_seq (
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
);

inset INTO Wanna_Trainer values("wt"||lpad(wanna_Trainer_seq.nextval, 4, 0), );


-- 예약 테이블 : 예약번호(pk, 시퀀스), 예약분야, 예약내용, 결제번호(fk), 예약일정번호(fk)
-- 결제번호 미정!! 
CREATE TABLE Wanna_Reserve (
	wr_num varchar2(50) PRIMARY KEY,
	wr_kind char(1) CHECK(wr_kind IN (1, 2)) NOT NULL,
	wr_content varchar2(300),
	str varchar2(50),
	wrs_num varchar2(50)
);


CREATE SEQUENCE Wanna_Reserve_seq (
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
);


inset INTO Wanna_Reserve values("wr"||lpad(wanna_Reserve_seq.nextval, 4, 0), );


-- 예약일정 테이블 : 예약일정번호(pk, 시퀀스), 예약명, 예약날짜, 예약진행단계, 아이디(fk)
CREATE TABLE Wanna_Reserve_Schedule (
	wrs_num varchar2(50) PRIMARY KEY,
	wrs_title varchar2(50) not null,
	wrs_date DATE not null, 
	wrs_step varchar2(50) not null,
	wm_id varchar2(50)
);


CREATE SEQUENCE Wanna_Reserve_Schedule_seq (
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
);


/* --------------------------- ( 사용테이블 조회 ) -------------------------------------------------- */

SELECT * FROM Wanna_Member;

SELECT * FROM Wanna_Member 
WHERE wm_id = 'himan01' 
AND wm_pass = 'as7777';

SELECT * FROM Wanna_Member 
WHERE wm_id = ? 
AND wm_pass = ?;








/* --------------------------- ( 기타테이블 생성 ) ------------------------------------------------ */


-- 회원구분 테이블(참고) : 회원구분번호(pk), 회원구분 
CREATE TABLE Wanna_Member_Group (
	wm_usrGroup NUMBER PRIMARY KEY,
	wm_usrGroup_Title varchar2(50) not null
);


-- 운동분야 테이블 : 아이디(pk, 식별), 운동분야번호
CREATE TABLE Wanna_Sports (
	wm_id varchar2(50) PRIMARY KEY,
	ws_num NUMBER
);


-- 운동분야구분 테이블(참고) : 운동분야번호(pk), 운동분야명
CREATE TABLE Wanna_Sport_Group (
	ws_num NUMBER PRIMARY KEY,
	ws_Title varchar2(50) not null
);


-- 사업자정보 테이블 : 사업자번호(pk, 시퀀스), 사업자등록번호, 사업자등록명, 사업자등록증경로
CREATE TABLE Wanna_busPerson (
	wb_num varchar2(50) PRIMARY KEY,
	wb_regNum varchar2(50),
	wb_regTitle varchar2(50),
	wb_regPath varchar2(50)
);


CREATE SEQUENCE Wanna_busPerson_seq (
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
);


-- 문의 테이블 : 문의번호(pk, 시퀀스), 문의종류, 문의내용, 작성일, 처리상태, 공개여부, 답변내용, 아이디(fk)
CREATE TABLE Wanna_Query (
	wq_num varchar2(50) PRIMARY KEY,
	wq_kind varchar2(50),
	wq_content varchar2(500),
	wq_date DATE,
	wq_step varchar2(50),
	wq_isOpen NUMBER check (wq_isOpen in (0, 1)),
	wq_reContent varchar2(500),
	wm_id varchar2(50)
);


CREATE SEQUENCE Wanna_Query_seq (
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
);