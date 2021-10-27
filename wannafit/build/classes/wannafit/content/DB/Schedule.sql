Drop TABLE Schedule01;

CREATE TABLE Schedule01 (
SNum varchar2(300),
title varchar2(300),
work1 varchar2(300),
work2 varchar2(300),
work3 varchar2(300),
work4 varchar2(300),
DATE01 varchar2(300),
COMMENT01 varchar2(300)
);

SELECT * FROM Schedule01;

INSERT INTO Schedule01 VALUES ('1','팀회의1','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/1','다음회의시간은 5시');
INSERT INTO Schedule01 VALUES ('2','팀회의2','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/2','다음회의시간은 6시');
INSERT INTO Schedule01 VALUES ('3','팀회의3','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/3','다음회의시간은 2시');
INSERT INTO Schedule01 VALUES ('4','팀회의4','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/4','다음회의시간은 1시');
INSERT INTO Schedule01 VALUES ('5','팀회의5','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/5','다음회의시간은 6시');
INSERT INTO Schedule01 VALUES ('6','팀회의6','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/6','다음회의시간은 6시');
INSERT INTO Schedule01 VALUES ('7','팀회의7','프로젝트지속논의','워크플로우논의','수업논의','다음회의시간','2021/08/7','다음회의시간은 7시');

SELECT *FROM Schedule01 WHERE SNum= '1';