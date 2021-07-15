/*
 엔티티 타입은 업무에 필요하고 유용한 정보를 저장 및 관리를 위한 것으로 영속적으로 존재하는 단위이며 엔티티의 집합이라고 할 수 있다.
 엔티티는 엔티티타입에 속한 인스턴스 하나에 해당한다. 실제 데이터 또는 레코드를 말한다.		
 엔티티 타입은 개체 또는 데이터베이스의 테이블입니다. 사람, 장소, 물건, 사건 그리고 개념을 정의할 수 있는 것으로 정보 시스템을 구현할 때 데이터베이스 테이블에 해당합니다.
 
 # 데이터베이스 모델링 : 정보화 시스템을 구축하기 위해 어떤 데이터가 존재하는지 또는 업무가 필요로 하는 정보는 무엇인지를 분석하는 방법
 
 # 모델링 대상
 	1. 업무가 관여하는 어떤 것 (THINGS)
 	2. 업무가 관여하는 어떤 것 간의 관계 (RELATIONSHIPS)
 	3. 어떤 것이 가지는 성격 (ATTRIBUTES)
 
 # 엔티티 타입은 업무에 필요하고 유용한 정보를 저장하고 관리하기 위한 것으로 영속적으로 존재하는 단위
 
 # 특징
 	1. 반드시 업무에서 필요하고 관리하고자 하는 정보여야 한다.
 		ex) 환자, 토익의 응시 횟수...
 	2. 유일한 식별자에 의해 식별이 가능해야 한다.
 	3. 영속적으로 존재하는 엔티티의 집합이어야 한다. (2개 이상)
 	4. 엔티티 타입은 업무 프로세스에 의해 이용되어야 한다.
 	5. 엔티티 타입에는 반드시 속성이 있어야 한다.
 	6. 엔티티 타입은 다른 엔티티 타입과 최소 한 개 이상의 관계가 있어야 한다.
 
 # 발생 시점에 따른 구분
 	기본(FUNDAMENTAL ENTITY TYPE) - 해당 업무에 기본적으로 존재하는 정보
 	중심(MAIN ENTITY TYPE) - 업무에 핵심적인 역할을 하는 정보
 	행위(ACTIVE ENTITY TYPE) - 기본과 중심 엔티티 타입을 근간으로 업무가 흘러가면서 발생되는 엔티티 타입
 	
 # 명명 규칙
 	1. 현업에서 사용하는 용어를 사용한다.
 	2. 가능한 약어를 사용하지 않는다.
 	3. 단수 명사를 사용한다.
 	4. 모든 엔티티 타입 이름은 유일해야 한다.
 	5. 엔티티 타입이 생성되는 자연스러운 의미를 그대로 부여한다.
 */


-- ex) 화면에 있는 entity와 entity 타입을 식별하여 erd

CREATE TABLE entityexp01 (classRoom varchar2(50));
SELECT * FROM entityexp01;

CREATE TABLE entityexp02 (subject varchar2(100));
SELECT * FROM entityexp02;

CREATE TABLE entityexp03 (teacher varchar2(100));
SELECT * FROM entityexp03;

CREATE TABLE lecture (
	classRoom varchar2(50),
	subject varchar2(100),
	teacher varchar2(100)
);
INSERT INTO entityexp01 VALUES('102호');
INSERT INTO entityexp02 VALUES('DATA MODELING');
INSERT INTO entityexp03 VALUES('김경재');
INSERT INTO lecture VALUES('101호', 'J2EE', '이춘식');
INSERT INTO lecture VALUES('102호', 'DATA MODELING', '김경재');
SELECT * FROM lecture;

-- ex) 대리식별자를 erd도구에 의해 만들고 script(SQL 코드)로 테이블 생성까지 처리해보세요. (방문 실적 테이블)
CREATE TABLE identifiedexp01(
	visitdate date,
	visitcode char(5),
	visitcivil char(13),
	CONSTRAINTS identifiedexp01_com_pk PRIMARY KEY(visitdate, visitcode, visitcivil)
);

-- 3개의 컬럼의 혼합한 primary key 지정
SELECT * FROM identifiedexp01;

CREATE TABLE identifiedexp02(
	visitsid char(25) PRIMARY KEY,
	visitdate date,
	visitcode char(5),
	visitcivil char(13)
);

-- ex) (부서-사원) 화면을 기준으로 erd를 생성해보세요.
CREATE TABLE reldept(
	dname varchar2(20)
);
SELECT * FROM reldept;
INSERT INTO reldept VALUES ('DB팀');
CREATE TABLE reemp(
	ename varchar(20),
	dname varchar(20)
);
INSERT INTO reemp VALUES('황경빈', 'DB팀');
INSERT INTO reemp VALUES('김철수', 'DB팀');
INSERT INTO reemp VALUES('홍길동', 'DB팀');
SELECT * FROM reemp;

-- ex) erd에서 만들 고객과 주문 엔티티의 관계에서 실제 테이블을 만들고 데이터를 입력 조회하세요.
CREATE TABLE custom(cname varchar2(20));
INSERT INTO custom VALUES('홍길동');
SELECT * FROM custom;

CREATE TABLE orders(
	orderNum number,
	cname varchar2(20)
);
INSERT INTO orders VALUES(1,'홍길동');
INSERT INTO orders VALUES(2,'김길동');
INSERT INTO orders VALUES(3,'마길동');
SELECT * FROM orders;

-- ex) (영화-배우) 화면을 기준으로 erd를 생성 및 테이블 생성과 데이터를 입력하세요.
CREATE TABLE movie(title varchar(50));
CREATE TABLE movie_person(
	pname varchar2(50),
	title varchar2(50)
);
INSERT INTO movie VALUES('무사');
INSERT INTO movie VALUES('고래사냥');
INSERT INTO movie_person VALUES ('안성기','무사');
INSERT INTO movie_person VALUES ('안성기','고래사냥');
INSERT INTO movie_person VALUES ('김수철','고래사냥');
SELECT * FROM movie;
SELECT * FROM movie_person;