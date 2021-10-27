/*
# 데이터베이스 모델링 :정보화 시스템을 구축하기 위해, 어떤 데이터가 존재하는지 또
는 업무가 필요로 하는 정보는 무엇인지를 분석하는 방법
# 모델링 대상
1. 업무가 관여하는 어떤 것(THINGS)
2. 업무가 관여하는 어떤 것간의 관계(RELATIONSHIPS)
3. 어떤 것이 가지는 성격(ATTRIBUTES)
# 엔티티타입은 업무에 필요하고 유용한 정보를 저장하고 관리하기 위한 것으로 영속적으로 존재하는 단위
# 엔티티타입의 특징
☞ 첫 번째 반드시 업무에서 필요하고 관리하고자 하는 정보이어야 한다.
(예. 환자, 토익의 응시횟수…)
☞ 두 번째 유일한 식별자에 의해 식별이 가능해야 한다.
☞ 세 번째 영속적으로 존재하는 엔티티의 집합이어야 한다.
(“한 개”가 아니라 “두 개 이상”)
☞ 네 번째 엔티티타입은 업무 프로세스에 의해 이용되어야 한다.
☞ 다섯 번째 엔티티타입에는 반드시 속성이 있어야 한다.
☞ 여섯 번째 엔티티타입은 다른 엔티티타입과 최소 한 개 이상의 관계가 있어야 한다.
# 발생시점에 따른 구분
☞ 기본(FUNDAMENTAL ENTITY TYPE) – 해당 업무에 기본적으로 존재하는 정보
☞ 중심(MAIN ENTITY TYPE)– 업무에 핵심적인 역할을 하는 정보
☞ 행위(ACTIVE ENTITY TYPE) – 기본과 중심 엔티티타입을 근간으로 업무가 흘러가면서 발생되는 엔티티타입

# 명명규칙		
첫 번째 현업에서 사용하는 용어를 사용한다.
두 번째 가능한 약어를 사용하지 않는다.
세 번째 단수명사를 사용한다.
네 번째 모든 엔티티타입 이름은 유일해야 한다.
다섯 번째 엔티티타입이 생성되는 자연스러운 의미를 그대로 부여한다

ex) 대리식별자를 erd도구에 의해 만들고 script(SQL 코드)로 테이블 
생성까지 처리해보세요. 3조
방문실적테이블
*/
CREATE TABLE identifiedexp01(
	visitdate DATE,
	visitcode char(5),
	visitcivil char(13),
	CONSTRAINTS identifiedexp01_com_pk PRIMARY KEY(visitdate,visitcode,visitcivil)
);
-- 세개의 컬럼의 혼합한 primary key 지정..
SELECT * FROM identifiedexp01;

CREATE TABLE identifiedexp02(
	visitsid char(25) PRIMARY KEY,
	visitdate DATE,
	visitcode char(5),
	visitcivil char(13)
);

/*
관계란 두 개의 엔티티타입 사이의 논리적인 관계 즉 엔티티와 엔티티
가 존재의 형태나 행위로서 서로에게 영향을 주는 형태를 말한다.


ex) 화면을 기준으로 erd를 생성해보세요.. 4조
*/
DROP TABLE reldept;
CREATE TABLE reldept(
	dname varchar(20)
);
SELECT * FROM reldept;
INSERT INTO reldept values('DB팀');
CREATE TABLE reemp(
	ename varchar2(20),
	dname varchar(20)
);
INSERT INTO reemp values('황경빈', 'DB팀');
INSERT INTO reemp values('김철수', 'DB팀');
INSERT INTO reemp values('홍길동', 'DB팀');
SELECT * FROM reemp;
-- ex) erd에서 만들  고객과 주문 엔티티의 관계에서 실제 테이블을
-- 만들고, 데이터를 입력, 조회 처리하세요 4조, 5조
CREATE TABLE custom(
   cname varchar2(20)
);
INSERT INTO custom values('홍길동');
CREATE TABLE orders(
   orderNum NUMBER,
   cname varchar2(20)
);
INSERT INTO orders values(15401,'홍길동');
INSERT INTO orders values(15402,'홍길동');
INSERT INTO orders values(15403,'홍길동');
SELECT * FROM orders;
SELECT * FROM custom;

--
CREATE TABLE movie(
	title varchar(50)
);
CREATE TABLE movie_person(
	pname varchar(50),
	title varchar(50)
);
INSERT INTO movie values('무사');
INSERT INTO movie values('고래사냥');
INSERT INTO movie_person VALUES('안성기','무사');
INSERT INTO movie_person VALUES('안성기','고래사냥');
INSERT INTO movie_person VALUES('김수철','고래사냥');
SELECT * FROM movie;
SELECT * FROM movie_person;
/*
--
--멤버쉽은 엔티티타입이 참여하는 관계에 대한 자신으로부터의 관점이다.

# 정상관계
-- 엔티티타입과 엔티티타입이 독립적으로 분리되어 있으면서 한 개의
--관계만 상호간 존재하는 형태의 관계
*/
CREATE TABLE board(
	NO NUMBER,
	refno NUMBER,
	title varchar2(200),
	content varchar2(2000),
	writer varchar2(50),
	readcnt NUMBER,
	regdte date
);
INSERT INTO board values(1000,0,'글작성','','홍길동',0,sysdate);
INSERT INTO board values(1001,1000,'RE:답글작성','','신길동',0,sysdate);
INSERT INTO board values(1002,1001,'RE:RE:답글작성','','마길동',0,sysdate);
INSERT INTO board values(1003,1000,'RE:답글작성(2)','','하길동',0,sysdate);
SELECT * FROM board;







