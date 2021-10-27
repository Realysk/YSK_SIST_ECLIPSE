DROP TABLE Fitness_CenterDB;
drop table FC_DB;


-- 헬스장 db 삭제


--- 테이블 생성 [헬스장] / exerd에 있는 것 ---

create table Fitness_CenterDB (
	fc_id varchar2(50) primary key, -- 아이디
 	fc_fcName varchar2(50),			-- 헬스장 이름
	fc_introduction varchar2(200),	-- 헬스장 소개
 	fc_location varchar2(100),		-- 위치
	fc_hours date, 					-- 운영시간
 	fc_maximum number				-- 수용인원

);

--- 헬스장 회원 가입 시 사용하는 DB (구 HZ-01.jsp) ---

create table FC_DB(
	fc_id varchar2(50) primary key,	-- 아이디
 	fc_pass varchar2(50) NOT NULL,	-- 비밀번호
 	fc_fcName varchar2(50),			-- 헬스장 이름
 	fc_ownerName varchar2(50),		-- 대표자 이름
 	fc_phoneNumber number,			-- 연락처
 	fc_businessNumber number,		-- 사업자번호
 	fc_hours date,					-- 운영 시간
 	fc_introduction varchar2(200),	-- 헬스장 소개
	fc_maximum number,				-- 수용 인원
 	fc_location varchar2(100)		-- 헬스장 위치

);



--- Fitness_CenterDB 데이터 입력---

INSERT INTO Fitness_CenterDB values ('1234hong','쌍용헬스장','역삼역 인근 최고의 헬스장','서울 강남구 테헤란로 132', '2021-01-01 23:59:59',150);




--- FC_DB (구 HZ-01.jsp) 데이터 입력 ---

insert into FC_DB values ('sshong11','12341234','청룡헬스장','황청룡',01015157777,214-86-29070, '230701','안전제일! 건강한 운동을 지향하는 청룡헬스장', 50, '부산특별시 중구');