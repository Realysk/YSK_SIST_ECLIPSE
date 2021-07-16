/*
 # 0716 정리 문제
	 1. cardinality라는 테이블간의 관계를 의미한다. 관계의 종류를 기술하고 여기에서 optional, mandatory라는 의미와 실제 erd에서 어떤 경우에 사용되는지 기술하세요.
	 
	 	cardinality : 1:1, 1:M, M:M, 재귀적관계
	 	optional : 연결관계 데이터가 있거나 없을수도 있는 관계
	 	mandatory : 반드시 연결관계 데이터가 반드시 있어야 하는 관계
	 
	 2. 자기 참조형 테이블 구조로 Starcraft의 유닉생성을 아래의 형식으로 만들고 ERD와 데이터를 입력하세요.
	    번호 유닉명  상위번호  공격력
	    1   라바1    0      0
	    2   드론1    1      1
	    3   라바2    0
	    
	    */
			CREATE TABLE starcraft_unit(
				NO number PRIMARY KEY,
				uname varchar2(50),
				refno number,
				attackpoint number
			);
			INSERT INTO starcraft_unit VALUES(1, '라바1', 0, 0);
			INSERT INTO starcraft_unit VALUES(2, '라바2', 0, 0);
			INSERT INTO starcraft_unit VALUES(3, '저글링1', 1, 1);
			INSERT INTO starcraft_unit VALUES(4, '드론1', 2, 0);
			SELECT * FROM starcraft_unit;
		/*      
	          
	    게임을 모르는 분들은 가족관계로 아래와 같은 구조로 만드세요.
	    번호  역할     부모번호  이름
	    1   할아버지    0     홍고조
	    2   아버지      1     홍판서
	    3	큰아버지	  1
	    4	누나	  	  2
	    
	    */
			
		/*
	    
 */