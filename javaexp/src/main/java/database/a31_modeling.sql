-- 식별자 관계
CREATE TABLE student001 (
	pcode char(8) PRIMARY KEY
);

CREATE TABLE registerlesson001 (
	scode char(8),
	pcode char(8) REFERENCES student001(pcode),
	PRIMARY KEY(scode, pcode)
);

CREATE TABLE student002 (
	pcode char(8) PRIMARY KEY
);

SELECT * FROM registerlesson001;

-- 비 식별자 관계
CREATE TABLE registerlesson002 (
	scode char(8) PRIMARY KEY,
	pcode char(8) REFERENCES student002(pcode)
);

SELECT * FROM registerlesson002;

DROP TABLE productex_0;
CREATE TABLE productex_0 (
	pcode number, -- 제품번호
	pname varchar2(100), -- 제품명
	rcnt number(30), -- 재고수량
	ordernum char(5), -- 주문번호
	isexport char(1), -- 수출여부
	memnum number, -- 고객번호
	busnum number, -- 사업자번호
	priority number, -- 우선순위
	ordercnt number -- 주문수량
);

INSERT INTO productex_0 VALUES(1001, '모니터', 1990, 'AB345', 'X', 4520, 398201, 1, 150);
INSERT INTO productex_0 VALUES(1001, '모니터', 1990, 'AD347', 'X', 2341, NULL, 3, 600);
INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'CA210', 'X', 3280, 200212, 8, 1200);
INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'AB345', 'X', 4520, 398201, 1, 300);
INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'CB230', 'X', 2341, 563892, 3, 6900);
INSERT INTO productex_0 VALUES(1201, '스피커', 2108, 'CB231', 'Y', 8320, NULL, 2, 80);

SELECT * FROM productex_0;

CREATE TABLE normal_product_1
AS SELECT DISTINCT pcode, pname, rcnt
FROM productex_0
ORDER BY pcode;
SELECT * FROM normal_product_1;

DROP TABLE normal_orderlist_1;
CREATE TABLE normal_orderlist_1
AS SELECT pcode, ordernum, isexport, memnum, busnum, priority, ordercnt
FROM productex_0;
SELECT * FROM normal_product_1;
-- 중복 속성이 분리되었으므로 제품코드 식별자를 가지는 단일한 row가 구성되었다.
SELECT * FROM normal_orderlist_1;
-- 중복되어 발생하는 속성을 분리하여 별도의 테이블로 구성되었다.
-- 제 1 정규화 : 복수의 속성값을 갖는 속성(원자성 위배)을 분리 처리
--		ex) 두 개의 컬럼 이상이 동일한 데이터를 가지면 제 1 정규화 원자성 위배 원칙으로 테이블을 분리 시킬 것을 고민헤야 한다.

CREATE TABLE normalform0(
	cus_id varchar(30),
	event_no varchar(100),
	is_checked varchar(50),
	grade varchar(30),
	discount NUMBER
);

INSERT INTO normalform0 VALUES('apple', 'E001,E005,E010', 'Y,N,Y', 'gold', 0.5);
INSERT INTO normalform0 VALUES('banana', 'E002', 'N,Y', 'vip', 0.2);
INSERT INTO normalform0 VALUES('carot', 'E003,E007', 'Y,Y', 'gold', 0.1);
INSERT INTO normalform0 VALUES('orange', 'E004', 'N', 'silver', 0.05);

SELECT * FROM normalform0;

-- ex) 위 테이블을 제 1정규화 과정을 거친 테이블로 만드세요.
DROP TABLE normalform1;

CREATE TABLE normalform1
AS SELECT * FROM normalform0 WHERE 1=0;
SELECT * FROM normalform1;

INSERT INTO normalform1 VALUES('apple', 'E001', 'Y', 'gold', 0.5);
INSERT INTO normalform1 VALUES('apple', 'E005', 'N', 'gold', 0.5);
INSERT INTO normalform1 VALUES('apple', 'E010', 'Y', 'gold', 0.5);
INSERT INTO normalform1 VALUES('banana', 'E002', 'N', 'vip', 0.2);
INSERT INTO normalform1 VALUES('banana', 'E005', 'N', 'vip', 0.2);
INSERT INTO normalform1 VALUES('carrot', 'E003', 'Y', 'gold', 0.1);
INSERT INTO normalform1 VALUES('carrot', 'E007', 'Y', 'gold', 0.1);
INSERT INTO normalform1 VALUES('orange', 'E004', 'N', 'silver', 0.05);

/*
 # 제 2 정규화
 	주 식별자에 종속되지 않는 속성의 분리, 부분 종속 속성을 분리한다.
 		1. 완전 함수 종속성 : 특정한 컬럼이 식별자 (1개, 여러개)가 있어야지 생성할 수 있는 것을 말한다.
 			ex) 이벤트 번호, 당첨자ID는 당첨여부가 종속적인 컬럼으로 완전 함수 종속성이 있다.
 		2. 부분 함수 종속성 : 특정한 컬럼이 식별자가 여러개(복합 키) 중에 하나의 컬럼에만 종속될 때를 말한다.
 			ps) 부분 함수 종속성 컬럼과 종속적이지 않는 컬럼은 테이블을 분리시켜야 한다.
 			ex) 이벤트 번호, 당첨자ID가 있고 당첨자이름이 있을 때 당첨자 이름은 당첨자ID에 부분 함수 종속적이다.
 		
 		function plus(num01, num02) {
 			return num01 + num02;
 		}
 		
 		plus(25,30); 결과값은 55
 		25와 30은 55라는 데이터에 함수 종속성을 갖고 있다.
 		함수 종속성이라는 것은 결정자에 함수적으로 종속 관계를 갖고 있다는 것을 의미한다.
 		ex) 이름, 출생지, 주소 === 주민번호 만드는 함수 => 주민번호
 			이름, 출생지, 주소는 주민번호에 종속성을 갖고 있다.
 */

-- ex) 해당 ERD 설계 후 SQL로 테이블을 만들고 데이터를 넣어주세요.

-- 주문목록 테이블 : 제 2 정규화 완료

/*
 DROP TABLE productex_0;
CREATE TABLE productex_0 (
	pcode number, -- 제품번호
	pname varchar2(100), -- 제품명
	rcnt number(30), -- 재고수량
	ordernum char(5), -- 주문번호
	isexport char(1), -- 수출여부
	memnum number, -- 고객번호
	busnum number, -- 사업자번호
	priority number, -- 우선순위
	ordercnt number -- 주문수량
);
 */
DROP TABLE ordermenu;
CREATE TABLE ordermenu
AS SELECT pcode, ordernum, ordercnt
FROM productex_0;

SELECT * FROM ordermenu;

-- 주문 테이블 : 제 2 정규화 완료

DROP TABLE order_table;
CREATE TABLE order_table
AS SELECT ordernum, isexport, memnum, busnum, priority
FROM productex_0;

SELECT * FROM order_table;

/*
	 CREATE TABLE normalform0(
		cus_id varchar(30),
		event_no varchar(100),
		is_checked varchar(50),
		grade varchar(30),
		discount NUMBER
	);
	
	INSERT INTO normalform0 VALUES('apple', 'E001,E005,E010', 'Y,N,Y', 'gold', 0.5);
	INSERT INTO normalform0 VALUES('banana', 'E002', 'N,Y', 'vip', 0.2);
	INSERT INTO normalform0 VALUES('carot', 'E003,E007', 'Y,Y', 'gold', 0.1);
	INSERT INTO normalform0 VALUES('orange', 'E004', 'N', 'silver', 0.05);
	
	SELECT * FROM normalform0;
	
	-- ex) 위 테이블을 제 1정규화 과정을 거친 테이블로 만드세요.
	DROP TABLE normalform1;
	
	CREATE TABLE normalform1
	AS SELECT * FROM normalform0 WHERE 1=0;
	SELECT * FROM normalform1;
	
	INSERT INTO normalform1 VALUES('apple', 'E001', 'Y', 'gold', 0.5);
	INSERT INTO normalform1 VALUES('apple', 'E005', 'N', 'gold', 0.5);
	INSERT INTO normalform1 VALUES('apple', 'E010', 'Y', 'gold', 0.5);
	INSERT INTO normalform1 VALUES('banana', 'E002', 'N', 'vip', 0.2);
	INSERT INTO normalform1 VALUES('banana', 'E005', 'N', 'vip', 0.2);
	INSERT INTO normalform1 VALUES('carrot', 'E003', 'Y', 'gold', 0.1);
	INSERT INTO normalform1 VALUES('carrot', 'E007', 'Y', 'gold', 0.1);
	INSERT INTO normalform1 VALUES('orange', 'E004', 'N', 'silver', 0.05);
 */

-- ex) 제 2 정규화
SELECT * FROM normalform1;
CREATE TABLE normalform2_event
AS SELECT cus_id, event_no, is_checked
FROM normalform1;
CREATE TABLE normalform2_custom
AS SELECT DISTINCT cus_id, grade, discount
FROM normalform1;
SELECT * FROM normalform2_event;
SELECT * FROM normalform2_custom;
