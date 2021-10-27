SELECT e.*,dname,loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;
CREATE TABLE student001(
   pcode char(8) PRIMARY KEY
);
-- 식별자 관계
CREATE TABLE registerlesson001(
   scode char(8),
   pcode char(8) REFERENCES stuednt001(pcode),
   PRIMARY key(scode, pcode)
);

CREATE TABLE student002(
   pcode char(8) PRIMARY KEY
);
-- 식별자 관계
CREATE TABLE registerlesson002(
   scode char(8) PRIMARY KEY,
   pcode char(8) REFERENCES stuednt002(pcode)
);
DROP TABLE nomarlization_1;
CREATE TABLE nomarlization_0(
	prodnum NUMBER,
	name varchar2(50),
	rcnt NUMBER,
	ordnum char(5),
	isexport char(1),
	memnum NUMBER,
	busnum NUMBER,
	priority NUMBER,
	ordcount number
);
INSERT INTO nomarlization_0 values(1001,'모니터',1990, 'AB345','X',4520, 398201,1,150);
INSERT INTO nomarlization_0 values(1001,'모니터',1990, 'AD347','X',2341, null,3,600);
INSERT INTO nomarlization_0 values(1007,'마우스',9702, 'CA210','X',3280, 200212,8,1200);
INSERT INTO nomarlization_0 values(1007,'마우스',9702, 'AB345','X',4520, 398201,1,300);
INSERT INTO nomarlization_0 values(1007,'마우스',9702, 'CB230','X',2341, 563892,3,690);
INSERT INTO nomarlization_0 values(1201,'스피커',2108, 'CB231','Y',8320, null,2,80);
SELECT * FROM nomarlization_0;
CREATE TABLE normal_product_1
AS SELECT DISTINCT prodnum, name, rcnt
FROM nomarlization_0
ORDER BY prodnum;
/*
	ordnum char(5),
	isexport char(1),
	memnum NUMBER,
	busnum NUMBER,
	priority NUMBER,
	ordcount number 
 **/
DROP TABLE normal_orderlist_1;
CREATE TABLE normal_orderlist_1
AS
SELECT prodnum, ordnum, isexport, memnum, busnum, priority, ordcount 
FROM nomarlization_0;

SELECT * FROM normal_product_1; 
-- 중복속성이 분리되었으므로 제품번호 식별자를 가지는 단일한 로우가 구성되었다.
SELECT * FROM normal_orderlist_1;
-- 중복되어 발생하는 속성을 분리하여 별도의 테이블로 구성되었다.
-- 제1정규화 : 복수의 속성값을 갖는 속성을 분리 처리  완료..
CREATE TABLE normalform0(
	cus_id varchar2(30),
	event_no varchar2(100),
	is_checked varchar2(50),
	grade varchar2(30),
	discount number
);
-- 고객아이디, 이벤트번호, 당첨여부, 등급, 할인율
INSERT INTO normalform0 values('apple','E001,E005,E010','Y,N,Y','gold',0.5);
INSERT INTO normalform0 values('banana','E002','N,Y','vip',0.2);
INSERT INTO normalform0 values('carot','E003,E007','Y,Y','gold',0.1);
INSERT INTO normalform0 values('orange','E004','N','silver',0.05);
-- 위 테이블을 제1정규화 과정을 거친 테이블로 만드세요.. 1조
SELECT * FROM normalform0;
CREATE TABLE normalform1
AS SELECT * FROM normalform0 WHERE 1=0;
SELECT * FROM normalform1;
INSERT INTO normalform1 values('apple','E001','Y','gold',0.5);
INSERT INTO normalform1 values('apple','E005','N','gold',0.5);
INSERT INTO normalform1 values('apple','E010','Y','gold',0.5);
INSERT INTO normalform1 values('banana','E002','N','vip',0.2);
INSERT INTO normalform1 values('banana','E005','Y','vip',0.2);
INSERT INTO normalform1 values('carrot','E003','Y','gold',0.1);
INSERT INTO normalform1 values('carrot','E007','Y','gold',0.1);
INSERT INTO normalform1 values('orange','E004','N','silver',0.05);


-- 하나의 컬럼에는 하나의 데이터만 들어간다는 원칙이 원자성 원칙입니다.
-- 위 테이블을 분리시킬필요는 없고, 하나의 컬럼에 하나의 데이터만 들어가게 처리해보세요.
/*
제 2 정규화
주식별자에 종속되지 않는 속성의 분리, 부분 종속 속성을 분리한다.
1. 완전 함수종속성
2. 부분 함수종속성.

function plus(num01, num02){
	return num01+num02;
}
plus(25,30); 결과값은 55
25와 30는 55라는 데이터에 함수 종속성을 가지고 있다...
함수종속성이라는 것은 결정자에 함수적으로 종속관계를 가지고 있다는 것을 의미한다.
ex) 이름, 출생지, 주소 === 주민번호만드는 함수 ==> 주민번호
이름, 출생지, 주소는  주민번호에 종속성을 가지고 있다..

 * */

SELECT * FROM normal_product_1; 
-- 중복속성이 분리되었으므로 제품번호 식별자를 가지는 단일한 로우가 구성되었다.
SELECT * FROM normal_orderlist_1;
DROP TABLE normal_prod_order_2;

-- 제품주문 : 제2정규화과정 완료..
CREATE TABLE normal_prod_order_2
AS SELECT prodnum, ordnum, ordcount
FROM normal_orderlist_1;
-- 주문 : 제2정규화과정 완료
CREATE TABLE normal_order_2
AS SELECT ordnum, isexport, memnum, busnum, priority
FROM normal_orderlist_1;
SELECT * FROM normal_prod_order_2;
SELECT * FROM normal_order_2;

SELECT empno, ename, job,  FROM emp;








