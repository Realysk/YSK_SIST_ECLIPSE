-- ============================================================================================================================================================================================================ --
-- 소모임(그룹핏) 테이블
DROP TABLE Wanna_Groupfit;
CREATE TABLE Wanna_Groupfit (
	gf_grpkey varchar2(50) PRIMARY KEY, -- 그룹핏 번호
	wm_id varchar2(50) CONSTRAINTS Wanna_Groupfit_wm_id_fk REFERENCES Wanna_Member(wm_id), -- 회원 ID (외래키)
	gf_name varchar2(100) NOT NULL, -- 그룹핏 이름
	gf_category varchar2(50) CHECK(gf_category IN ('친목', '헬스', '정보공유')), -- 유형
	gf_info varchar2(1000) NOT NULL, -- 그룹핏 소개
	gf_date DATE -- 소모임 생성일
--	gf_repCnt NUMBER -- 신고횟수
);
DROP SEQUENCE gf_grpkey;
CREATE SEQUENCE gf_grpkey
	INCREMENT BY 1   
	START WITH 1001
	MINVALUE 1001
	MAXVALUE 9999999;
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan01', '워너핏컴퍼니', '친목', '친목을 도모하고자 만들었습니다!', TO_DATE('2021-09-01','YYYY/MM/DD'));	
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan02', '건강청소년단', '헬스', '운동합시다!!', TO_DATE('2021-09-02','YYYY/MM/DD'));	
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan03', '헬스모임', '헬스', '운동합시다!!', TO_DATE('2021-09-03','YYYY/MM/DD'));	
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan04', '저스트두잇', '헬스', '일단해봅시다!!', TO_DATE('2021-09-04','YYYY/MM/DD'));	
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan05', 'NlKE', '친목', 'NlKE!!', TO_DATE('2021-09-05','YYYY/MM/DD'));	
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan06', '건강식모임', '정보공유', '팀 프로젝트!', TO_DATE('2021-09-06','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan07', '쌍용교육센터', '정보공유', '팀 프로젝트!', TO_DATE('2021-09-07','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan08', '삼성사성', '친목', '팀 프로젝트!', TO_DATE('2021-09-08','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan09', '근손실원정대', '헬스', '근손실이 일어나는 어디든 갑니다!', TO_DATE('2021-09-09','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan10', '진실게임', '친목', '진심만을 말하세요!', TO_DATE('2021-09-10','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan11', '건강식원정대', '정보공유', '건강이 우선입니다!', TO_DATE('2021-09-11','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan12', 'NULLS', '친목', '진심만을 말하세요!', TO_DATE('2021-09-12','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan13', 'NILLS', '정보공유', '진심만을 말하세요!', TO_DATE('2021-09-13','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan14', '마동석', '헬스', '진심만을 말하세요!', TO_DATE('2021-09-14','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan15', '진실게임', '친목', '진심만을 말하세요!', TO_DATE('2021-09-15','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan16', '진심게임', '정보공유', '진심만을 말하세요!', TO_DATE('2021-09-14','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'himan17', '거짓게임', '정보공유', '거짓만을 말하세요!', sysdate);

INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'daily03', '진짜사나이', '헬스', '이하생략', TO_DATE('2021-09-13','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'daily04', '가짜사나이', '헬스', '이하생략', TO_DATE('2021-09-12','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'daily05', '사나이진짜', '친목', '이하생략!', TO_DATE('2021-09-11','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'daily06', '사나이가짜', '정보공유', '이하생략', TO_DATE('2021-09-10','YYYY/MM/DD'));
INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), 'daily07', '살크업', '친목', '이하생략', sysdate);
SELECT * FROM Wanna_Groupfit ORDER BY gf_date DESC;
-- SELECT * FROM Wanna_Groupfit ORDER BY gf_date DESC -- 조회
-- INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), ?, ?, ?, ?, TO_DATE(?,'YYYY/MM/DD')) -- 전체 정보 등록
-- INSERT INTO Wanna_Groupfit (gf_grpkey, gf_name, gf_category, gf_info, gf_date) VALUES('GF'||(gf_grpkey.nextval), ?, ?, ?, sysdate) -- 그룹핏 정보 등록
INSERT INTO Wanna_Groupfit (gf_grpkey, gf_name, gf_category, gf_info, gf_date) VALUES('GF'||(gf_grpkey.nextval), '0907테스트그룹2', '정보공유', '0907테스트합니다!', sysdate);

UPDATE Wanna_Groupfit
	SET gf_name = '워너핏컴퍼니2',
		gf_category = '정보공유',
		gf_info = '수정된 공지사항 확인 부탁드려요~'
	WHERE wm_id = 'himan01';
/*
UPDATE Wanna_Groupfit
	SET gf_name = ?,
		gf_category = ?,
		gf_info = ?
	WHERE wm_id = ?
 */ -- 수정
DELETE FROM Wanna_Groupfit WHERE wm_id = 'test0916';
-- DELETE FROM Wanna_Groupfit WHERE wm_id = ? -- 삭제

-- 그룹핏 이름과 닉네임을 통해 그룹핏 정보 검색 (회원정보, 그룹핏정보를 회원ID로 join)
SELECT gf.gf_name, gf.gf_category, wm.wm_id, gf.gf_date
FROM Wanna_Member wm, Wanna_Groupfit gf
WHERE wm.wm_id = gf.wm_id
AND gf.gf_name LIKE '%'||''||'%'
AND wm.wm_id LIKE '%'||'h'||'%'
ORDER BY gf.gf_date DESC;

SELECT gf.gf_name, gf.gf_category, wm.wm_id, gf.gf_date
FROM Wanna_Member wm, Wanna_Groupfit gf
WHERE wm.wm_id = gf.wm_id
AND gf.gf_name = '워너핏컴퍼니'
AND wm.wm_id = 'himan01'
ORDER BY gf.gf_date DESC;

/*
SELECT gf.gf_name, gf.gf_category, wm.wm_id, gf.gf_date
FROM Wanna_Member wm, Wanna_Groupfit gf
WHERE wm.wm_id = gf.wm_id
AND gf.gf_name LIKE '%'||?||'%'
AND wm.wm_id LIKE '%'||?||'%'
ORDER BY gf.gf_date DESC

SELECT gf.gf_name, gf.gf_category, wm.wm_id, gf.gf_date
FROM Wanna_Member wm, Wanna_Groupfit gf
WHERE wm.wm_id = gf.wm_id
AND gf.gf_name = ?
AND wm.wm_id = ?
ORDER BY gf.gf_date DESC
 */

-- 회원 ID를 통해 그룹핏 가입 (그룹핏정보를 회원ID로 join)
SELECT gf.gf_grpkey, gf.gf_name, gf.gf_category, gf.gf_info, gf.gf_date
FROM Wanna_Member wm, Wanna_Groupfit gf
WHERE wm.wm_id = gf.wm_id
AND wm.wm_id = 'himan01';

-- ============================================================================================================================================================================================================ --

-- 아래부터는 그룹핏DB가 아니고 회원정보 수정 및 탈퇴로 인해서 참고용으로 적어뒀어요!

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
	wm_usrGroup varchar2(30) NOT NULL CHECK(wm_usrGroup IN (0, 100, 200, 300, 400)), 
	wm_repCnt NUMBER NOT NULL, 
	wm_imgSrc varchar2(50),
	wb_num varchar2(50)
);

-- 회원 필수 정보 : 아이디(pk), 패스, 이메일, 닉네임, 번호, 회원구분, 신고횟수, 프로필이미지, 사업자정보번호(fk)
INSERT INTO Wanna_Member values('himan01', 'as7777', 'himan01@gmail.com', '홍길동', 01012341234, 100, 0, '/mem01.png', null);
INSERT INTO Wanna_Member values('himan02', 'as7778', 'himan02@gmail.com', '김길동', 01012341235, 100, 1, '/mem02.png', null);
INSERT INTO Wanna_Member values('himan03', 'as7779', 'himan03@gmail.com', '이길동', 01012341236, 100, 2, '/mem03.png', null);
INSERT INTO Wanna_Member values('himan04', 'as7780', 'himan04@gmail.com', '박길동', 01012341237, 100, 3, null, null);
INSERT INTO Wanna_Member values('himan05', 'as7781', 'himan05@gmail.com', '유길동', 01012341238, 100, 1, '/mem05.png', null);
INSERT INTO Wanna_Member values('himan06', 'as7782', 'himan06@gmail.com', '온길동', 01012341239, 100, 2, '/mem06.png', null);
INSERT INTO Wanna_Member values('himan07', 'as7783', 'himan07@gmail.com', '사길동', 01012341240, 100, 3, '/mem07.png', null);
INSERT INTO Wanna_Member values('himan08', 'as7784', 'himan08@gmail.com', '가길동', 01012341241, 100, 4, '/mem08.png', null);
INSERT INTO Wanna_Member values('himan09', 'as7785', 'himan09@gmail.com', '나길동', 01012341242, 100, 5, null, null);
INSERT INTO Wanna_Member values('himan10', 'as7786', 'himan10@gmail.com', '다길동', 01012341243, 100, 1, '/mem10.png', null);
INSERT INTO Wanna_Member values('himan11', 'as7787', 'himan11@gmail.com', '라길동', 01012341244, 100, 1, '/mem11.png', null);
INSERT INTO Wanna_Member values('himan12', 'as7788', 'himan12@gmail.com', '마길동', 01012341245, 100, 2, '/mem12.png', null);
INSERT INTO Wanna_Member values('himan13', 'as7789', 'himan13@gmail.com', '바길동', 01012341246, 100, 4, '/mem13.png', null);
INSERT INTO Wanna_Member values('himan14', 'as7790', 'himan14@gmail.com', '아길동', 01012341247, 100, 0, '/mem14.png', null);
INSERT INTO Wanna_Member values('himan15', 'as7791', 'himan15@gmail.com', '자길동', 01012341248, 100, 0, '/mem15.png', null);
INSERT INTO Wanna_Member values('himan16', 'as7792', 'himan16@gmail.com', '차길동', 01012341249, 100, 0, '/mem16.png', null);
INSERT INTO Wanna_Member values('himan17', 'as7793', 'himan17@gmail.com', '파길동', 01012341250, 100, 1, '/mem17.png', null);

INSERT INTO Wanna_Member values('daily03', 'wedaily1', 'daily03@hanmail.net', '데일리1', 01011111111, 200, 0, '/image301.png', null);
INSERT INTO Wanna_Member values('daily04', 'wedaily2', 'daily04@hanmail.net', '데일리2', 01011111112, 200, 1, '/image302.png', null);
INSERT INTO Wanna_Member values('daily05', 'wedaily3', 'daily05@hanmail.net', '데일리3', 01011111113, 200, 2, '/image303.png', null);
INSERT INTO Wanna_Member values('daily06', 'wedaily4', 'daily06@hanmail.net', '데일리4', 01011111114, 200, 3, '/image304.png', null);
INSERT INTO Wanna_Member values('daily07', 'wedaily5', 'daily07@hanmail.net', '데일리5', 01011111115, 200, 4, '/image305.png', null);
INSERT INTO Wanna_Member values('daily08', 'wedaily6', 'daily08@hanmail.net', '데일리6', 01011111116, 200, 1, '/image306.png', null);
INSERT INTO Wanna_Member values('daily09', 'wedaily7', 'daily09@hanmail.net', '데일리7', 01011111117, 200, 1, '/image307.png', null);
INSERT INTO Wanna_Member values('daily10', 'wedaily8', 'daily10@hanmail.net', '데일리8', 01011111118, 200, 2, '/image308.png', null);
INSERT INTO Wanna_Member values('daily11', 'wedaily9', 'daily11@hanmail.net', '데일리9', 01011111119, 200, 2, '/image309.png', null);
INSERT INTO Wanna_Member values('daily12', 'wedaily10', 'daily12@hanmail.net', '데일리10', 01011111110, 200, 9, '/image310.png', null);

INSERT INTO Wanna_Member values('cookie01', 'ck9999', 'cookie01@gmail.com', '용감한맛쿠키1', 01082829999, 300, 1, '/image401.png', null);
INSERT INTO Wanna_Member values('cookie02', 'ck9998', 'cookie02@gmail.com', '용감한맛쿠키2', 01082829998, 300, 2, '/image402.png', null);
INSERT INTO Wanna_Member values('cookie03', 'ck9997', 'cookie03@gmail.com', '용감한맛쿠키3', 01082829997, 300, 3, '/image403.png', null);
INSERT INTO Wanna_Member values('cookie04', 'ck9996', 'cookie04@gmail.com', '용감한맛쿠키4', 01082829996, 300, 4, '/image404.png', null);
INSERT INTO Wanna_Member values('cookie05', 'ck9995', 'cookie05@gmail.com', '용감한맛쿠키5', 01082829995, 300, 5, '/image405.png', null);
INSERT INTO Wanna_Member values('cookie06', 'ck9994', 'cookie06@gmail.com', '용감한맛쿠키6', 01082829994, 300, 6, '/image406.png', null);
INSERT INTO Wanna_Member values('cookie07', 'ck9993', 'cookie07@gmail.com', '용감한맛쿠키7', 01082829993, 300, 7, '/image407.png', null);
INSERT INTO Wanna_Member values('cookie08', 'ck9992', 'cookie08@gmail.com', '용감한맛쿠키8', 01082829992, 300, 8, '/image408.png', null);
INSERT INTO Wanna_Member values('cookie09', 'ck9991', 'cookie09@gmail.com', '용감한맛쿠키9', 01082829991, 300, 9, '/image409.png', null);

INSERT INTO Wanna_Member values('himan17', 'as7793', 'himan17@gmail.com', '파길동', 01012341250, 400, 1, '/mem17.png', null);

INSERT INTO Wanna_Member values('heygirl01', 'cv0000', 'hey3333@naver.com', '에보시', 0103334444, 0, 0, null, null);
INSERT INTO Wanna_Member values('heygirl02', 'cv0000', 'hey3322@naver.com', '에보스', 0103334422, 0, 0, null, null);

INSERT INTO Wanna_Member values('test0910', 'test0910', 'test0910@gmail.com', '0910테스트', 01009100910, 0, 0, null, null);

SELECT * FROM Wanna_Member;

SELECT wm_id, wm_pass, wm_email, wm_nick, wm_tel
FROM Wanna_Member
WHERE wm_id = 'test0910';

/*
 SELECT wm_id, wm_pass, wm_email, wm_nick, wm_tel FROM Wanna_Member WHERE wm_id = ?
 */

-- 일반 회원 테이블 : 회원 정보 중 선택사항
CREATE TABLE Wanna_Mem_Com (
	wm_id varchar2(50) PRIMARY KEY,
	wm_gender char(1) check(wm_gender IN ('M', 'W')),
	wm_age NUMBER check(wm_age IN (10, 20, 30, 40, 50)),
	wm_sports NUMBER check(wm_sports IN (0, 1)),
	wm_result varchar2(1000)
);

INSERT INTO Wanna_Mem_Com VALUES('himan01', 'M', 20, 1, NULL);
INSERT INTO Wanna_Mem_Com VALUES('himan02', 'M', 10, NULL, NULL);
INSERT INTO Wanna_Mem_Com VALUES('himan03', 'W', 30, 1, '관심있어서 가입했어요~');
INSERT INTO Wanna_Mem_Com VALUES('himan04', 'W', 40, NULL, '그냥요~');
INSERT INTO Wanna_Mem_Com VALUES('himan05', 'M', 50, 1, NULL);
INSERT INTO Wanna_Mem_Com VALUES('himan06', 'M', 40, 1, '그러게요~');
INSERT INTO Wanna_Mem_Com VALUES('himan07', 'W', 20, NULL, '저랑 어울리는 곳입니다!');
INSERT INTO Wanna_Mem_Com VALUES('himan08', 'W', 10, 1, NULL);
INSERT INTO Wanna_Mem_Com VALUES('himan09', 'M', 10, 0, '?');
INSERT INTO Wanna_Mem_Com VALUES('himan10', 'M', 30, NULL, NULL);
INSERT INTO Wanna_Mem_Com VALUES('test0910', 'M', 20, NULL, NULL);

SELECT * FROM Wanna_Mem_Com;


-- 회원 필수정보와 선택정보를 join하여 회원정보 조회 (회원 필수정보, 선택정보를 회원ID로 join)
SELECT wm.wm_id, wm.wm_pass, wm.wm_email, wm.wm_nick, wm.wm_tel, mc.wm_gender, mc.wm_age, mc.wm_sports, mc.wm_result
FROM Wanna_Member wm, Wanna_Mem_Com mc
WHERE wm.wm_id = mc.wm_id;

-- Join-Update 가 어려워서 필수정보만 할께요ㅜㅜ
UPDATE Wanna_Member
	SET wm_pass = 'test09102',
		wm_email = 'test0910@naver.com',
		wm_nick = '테스트(수정)',
		wm_tel = 01092929393
	WHERE wm_id = 'test0910';

/*
UPDATE Wanna_Member
	SET wm_pass = ?,
		wm_email = ?,
		wm_nick = ?,
		wm_tel = ?
	WHERE wm_id = ?
 */ -- 수정

DELETE FROM Wanna_Member WHERE wm_id = 'test0915';

-- DELETE FROM Wanna_Member WHERE wm_id = ? // 삭제