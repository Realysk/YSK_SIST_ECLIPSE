
DROP TABLE Wanna_Member;

-- 테이블 컬럼명 변경
ALTER TABLE wanna_Member RENAME COLUMN wm_excuse TO wm_result;



/* --------------------------- ( 사용테이블 생성 ) ------------------------------------------------ */



-- 회원테이블
-- 필수정보 : 회원아이디, 비밀번호, 이메일, 핸드폰번호, 회원구분, 신고횟수, 프로필이미지, 사업자번호(fk)
-- 선택정보(일반회원 테이블과 조인) : 아이디, 성별, 연령대, 운동분야, 가입이유
CREATE TABLE Wanna_Member (
	wm_id varchar2(50) PRIMARY KEY, 
	wm_pass varchar2(50) NOT NULL,
	wm_email varchar2(50) NOT NULL,
	wm_nick varchar2(50) NOT NULL,
	wm_tel varchar2(30) NOT NULL,
	wm_usrGroup varchar2(30) not null check(wm_usrGroup IN (0, 100, 200, 300, 400)), 
	wm_repCnt NUMBER NOT NULL, 
	wm_imgSrc varchar2(50),
	wb_num varchar2(50)
);

-- 일반 회원 테이블 : 회원 정보 중 선택사항
CREATE TABLE Wanna_Mem_Com (
	wm_id varchar2(50) PRIMARY KEY,
	wm_gender char(1) check(wm_gender IN ('M', 'W')),
	wm_age NUMBER check(wm_age IN (10, 20, 30, 40, 50)),
	wm_sports NUMBER check(wm_sports IN (1, 2, 3)),
	wm_result varchar2(50)
);	

SELECT * FROM Wanna_Member;
SELECT * FROM Wanna_Mem_Com;


DROP TABLE Wanna_Mem_Com;

-- 회원 필수 정보 : 아이디(pk), 패스, 이메일, 닉네임, 번호, 회원구분, 신고횟수, 프로필이미지, 사업자정보번호(fk)
-- 일반회원
INSERT INTO Wanna_Member values('himan01', 'as7777', 'himan01@gmail.com', '홍길동', '01012341234', 100, 0, '/mem01.png', null);
INSERT INTO Wanna_Member values('himan02', 'as7778', 'himan02@gmail.com', '김길동', '01012341235', 100, 1, '/mem02.png', null);
INSERT INTO Wanna_Member values('himan03', 'as7779', 'himan03@gmail.com', '이길동', '01012341236', 100, 2, '/mem03.png', null);
INSERT INTO Wanna_Member values('himan04', 'as7780', 'himan04@gmail.com', '박길동', '01012341237', 100, 3, null, null);
INSERT INTO Wanna_Member values('himan05', 'as7781', 'himan05@gmail.com', '유길동', '01012341238', 100, 1, '/mem05.png', null);
INSERT INTO Wanna_Member values('himan06', 'as7782', 'himan06@gmail.com', '온길동', '01012341239', 100, 2, '/mem06.png', null);
INSERT INTO Wanna_Member values('himan07', 'as7783', 'himan07@gmail.com', '사길동', '01012341240', 100, 3, '/mem07.png', null);
INSERT INTO Wanna_Member values('himan08', 'as7784', 'himan08@gmail.com', '가길동', '01012341241', 100, 4, '/mem08.png', null);
INSERT INTO Wanna_Member values('himan09', 'as7785', 'himan09@gmail.com', '나길동', '01012341242', 100, 5, null, null);
INSERT INTO Wanna_Member values('himan10', 'as7786', 'himan10@gmail.com', '다길동', '01012341243', 100, 1, '/mem10.png', null);
INSERT INTO Wanna_Member values('himan11', 'as7787', 'himan11@gmail.com', '라길동', '01012341244', 100, 1, '/mem11.png', null);
INSERT INTO Wanna_Member values('himan12', 'as7788', 'himan12@gmail.com', '마길동', '01012341245', 100, 2, '/mem12.png', null);
INSERT INTO Wanna_Member values('himan13', 'as7789', 'himan13@gmail.com', '바길동', '01012341246', 100, 4, '/mem13.png', null);
INSERT INTO Wanna_Member values('himan14', 'as7790', 'himan14@gmail.com', '아길동', '01012341247', 100, 0, '/mem14.png', null);
INSERT INTO Wanna_Member values('himan15', 'as7791', 'himan15@gmail.com', '자길동', '01012341248', 100, 0, '/mem15.png', null);
INSERT INTO Wanna_Member values('himan16', 'as7792', 'himan16@gmail.com', '차길동', '01012341249', 100, 0, '/mem16.png', null);
INSERT INTO Wanna_Member values('himan17', 'as7793', 'himan17@gmail.com', '파길동', '01012341250', 100, 1, '/mem17.png', null);

-- 트레이너
INSERT INTO Wanna_Member values('daily03', 'wedaily1', 'daily03@hanmail.net', '데일리1', '01011111111', 200, 0, '/image301.png', null);
INSERT INTO Wanna_Member values('daily04', 'wedaily2', 'daily04@hanmail.net', '데일리2', '01011111112', 200, 1, '/image302.png', null);
INSERT INTO Wanna_Member values('daily05', 'wedaily3', 'daily05@hanmail.net', '데일리3', '01011111113', 200, 2, '/image303.png', null);
INSERT INTO Wanna_Member values('daily06', 'wedaily4', 'daily06@hanmail.net', '데일리4', '01011111114', 200, 3, '/image304.png', null);
INSERT INTO Wanna_Member values('daily07', 'wedaily5', 'daily07@hanmail.net', '데일리5', '01011111115', 200, 4, '/image305.png', null);
INSERT INTO Wanna_Member values('daily08', 'wedaily6', 'daily08@hanmail.net', '데일리6', '01011111116', 200, 1, '/image306.png', null);
INSERT INTO Wanna_Member values('daily09', 'wedaily7', 'daily09@hanmail.net', '데일리7', '01011111117', 200, 1, '/image307.png', null);
INSERT INTO Wanna_Member values('daily10', 'wedaily8', 'daily10@hanmail.net', '데일리8', '01011111118', 200, 2, '/image308.png', null);
INSERT INTO Wanna_Member values('daily11', 'wedaily9', 'daily11@hanmail.net', '데일리9', '01011111119', 200, 2, '/image309.png', null);
INSERT INTO Wanna_Member values('daily12', 'wedaily10', 'daily12@hanmail.net', '데일리10', '01011111110', 200, 9, '/image310.png', null);

-- 헬스장
INSERT INTO Wanna_Member values('cookie01', 'ck9999', 'cookie01@gmail.com', '용감한맛쿠키1', '01082829999', 300, 1, '/image401.png', null);
INSERT INTO Wanna_Member values('cookie02', 'ck9998', 'cookie02@gmail.com', '용감한맛쿠키2', '01082829998', 300, 2, '/image402.png', null);
INSERT INTO Wanna_Member values('cookie03', 'ck9997', 'cookie03@gmail.com', '용감한맛쿠키3', '01082829997', 300, 3, '/image403.png', null);
INSERT INTO Wanna_Member values('cookie04', 'ck9996', 'cookie04@gmail.com', '용감한맛쿠키4', '01082829996', 300, 4, '/image404.png', null);
INSERT INTO Wanna_Member values('cookie05', 'ck9995', 'cookie05@gmail.com', '용감한맛쿠키5', '01082829995', 300, 5, '/image405.png', null);
INSERT INTO Wanna_Member values('cookie06', 'ck9994', 'cookie06@gmail.com', '용감한맛쿠키6', '01082829994', 300, 6, '/image406.png', null);
INSERT INTO Wanna_Member values('cookie07', 'ck9993', 'cookie07@gmail.com', '용감한맛쿠키7', '01082829993', 300, 7, '/image407.png', null);
INSERT INTO Wanna_Member values('cookie08', 'ck9992', 'cookie08@gmail.com', '용감한맛쿠키8', '01082829992', 300, 8, '/image408.png', null);
INSERT INTO Wanna_Member values('cookie09', 'ck9991', 'cookie09@gmail.com', '용감한맛쿠키9', '01082829991', 300, 9, '/image409.png', null);

-- 기업
INSERT INTO Wanna_Member values('himan162', 'as57793', 'himan101@gmail.com', 'company1', '01012341259', 400, 1, '/com134.png', 1234-423-12-412);
INSERT INTO Wanna_Member values('himan163', 'as57794', 'himan102@gmail.com', 'company2', '01022341213', 400, 3, '/com134.png', 1234-423-12-512);
INSERT INTO Wanna_Member values('himan164', 'as57795', 'himan103@gmail.com', 'company3', '01032341254', 400, 1, '/com134.png', 1234-421-12-412);
INSERT INTO Wanna_Member values('himan165', 'as57796', 'himan104@gmail.com', 'company5', '01042341255', 400, 6, '/com134.png', 4234-423-12-412);
INSERT INTO Wanna_Member values('himan166', 'as57797', 'himan105@gmail.com', 'company6', '01052341256', 400, 1, '/com134.png', 1234-423-42-412);
INSERT INTO Wanna_Member values('himan167', 'as57798', 'himan106@gmail.com', 'company7', '01062341257', 400, 8, '/com134.png', 1234-423-32-412);

INSERT INTO Wanna_Member values('heygirl01', 'cv0000', 'hey3333@naver.com', '에보시', '0103334444', 0, 0, null, null);
INSERT INTO Wanna_Member values('heygirl02', 'cv0000', 'hey3322@naver.com', '에보스', '0103334422', 0, 0, null, null);

DELETE FROM Wanna_Member WHERE wm_usrGroup = 400;

-- 일반 회원 선택 정보 : 아이디(pk), 성별, 연령대, 운동분야유무, 가입이유
-- 가입이유(자세교정, 근력향상, 다이어트, 근력향상, 성장기어린이)
INSERT INTO Wanna_Mem_Com values('himan01', 'M', 30, 1, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan02', 'W', 20, 2, '자세교정');
INSERT INTO Wanna_Mem_Com values('himan03', 'M', 10, 2, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan04', 'M', 50, 3, '다이어트');
INSERT INTO Wanna_Mem_Com values('himan05', 'W', 30, 3, '자세교정');
INSERT INTO Wanna_Mem_Com values('himan06', 'W', 20, 2, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan07', 'W', 20, 1, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan08', 'M', 20, 3, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan09', 'W', 20, 3, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan10', 'M', 10, 2, '성장기어린이');
INSERT INTO Wanna_Mem_Com values('himan11', 'W', 10, 1, '성장기어린이');
INSERT INTO Wanna_Mem_Com values('himan12', 'M', 30, 1, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan13', 'M', 50, 2, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan14', 'M', 40, 1, '다이어트');
INSERT INTO Wanna_Mem_Com values('himan15', 'W', 30, 3, '근력향상');
INSERT INTO Wanna_Mem_Com values('himan16', 'W', 20, 3, '다이어트');
INSERT INTO Wanna_Mem_Com values('himan17', 'M', 30, 3, '근력향상');




SELECT * FROM Wanna_Member;

SELECT * FROM Wanna_Member a, Wanna_Mem_Com b 
WHERE a.wm_id = b.wm_id;


INSERT INTO Wanna_Member values(?, ?, ?, ?, ?, 100, 0, ?, null);

INSERT INTO Wanna_Mem_Com values(?, ?, ?, ?, ?);


DROP TABLE Wanna_Trainer;
-- 트레이너 테이블 (기본키:회원ID)
-- 아이디, 성별, 연령대, 주운동분야
CREATE TABLE Wanna_Trainer (
	wm_id varchar2(50) PRIMARY KEY,
	wt_gender char(1) check(wt_gender IN ('M', 'W')),
	wt_age NUMBER check(wt_age IN (10, 20, 30, 40, 50)),
	wt_sports NUMBER check(wt_sports IN (1, 2, 3)),
	wt_info varchar2(300)
);

insert INTO Wanna_Trainer values('daily03', 'M', 30, 1, '1:1 대화보다는 일방향 코치 피드백이 잘 맞으시는 분');
insert INTO Wanna_Trainer values('daily04', 'W', 20, 1, '부담 없는 가격으로 PT를 받고 싶은 분');
insert INTO Wanna_Trainer values('daily05', 'W', 20, 2, '자기 주도적으로 습관 바꾸실 분');
insert INTO Wanna_Trainer values('daily06', 'W', 20, 3, '1:1 대화로 확실하게 관리하고 싶은 분');
insert INTO Wanna_Trainer values('daily07', 'M', 50, 3, '동기부여까지 도와주는 마인드 케어가 필요하신 분');
insert INTO Wanna_Trainer values('daily08', 'M', 40, 2, '내 상황에 맞게 조정된 운동을 원하시는 분');
insert INTO Wanna_Trainer values('daily09', 'M', 50, 1, '1:1 대화로 확실하게 관리하고 싶은 분');
insert INTO Wanna_Trainer values('daily10', 'W', 20, 1, '동기부여까지 도와주는 마인드 케어가 필요하신 분');
insert INTO Wanna_Trainer values('daily11', 'W', 30, 2, '1:1 대화보다는 일방향 코치 피드백이 잘 맞으시는 분');
insert INTO Wanna_Trainer values('daily12', 'M', 20, 1, '부담 없는 가격으로 PT를 받고 싶은 분');


SELECT * 
FROM Wanna_Member wm, Wanna_Trainer wt
WHERE wm.wm_id = wt.wm_id;

SELECT * 
FROM Wanna_Trainer wt;


-- 예약일정 테이블 : 예약일정번호(pk, 시퀀스), 예약명, 예약날짜, 예약진행단계, 아이디(fk)
-- 예약진행단계 : 예약대기 -> 예약완료 -> 방문완료
-- 예약명 : PT체험권, PT상담, 회원권상담
CREATE TABLE Wanna_Reserve_Schedule (
	wrs_num varchar2(50) PRIMARY KEY,
	wrs_title varchar2(50) not null,
	wrs_date DATE not null, 
	wrs_price NUMBER NOT NULL,
	wrs_step varchar2(50) not null,
	wm_id varchar2(50)
);


CREATE SEQUENCE Wanna_Reserve_Schedule_seq 
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;

DROP TABLE Wanna_Reserve_Schedule;
DROP SEQUENCE Wanna_Reserve_Schedule_seq;


SELECT * FROM Wanna_Reserve_Schedule;


INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-07 10:00', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-07 10:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-07 11:00', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-07 11:30', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-07 12:00', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-07 14:00', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권상담', to_date('2021-09-07 14:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권상담', to_date('2021-09-07 15:00', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily03');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권상담', to_date('2021-09-07 15:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily03');


INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 10:00', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 10:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 11:00', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 11:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 12:00', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT상담', to_date('2021-09-20 12:30', 'YYYY-MM-DD HH24:MI'), 0, '예약대기', 'daily04');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 13:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 13:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 14:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 15:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 16:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 'PT체험권', to_date('2021-09-20 17:15', 'YYYY-MM-DD HH24:MI'), 30000, '예약대기', 'daily05');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(1달)', to_date('2021-09-21 10:00', 'YYYY-MM-DD HH24:MI'), 120000, '예약대기', 'daily06');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(1달)', to_date('2021-09-21 10:30', 'YYYY-MM-DD HH24:MI'), 120000, '예약대기', 'daily06');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(1달)', to_date('2021-09-21 11:00', 'YYYY-MM-DD HH24:MI'), 120000, '예약대기', 'daily06');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(3달)', to_date('2021-09-21 11:30', 'YYYY-MM-DD HH24:MI'), 300000, '예약대기', 'daily06');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(3달)', to_date('2021-09-21 12:00', 'YYYY-MM-DD HH24:MI'), 300000, '예약대기', 'daily06');
INSERT INTO Wanna_Reserve_Schedule values('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), '회원권(3달)', to_date('2021-09-21 12:30', 'YYYY-MM-DD HH24:MI'), 300000, '예약대기', 'daily06');


-- 예약 테이블 : 예약번호(pk), 예약내용, 결제방법, 결제금액, 결제은행, 결제코드, 유효기간, 생년월일, 할부기간, 예약일정번호(fk, wrs_num), 아이디(fk, wm_id)
CREATE TABLE Wanna_Reserve (
	wr_num varchar2(50) PRIMARY KEY,
	wr_content varchar2(100), 
	wr_kind varchar2(30),
	wr_price NUMBER,
	wr_bank varchar2(50),
	wr_code varchar2(50),
	wr_expDate varchar2(50),
	wr_birth varchar2(50),
	wr_month NUMBER,
	wrs_num varchar2(50),
	wm_id varchar2(50)
);


CREATE SEQUENCE Wanna_Reserve_seq 
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;


DROP TABLE Wanna_Reserve;
DROP SEQUENCE Wanna_Reserve_seq;

INSERT INTO Wanna_Reserve values('wr'||lpad(wanna_Reserve_seq.nextval, 4, 0), '운동 처음입니다', 
	'카드', 30000, '하나은행', '1111-2222-3333-4444', '23/03', '990202',
	0, 'wrs0003', 'himan01');
INSERT INTO Wanna_Reserve values('wr'||lpad(wanna_Reserve_seq.nextval, 4, 0), '처음부터 차근차근 배우고 싶어요', 
	'카드', 30000, '국민은행', '1234-1234-1234-1234', '22/08', '980105',
	0, 'wrs0004', 'himan02');


SELECT * FROM Wanna_Reserve;


/* --------------------------- ( 사용테이블 조회 ) -------------------------------------------------- */

-- 로그인 정보
SELECT * FROM Wanna_Member wm, Wanna_Member_Group wmg
WHERE wm.wm_usrgroup = wmg.wm_usrgroup
AND wm_id = ? 
AND wm_pass = ?;

SELECT * FROM Wanna_Member wm, Wanna_Member_Group wmg
WHERE wm.wm_usrgroup = wmg.wm_usrgroup
AND wm_id = 'himan01' 
AND wm_pass = 'as7777';

SELECT * FROM Wanna_Member wm, Wanna_Member_Group wmg
WHERE wm.wm_usrgroup = wmg.wm_usrgroup
AND wm_id = 'spring01';

/*
Wanna_Reserve_Schedule
Wanna_Trainer
Wanna_Member

*/

-- 트레이너 조회
SELECT * 
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws
WHERE wm.wm_id = wt.wm_id
AND wt.wt_sports = ws.ws_num
AND wm.wm_nick LIKE '%'||'데' ||'%'
AND ws.ws_title LIKE '%'|| '' ||'%';


SELECT * 
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws
WHERE wm.wm_id = wt.wm_id
AND wt.wt_sports = ws.ws_num
AND wm.wm_nick LIKE '%' ||?||'%'
AND ws.ws_title LIKE '%'||?||'%';



-- 선택한 트레이너의 예약가능한 예약일정 조회
SELECT wm.wm_id, wm.wm_nick, wm.wm_tel, wm.wm_imgsrc, wt.wt_gender, 
	wt.wt_age, wt.wt_sports, wt.wt_info, wrs.wrs_num, wrs.wrs_title, 
	wrs.wrs_date, wrs.wrs_step
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Reserve_Schedule wrs
WHERE wm.wm_id = wt.wm_id
AND wt.wm_id = wrs.wm_id
AND wm_nick = '데일리1'
AND wrs.wrs_step = '예약대기'
LIMIT 0, 5;


SELECT wm.wm_id, wm.wm_nick, wm.wm_tel, wm.wm_imgsrc, wt.wt_gender, 
	wt.wt_age, wt.wt_sports, wt.wt_info, wrs.wrs_num, wrs.wrs_title, 
	wrs.wrs_date, wrs.wrs_step
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Reserve_Schedule wrs
WHERE wm.wm_id = wt.wm_id
AND wt.wm_id = wrs.wm_id
AND wm_nick = ?
AND wrs.wrs_step = '예약대기';



-- 회원정보 추출
-- 중복되지 않는 닉네임을 통해 id를 찾아서 회원정보 추출
SELECT wt.*
FROM Wanna_Trainer wt
WHERE wt.wm_id = (SELECT wm.wm_id
				FROM Wanna_Member wm 
				WHERE wm.wm_nick = ?);

			
-- 아이디로 트레이너 상세정보 출력하기
SELECT wm.wm_id, wm_nick, wm_tel, wm_imgSrc, wt_gender, wt_age, wt_info, ws_title
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws
WHERE wm.wm_id = wt.wm_id
AND wt.wt_sports = ws.ws_num
AND wm.wm_id = 'daily03';

SELECT wm.wm_id, wm_nick, wm_tel, wm_imgSrc, 
	wt_gender, wt_age, wt_info, ws_title
FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws
WHERE wm.wm_id = wt.wm_id
AND wt.wt_sports = ws.ws_num
AND wm.wm_id = ?;



-- 추출한 아이디로 예약내용 찾기
SELECT wrs_num, wrs_title, wrs_date, wrs_step
FROM Wanna_Reserve_Schedule 
WHERE wm_id = 'daily03'
AND wrs_step = '예약대기';


SELECT wrs_num, wrs_title, wrs_date, wrs_step
FROM Wanna_Reserve_Schedule 
WHERE wm_id = ?
AND wrs_step = '예약대기';


-- 날짜 시간 분리
SELECT wrs_num, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day,
	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_price, wrs_step, wm_id
FROM Wanna_Reserve_Schedule 
WHERE wm_id = 'daily03'
AND wrs_step = '예약대기';

SELECT wrs_num, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day,
	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_price, wrs_step, wm_id
FROM Wanna_Reserve_Schedule 
WHERE wm_id = ?
AND wrs_step = '예약대기';



-- 예약상세 : 입력한 예약명의 종류**************수정할것(상세에서 예약명 트레이너가 입력한게 뜨도록)
SELECT DISTINCT wrs_title
FROM Wanna_Reserve_Schedule
WHERE wm_id = 'daily03'
GROUP BY wrs_title;

SELECT DISTINCT wrs_title
FROM Wanna_Reserve_Schedule
WHERE wm_id = ?
GROUP BY wrs_title;


-- 예약 확인
SELECT * FROM Wanna_Reserve;

-- 예약 등록
INSERT INTO Wanna_Reserve values('wr'||lpad(wanna_Reserve_seq.nextval, 4, 0), '운동 처음입니다', 
	'카드', 30000, '하나은행', '1111-2222-3333-4444', '23/03', '990202',
	0, 'wrs0003', 'himan01');

INSERT INTO Wanna_Reserve values('wr'||lpad(wanna_Reserve_seq.nextval, 4, 0), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

-- 예약 등록시 예약단계 변경
UPDATE Wanna_Reserve_Schedule SET wrs_step = '예약완료' WHERE wrs_num = 'wrs0003';

UPDATE Wanna_Reserve_Schedule SET wrs_step = '예약완료' WHERE wrs_num = ?;

-- 예약/예약일정 확인
SELECT * FROM Wanna_Reserve;
SELECT * FROM Wanna_Reserve_Schedule;



-- 회원의 예약내역 확인 
SELECT *
FROM Wanna_Reserve wr, Wanna_Reserve_Schedule wrs
WHERE wr.wrs_num = wrs.wrs_num
and wr.wm_id = 'himan01';

SELECT *
FROM Wanna_Reserve
WHERE wm_id = ?;


-- 트레이너가 등록한 예약일정이 예약된 경우만 출력
SELECT wr.*, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day, 
	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_step
FROM Wanna_Reserve wr, Wanna_Reserve_Schedule wrs
WHERE wr.wrs_num = wrs.wrs_num
AND wrs.wm_id = 'daily03'
ORDER BY wr_num asc;

SELECT wr.*, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day, 
	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_step, wrs_date
FROM Wanna_Reserve wr, Wanna_Reserve_Schedule wrs
WHERE wr.wrs_num = wrs.wrs_num
AND wrs.wm_id = ?
ORDER BY wr_num asc;


-- 확인용
SELECT * FROM Wanna_Reserve_Schedule WHERE wm_id = 'daily03';
SELECT * FROM Wanna_Reserve;


-- 트레이너의 예약일정 확인
SELECT wrs_num, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day, 
	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_price, wrs_step, wm_id
FROM Wanna_Reserve_Schedule 
WHERE wm_id = 'daily03';

SELECT wrs_num, wrs_title, to_char(wrs_date, 'YYYY') wrs_year, 
	to_char(wrs_date, 'MM') wrs_mon, to_char(wrs_date, 'DD') wrs_nday, 
	to_char(wrs_date, 'HH24:MI') wrs_hour, to_char(wrs_date, 'MI') wrs_min, 
	wrs_price, wrs_step, wm_id
FROM Wanna_Reserve_Schedule 
WHERE wm_id = 'daily03';

SELECT wrs_num, wrs_title, to_char(wrs_date, 'YYYY') wrs_year, 
	to_char(wrs_date, 'MM') wrs_mon, to_char(wrs_date, 'DD') wrs_nday, 
	to_char(wrs_date, 'HH24:MI') wrs_hour, to_char(wrs_date, 'MI') wrs_min, 
	wrs_price, wrs_step, wm_id
FROM Wanna_Reserve_Schedule 
WHERE wm_id = ?;


-- 트레이너의 예약일정 등록/수정/삭제
INSERT INTO Wanna_Reserve_Schedule VALUES
('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 
'PT상담', to_date('2021-09-07 10:00', 'YYYY-MM-DD HH24:MI'), 
0, '예약대기', 'daily03');

INSERT INTO Wanna_Reserve_Schedule VALUES
('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), 
?, to_date(?, 'YYYY-MM-DD HH24:MI'), ?, '예약대기', ?);


-- 수정
UPDATE Wanna_Reserve_Schedule 
SET wrs_title = 'PT체험권', wrs_date = to_date('2021-9-22 16:00', 'YYYY-MM-DD HH24:MI'), wrs_price = 50000, wrs_step = '예약취소'
WHERE wrs_num = 'wrs0014'
AND wm_id = 'daily03';

UPDATE Wanna_Reserve_Schedule 
SET wrs_title = ?, wrs_date = to_date(?, 'YYYY-MM-DD HH24:MI'), 
wrs_price = ?, wrs_step = ? 
WHERE wrs_num = ? AND wm_id = ?;

-- 삭제
DELETE FROM Wanna_Reserve_Schedule 
WHERE wrs_num = ? AND wm_id = ?;

/* --------------------------- ( 기타테이블 생성 ) ------------------------------------------------ */

DROP TABLE Wanna_Member_Group;
-- 회원구분 테이블(참고) : 회원구분번호(pk), 회원구분 
CREATE TABLE Wanna_Member_Group (
	wm_usrGroup NUMBER PRIMARY KEY,
	wm_usrGroup_Title varchar2(50) not null
);

INSERT INTO Wanna_Member_Group values(0, '관리자');
INSERT INTO Wanna_Member_Group values(100, '일반회원');
INSERT INTO Wanna_Member_Group values(200, '트레이너');
INSERT INTO Wanna_Member_Group values(300, '헬스장');
INSERT INTO Wanna_Member_Group values(400, '기업');

SELECT * FROM Wanna_Member_Group;


-- 운동분야 테이블 : 아이디(pk, 식별), 운동분야번호 x
CREATE TABLE Wanna_Sports (
	wm_id varchar2(50) PRIMARY KEY,
	ws_num NUMBER
);

SELECT * FROM Wanna_Sports;
SELECT * FROM Wanna_Sport_Group;

-- 운동분야구분 테이블(참고) : 운동분야번호(pk), 운동분야명
CREATE TABLE Wanna_Sport_Group (
	ws_num NUMBER PRIMARY KEY,
	ws_Title varchar2(50) not null
);

INSERT INTO Wanna_Sport_Group values(1, '헬스');
INSERT INTO Wanna_Sport_Group values(2, '런데이');
INSERT INTO Wanna_Sport_Group values(3, '홈트');


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