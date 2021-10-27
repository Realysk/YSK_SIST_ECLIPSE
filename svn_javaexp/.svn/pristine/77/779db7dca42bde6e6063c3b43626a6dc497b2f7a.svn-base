/*
1. cardinality라는 테이블간의 관계를 의미한다. 관계의 종류를 기술하고, 여기에서 optional, 
    mandatory라는 의미와 실제 erd에서 어떤 경우에  사용되는지 기술하세요.
    cardinality : 1:1, 1:다, 다:다, 재귀적관계
    optional : 연결관계 데이터가 있을 수도 없을 수도 있는 관계
    mandatory : 반드시 연결관계 데이터가 반드시 있어야 하는 관계
    
2. 자기 참조형 테이블 구조로 Starcraft의 유닉생성을 아래의 형식으로 만들고,
    ERD와 데이터를 입력하세요.
    번호 유닉명  상위번호  공격력
    1   라바1    0      0
    2   저글링1   1      1
     번호 역할     부모번호  이름
    1   할아버지    0     홍고조
    2   아버지      1     홍판서
    3   큰아버지    1    
    4   누나       2    
   
*/
CREATE TABLE unit(
	NO NUMBER PRIMARY KEY,
	uname varchar2(50),
	refno NUMBER,
	attackpoint number
);
INSERT INTO unit values(1, '라바1', 0, 0);
INSERT INTO unit values(2, '라바2', 0, 0);
INSERT INTO unit values(3, '저글링1', 1, 1);
INSERT INTO unit values(4, '드론1', 2, 0);
SELECT * FROM unit;




