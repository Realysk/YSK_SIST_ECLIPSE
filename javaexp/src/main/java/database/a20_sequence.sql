/*
 # sequence
 	1. 유일한 식별자 데이터를 만들기 위한 객체.
 	2. 기본 키 값을 자동으로 생성하기 위하여 일련번호를 생성한다.
 		ex) 웹 게시판에 key 글 번호를 순서대로 등록할 때, sequence를 활용하면 편리하다.
 	3. 여러 테이블에서 공유 가능
 	4. 기본 형식
 		create sequence 시퀀스명
 			increment by 증가단위
 			start with 시작번호
 			maxvalue 최대값 | nomaxvalue
 			minvalue 최소값 | nominvalue
 			cycle | nocycle -- 반복 여부 설정
 			cache n | nocache -- 속도 개선을 위해 메모리 캐쉬 시퀀스 수
 */