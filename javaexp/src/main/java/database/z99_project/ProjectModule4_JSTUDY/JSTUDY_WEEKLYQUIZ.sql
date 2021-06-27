-- LOTTO645 입력 한 복권 정보를 테이블에 도출

CREATE TABLE LOTTO645 (
	date1 varchar2(100),
	date2 varchar2(100),
	myLotto varchar2(100),
	myLotto_bn varchar2(100)
);

INSERT INTO LOTTO645 VALUES ('967','20210612','1, 4, 10, 25, 32, 15','11');
INSERT INTO LOTTO645 VALUES ('966','20210605','11, 4, 14, 21, 36, 9','1');
INSERT INTO LOTTO645 VALUES ('965','20210529','19, 7, 13, 25, 32, 15','37');
INSERT INTO LOTTO645 VALUES ('964','20210522','29, 35, 10, 16, 32, 15','21');
INSERT INTO LOTTO645 VALUES ('963','20210515','34, 2, 11, 29, 32, 15','45');
INSERT INTO LOTTO645 VALUES ('962','20210508','15, 33, 11, 25, 22, 15','14');
INSERT INTO LOTTO645 VALUES ('961','20210501','36, 9, 10, 25, 42, 14','12');
INSERT INTO LOTTO645 VALUES ('960','20210424','45, 4, 10, 21, 44, 15','23');
SELECT date1 "회차", date2 "날짜", myLotto "복권번호", myLotto_bn "보너스번호"
FROM LOTTO645;


-- 복권 입력 여부 검색 (검색 내용 : '961'회 복권 입력 정보 또는 복권번호 '25'가 들어간 복권 입력 정보)
SELECT date1 "회차", date2 "날짜", myLotto "복권번호", myLotto_bn "보너스번호"
FROM LOTTO645
WHERE date1 LIKE '%961%' OR myLotto LIKE '%25%';