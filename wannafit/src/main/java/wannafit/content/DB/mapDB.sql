/*
 맵핏 페이지의 헬스장 주소 관련 데이터 DB
 */

drop table Wanna_mapfit;
drop table mapfit;

-- 맵핏 테이블 삭제

create table Wanna_mapfit(	
	fc_mapName varchar2(50) primary key, -- 헬스장 이름
	fc_mapLoc varchar2(100), --헬스장 위치
	fc_mapIntroduction varchar2(300), -- 헬스장 소개
	fc_mapTrainer varchar2(100)-- 트레이너
);


INSERT INTO Wanna_mapfit values ('쌍용헬스장','서울특별시 동작구','건강을 위한 헬스장', '홍길동, 김길동');
INSERT INTO Wanna_mapfit values ('청룡헬스장','부산광역시 강서구','튼튼 건강! 기구 완비! ', '김해운대, 이사상');
INSERT INTO Wanna_mapfit values ('크로스핏 헬스장','서울특별시 강남구','크로스핏 운동을 위한 최고의 헬스장', '서남, 운남');
INSERT INTO Wanna_mapfit values ('이너 피트니스','서울특별시 강남구','1:1 맞춤 코칭 피트니스 전문 이너 피트니스', '윤오, 소영');


SELECT * FROM Wanna_mapfit;
SELECT * 
FROM Wanna_mapfit;