/*
# sequence 
1. 유일한 식별자 데이터를 만들기 위한 객체.
2. 기본 키 값을 자동으로 생성하기 위하여 일련번호 생성한다.
 ex) 웹 게시판에 key 글 번호를 순서대로 등록할 때, sequence
 	를 활용하면 편리한다.
3. 여러 테이블에서 공유 가능.
4. 기본형식. 	
	create sequence 시퀀스명
		increment by 증가단위
		start with 시작번호
		maxvalue 최대값 | nomaxvalue
		minvalue 최소값 | nominvalue
		cycle | nocycle -- 반복여부 설정.
		cache n | nocache -- 속도 개선을 위해 메모리 캐쉬 시퀀스 수
ps) drop table 테이블명;
	drop sequence 시퀀스명;		
		  
		      
 **/
CREATE SEQUENCE seq_01
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 999999;
/* 
5. 선언된  sequence 사용..
	1) 시퀀스명.nextval : 현재 시퀀스번호를 출력하면서 다음 시퀀스 넘버링 처리
	2) 시퀀스명.currval : 현재 시퀀스번호를 출력
 */
 SELECT 
 		seq_01.nextval
-- 		,seq_01.currval
 FROM dual;
-- ex1) 시작번호가 1001이고 마지막번호가 9999인 시퀀스를 만들고 실행을 해보세요..
-- ex2) 시작번호가 8888이고 마지막번호가 1000이고 카운트다운되는 시퀀스를 생성해보세요
-- ex3) 시작번호가 1이고 마지막번호가 50인 시퀀스가 5씩 증가되는 시퀀스를 생성해보세요. 2조
--ex) 시작번호 1001이고 마지막번호 999인 시퀀스 만들고 실행하기
DROP SEQUENCE seq_02;
CREATE SEQUENCE seq_02
   INCREMENT BY 1
   START WITH 1001
   MINVALUE 1001
   MAXVALUE 9999;

SELECT seq_02.nextval
FROM dual;
-- drop  sequence 시퀀스명; 해당 시퀀스의 삭제 처리
--ex) 시작번호 8888이고 마지막번호 1000인 카운트다운 시퀀스 생성
DROP SEQUENCE seq_03;
CREATE SEQUENCE seq_03
   INCREMENT BY -1
   START WITH 8888
   MINVALUE 1000
   MAXVALUE 8888;

SELECT seq_03.nextval
FROM dual;

--ex) 시작번호가 1이고 마지막번호 50인 시퀀스가 5씩 증가되는 시퀀스 생성
DROP SEQUENCE seq_04;
CREATE SEQUENCE seq_04
   INCREMENT BY 5
   START WITH 1
   MINVALUE 1
   MAXVALUE 50;

SELECT seq_04.nextval
FROM dual;

