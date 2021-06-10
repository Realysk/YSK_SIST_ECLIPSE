/*
 # 테이블에 사용되는 데이터 타입
 	1. 개요
 		1) 데이터베이스에 저장되는 데이터는 문자, 숫자, 날짜, 이미지 등과 같은 다양한 형식으로 표현된다.
 			cf) 이미지는 binary 타입으로 저장하기보다 이미지 파일 서버를 활용해서 이미지 경로와 파일명을 활용해서 저장한 위치를 호출한다.
 			varchar2로 저장한다. 설계 시 *이미지명과 경로명까지 처리된다는 것을 설계에 포함.
 		2) 실무에서 컬럼에 대한 데이터 타입이나 길이의 결정은 데이터베이스 설계단계에서 신중하게 고려해야 하는 중요한 사항이다.
 		3) 데이터베이스 설계 단계에서 잘못 선정된 데이터 타입은 응용 프로그램 개발을 어렵게 하거나 성능 저하의 요인이 된다.
 	
 	2. 오라클에서 지원되는 데이터 타입의 종류
 		1) char(size) : 고정 길이 문자 데이터 타입. 최대 2000바이트
 			- ex) 코드성 데이터 - 학번, 사번, 주민번호 :
 				자리 수가 정해진 데이터
 				create table personnel(
 					civilnum char(13);
 				);
 		2) varchar2(size) : 가변 길이 문자 데이터 타입, 최대 4000바이트
 			- ex) 최대 크기를 설정하기에 그 보다 작은 데이터 할당 시 효율화.
 				create table personnel(
 					name varchar2(15)
 				);
 		
 		3) number(p, s) : 정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입
 			- ex) 전체크기 소숫점 이하 크기 지정.
 		
 		4) date : 날짜/시간 형식을 저장하기 위한 데이터 타입
 		-----------------------------------------------------------------------
 		5) nvarchar2(size) : 국가별 문자 집합에 따른 size 크기의 문자/바이트문자 데이터 타입
 		
 		6) rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 타입
 					행단 6바이트 또는 10바이트
 					
 		7) blob : 대용량의 바이너리 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 		
 		8) clob : 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 		
 		9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입. 최대 4GB
 		
 		10) timestamp(n) : date 데이터 타입의 확장된 형태. n은 millis second 자리수로 최대 9자리까지 표현 가능.
 		
 	3. 기타 제약조건
 	
 		1) primary key
 		
 		2) unique
 		
 		3) not null
 		
 		4) check
 		
 		5) foreign key
 		
 	4. 실무 설계
 	
 		1) 컬럼 내의 연산으로 결과 값이 나오는 데이터는 컬럼에서 제외한다.
 			학생 정보의 국어, 영어, 수학 점수에서 합계나 평균 등은 테이블 설계의 내용에서 제외한다.
 			
 		2) 테이블의 분리가 필요한 경우에서 하나의 테이블에서 처리하지 않고 분리 한다. - 분리 기준은 join 구문시 언급
 		
*/

-- 회원 정보 테이블 생성.
CREATE TABLE MEMBER (
	id varchar2(20),
	pass varchar2(20),
	civilcode char(13), -- 고정형 데이터
	point number, -- 기본 정수형 데이터
	auth varchar2(20)
);

-- # 데이터 입력
-- insert into 테이블명 values('입력할데이터',....테이블의 구조 순서대로 입력);

INSERT INTO MEMBER VALUES ('himan','7777','9112122801619',1000,'관리자');
SELECT * FROM MEMBER;

-- ex) 프로야구 팀 정보를 입력하려고 한다. 구글에 프로야구 순위표 확인하셔서 해당 데이터를 입력하기 위한 테이블을 만들고 데이터 입력 후 조회하세요.
DROP TABLE BASEBALLRANK;
CREATE TABLE BASEBALLRANK (
	team varchar2(20),
	win NUMBER,
	lose NUMBER,
	draw NUMBER
	);

INSERT INTO BASEBALLRANK VALUES ('SSG', 27, 18, 0);
SELECT team 팀, win 승, lose 패, draw 무, win/(win+lose) 승률
FROM BASEBALLRANK;
)
