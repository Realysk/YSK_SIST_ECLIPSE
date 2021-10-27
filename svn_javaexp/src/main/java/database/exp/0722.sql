/*
--1. 함수종속성개념을 완전함수종속성, 부분함수종속성, 이행적함수종속성으로 나누어 기술하세요.
	완전함수종속성 : 종속자가 기본키에만 종속되고, 구성하는 모든 속성이 기본키의 부분집합에
		종속되는 경우.
		ex) 이벤트,고객아이디 -> 이벤트당첨여부
	부분함수종속성 : 종속자가 다른 속성 혹은 키본키가 여러개인 경우 특정 기본키에 종속되는 경우
		ex) 이벤트,고객아이디 -> 고객명

--2. 정규화의 개념을 기술하세요.
	함수 종속성을 이용해 릴레이션(테이블)을 연관성이 있는 속성들로만 구성되도록
	분해해서, 이상 현상이 발생하지 않는 올바른 릴레이션(테이블)로 만들어 가능 과정..

--3. 제1정규화, 제2정규화, 제3정규화, 보이스코드 정규화의 개념을 기술하세요.
	제1정규화 : 데이터가 원자성을 가지도록 처리. 복수의 속성값을 갖는 속성을 분리
	제2정규화 : 주식별자(primary key)에 종속적이지 않는 속성을 분리하는 것으로
		완전함수종속성이외에 부분함수종속성이나 종속적이지 않는 속성을 분리하는 것을 말한다.
	제3정규화 : 속성이 종속적인 속성의 분리로 함수종속에서 다시 함수종속적인 속성의 분리로
		이전(이행)함수종속을 분리하는 것을 말한다.
	BCNF정규화 : 다수의 주식별자 분리
	제4정규화 : 다가 종속 속성분리
	제5정규화 : 결합종속일 경우는 두개 이상의 N개로 분리한다.

--4. 식별자와 비식별자의 차이를 ERD 구성을 하여 기술하세요.
	식별자 : 해당 주키과 연관관계 테이블의 키로 설정할 때를 말한다.
	비식별자 : 해당 주키르 연관관계 테이블의 키가 아닌 속성으로 설정할 때를 말한다. 

*/
--5. 아래와 같은 제2정규화가 끝난 릴레이션을 제3정규화를 처리하세요(ERD 및  sql 테이블 구성)
--    학생명   점수   등급  최소  최대
--    홍길동   90    A    90   100
--    김길동   80    B    80    89
--    마길동   80    B    80    89
--    신길동   70    D    70    79
--    오길동   55    F     0    59
CREATE TABLE ptgrade(
	grade char(1),
	minval NUMBER,
	maxval number
);
INSERT INTO ptgrade values('A',90,100);
INSERT INTO ptgrade values('B',80,89);
INSERT INTO ptgrade values('C',70,79);
INSERT INTO ptgrade values('D',60,69);
INSERT INTO ptgrade values('F',0,59);
SELECT * FROM ptgrade;
CREATE TABLE record(
	name varchar2(50),
	point number
);
INSERT INTO RECORD values('홍길동',90);
INSERT INTO RECORD values('김길동',80);
INSERT INTO RECORD values('마길동',80);
INSERT INTO RECORD values('신길동',70);
INSERT INTO RECORD values('오길동',55);
SELECT * FROM RECORD;

SELECT a.*,grade,minval, maxval
FROM RECORD a, ptgrade b
WHERE point BETWEEN minval AND maxval; 







--6. 3정규화가 끝난 릴레이션을 BCNF정규화를 처리하세요.(ERD 및 sql 테이블 구성)
--    학생번호  담당교수번호  과목명
--    S001    T001       컴퓨터공학
--    S002    T001       데이터베이스개론
--    S003    T002       알고리즘개론
--    S004    T001       컴퓨터공학
CREATE TABLE bcnf_01(
	stno char(4),
	thno char(4)
);
INSERT INTO bcnf_01 values('S001', 'T001');
INSERT INTO bcnf_01 values('S002', 'T001');
INSERT INTO bcnf_01 values('S003', 'T002');
INSERT INTO bcnf_01 values('S004', 'T001');
INSERT INTO bcnf_02 values('T001','컴퓨터공학');
INSERT INTO bcnf_02 values('T001','데이터베이스개론');
INSERT INTO bcnf_02 values('T002','알고리즘개론');
CREATE TABLE bcnf_02(
	thno char(4),
	subject varchar2(50)
);
SELECT * FROM bcnf_01;
SELECT * FROM bcnf_02;
SELECT a.*
FROM bcnf_01 a, bcnf_02 b
WHERE a.thno = b.thno;


