/*
1. 함수 종속성의 개념을 js에서 아는 function의 예로 기술하세요.
	함수 종속성이란 데이터가 특정 함수에 종속되어 매개변수로 입력된 데이터가,
	결과값에 종속여부를 나타낸다.
	function plus(num01, num02){
		return num01+num02;
	}
	plus(25,5) ==> 30
	25,5라는 데이터는 30을 만들기 위해 종속적인 데이터이다.
	ex)	이름, 나이, 사는곳, 생년월일 인적사항은 ==> 주민번호로 되는데 종속적인 데이터이다.
		그러므로, 이름, 나이, 사는곳, 생년월일의 데이터는 주민번호에 종속적인 데이터이다.

2. 제1정규화/제2정규화의 개념을 기본예제와 함께 기술하세요.
	제1정규화 : 복수의 속성값을 갖는 속성을 분리.
	제2정규화 : 주식별자에 종속적이지 않는 속성의 분리
			부분종속 속성을 분리..
3. 아래 테이블을 제1정규화 과정을 거쳐 테이블을 구성하세요.
고객번호  고객명   구매물건         구매건수                    
1000    홍길동   사과,바나나,딸기   5,4,3
1001    김길동   오렌지,수박,키위   5,3,2
1002    신길동   망고,바나나,수박   3,2,1
*/
	CREATE TABLE normalexp01_1(
		cus_num NUMBER,
		cus_name varchar2(50)
	);
	INSERT INTO normalexp01_1 values(1000,'홍길동');
	INSERT INTO normalexp01_1 values(1001,'김길동');
	INSERT INTO normalexp01_1 values(1002,'신길동');

	SELECT * FROM normalexp01_1;
	CREATE TABLE normalexp01_2(
		cus_num NUMBER, -- 다음 제2정규화과정을 위해 구매번호 buy_cnt를 넣어주는 것도 효과적이다.
		buy_product varchar2(50),
		cnt number
	);
	SELECT * FROM normalexp01_2;
/*
고객번호  고객명   구매물건         구매건수                    
1000    홍길동   사과,바나나,딸기   5,4,3
1001    김길동   오렌지,수박,키위   5,3,2
1002    신길동   망고,바나나,수박   3,2,1 
 **/
	INSERT INTO normalexp01_2 values(1000,'사과',5);
	INSERT INTO normalexp01_2 values(1000,'바나나',4);
	INSERT INTO normalexp01_2 values(1000,'딸기',3);
	INSERT INTO normalexp01_2 values(1001,'오렌지',5);
	INSERT INTO normalexp01_2 values(1001,'수박',3);
	INSERT INTO normalexp01_2 values(1001,'키위',2);
	INSERT INTO normalexp01_2 values(1002,'망고',3);
	INSERT INTO normalexp01_2 values(1002,'바나나',2);
	INSERT INTO normalexp01_2 values(1002,'수박',2);
SELECT * FROM normalexp01_2;
-- 제 2정규화 과정으로   구매번호를 추가하여
-- 구매테이블 : *구매번호 고객번호 물건번호 구매갯수(비식별자 관계 처리), 물건테이블 : 물건번호, 물건명, 가격
-- 구매테이블 : *고객번호 *물건번호 구매갯수(식별자 관계 처리), 물건테이블 : 물건번호, 물건명, 가격
/*
4. 아래 테이블을 정규화 과정(제1정규화,제2정규화)을 거쳐 테이블을 구성하세요.
물건번호  물건명   가격     계약번호  구매자아이디   구매자명    구매갯수
1000    사과     3000    A100    himan       홍길동    2
1001    바나나    4000   A101    higirl      김영희    5
1001    바나나    4000   A102    gooodman    오영희    6
1002    오렌지    2000   A103    badboy      신영철    5
*/
CREATE TABLE normalexp02_1(
	pno NUMBER,
	name varchar2(50),
	price NUMBER
);
INSERT INTO normalexp02_1 values(1000,'사과',3000);
INSERT INTO normalexp02_1 values(1001,'바나나',4000);
INSERT INTO normalexp02_1 values(1002,'오렌지',2000);
DELETE FROM normalexp02_2;
INSERT INTO normalexp02_2  values('A100','himan',1000, '홍길동',2);
INSERT INTO normalexp02_2  values('A101','higirl',1001, '김영희',5);
INSERT INTO normalexp02_2  values('A102','gooodman',1001, '오영희',6);
INSERT INTO normalexp02_2  values('A103','badboy',1002, '신영철',5);

CREATE TABLE normalexp02_2(
	contno char(4),
	cusid varchar2(50),
	pno NUMBER,
	pname varchar2(50),
	bcnt number
);
-- # 제1정규화가 끝난 테이블..
SELECT * FROM normalexp02_1;
SELECT * FROM normalexp02_2;
-- # 제2정규화가 끝난 테이블 
SELECT * FROM normalexp02_3;
SELECT * FROM normalexp02_4;
CREATE TABLE normalexp02_3
AS SELECT distinct cusid, pname FROM normalexp02_2;
DROP TABLE normalexp02_4;
CREATE TABLE normalexp02_4
AS SELECT contno, cusid, pno, bcnt FROM normalexp02_2; 
SELECT * FROM normalexp02_1;
SELECT * FROM normalexp02_3;
SELECT * FROM normalexp02_4;

SELECT * FROM emp_dept_nm;
-- 정규화가 안된 테이블의 문제..
-- 1. 삽입, 삭제, 수정
-- 삽입 : 부서정보가 확정이 안된 상황에서 deptno, dname, loc 비워두고 처리를 해야하는 부분이 있다.
--       필요없이 임시데이터를 입력해야 하는 경우.
-- 삭제 : 사원번호 7839, 7782, 7934를 삭제하는 경우, 10번 부서정보가 삭제되어 다음에 10번 정보를 찾을 수가 없다.
-- 수정 : 사원 7839의 부서명을 바꿀려고 하는데, 다른 사원의 부서이름도 바꾸어야 하거나  일치하는 정보를 확인할 수 있다.
--	데이터의 무결성 문제가 발생하여, 단계적으로 정규화가 필요로 한다.
CREATE TABLE emp_dept_nm
AS SELECT e.*, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;


