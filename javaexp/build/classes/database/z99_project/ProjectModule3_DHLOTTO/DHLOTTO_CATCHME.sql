-- CHACHME 게임에서 입력 한 복권 정보를 테이블에 도출

CREATE TABLE CATCHME (
	date1 varchar2(100),
	multiple varchar2(100),
	tot varchar2(100),
	myLotto varchar2(100),
	ltresult_1 varchar2(1000),
	ltresult_2 varchar2(1000)
);

INSERT INTO CATCHME VALUES ('5', '1', '500', '1, 2, 3, 4, 5, 6', '꽝 (0)', '0');
INSERT INTO CATCHME VALUES ('4', '2', '1000', '9, 7, 4, 2, 10, 1', '꽝 (0)', '0');
INSERT INTO CATCHME VALUES ('3', '3', '1500', '11, 5, 2, 8, 3, 7', '당첨 (600)', '1800');
INSERT INTO CATCHME VALUES ('2', '4', '2000', '4, 8, 1, 10, 9, 2', '꽝 (0)', '0');
INSERT INTO CATCHME VALUES ('1', '5', '2500', '7, 5, 3, 1, 11, 9', '꽝 (0)', '0');
SELECT date1 "회차", multiple "선택 배수", tot "총 가격", myLotto "선택 창문 번호", ltresult_1 "결과 금액 (단위:만원)", ltresult_2 "최종 금액 (단위:만원)"
FROM CATCHME;

-- 당첨 여부 검색 (검색 내용 : 당첨된 선택 창문 번호의 '선택 배수' 검색)
SELECT date1 "회차", multiple "선택 배수", tot "총 가격", myLotto "선택 창문 번호",
		ltresult_1 "결과 금액 (단위:만원)", ltresult_2 "최종 금액 (단위:만원)"
FROM CATCHME
WHERE multiple LIKE '%3%';