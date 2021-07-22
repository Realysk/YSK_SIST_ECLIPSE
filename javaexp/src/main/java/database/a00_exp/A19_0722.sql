/*
 # 0722 정리 문제
	 1. 함수종속성개념을 완전함수종속성, 부분함수종속성, 이행적함수종속성으로 나누어 기술하세요.
	 
	 	완전 함수 종속성 : 종속자가 기본키에만 종속되고 구성하는 모든 속성이 기본키의 부분집합에 종속되는 경우
	 		ex) 이벤트, 고객ID -> 이벤트 당첨 여부
	 		
	 	부분 함수 종속석 : 종속자가 다른 속성 혹은 기본키가 여러개인 경우 특정 기본키에 종속되는 경우
	 		ex) 이벤트, 고객ID -> 고객명
	 
	 2. 정규화의 개념을 기술하세요.
	 
 		- 함수 종속성을 이용해 릴레이션(테이블)을 연관성이 있는 속성들로만 구성되도록 분해하여 이상 현상이 발생하지 않는 올바른 릴레이션(테이블)로 만들어 가는 과정
 			- 기본 목표 : 관련이 없는 함수 종속성은 별개의 릴레이션으로 표현	 	
	 
	 3. 제1정규화, 제2정규화, 제3정규화, 보이스코드 정규화의 개념을 기술하세요.
	 
		제 1 정규화 : 데이터가 원자성을 가지도록 처리. 복수의 속성값을 갖는 속성을 분리
		제 2 정규화 : 주 식별자(Primary Key)에 종속적이지 않는 속성을 분리하는 것으로 완전함수종속성 이외에 부분함수종속적이나 종속적이지 않는 속성을 분리하는 것을 말한다.
		제 3 정규화 : 속성이 종속적인 속성의 분리로 함수 종속에서 다시 함수 종속적인 속성의 분리로 이전(이행)함수종속을 분리하는 것을 말한다.
		BCNF 정규화 : 다수의 주 식별자 분리
		제 4 정규화 : 다가 종속 속성분리
		제 5 정규화 : 결합 종속일 경우는 두 개 이상의 N개로 분리한다.
	 
	 4. 식별자와 비식별자의 차이를 ERD 구성을 하여 기술하세요.
	 
		 식별자 관계 : 참조하는 테이블의 키를 현재 테이블에 키로 같이 사용할 때
		 	ex) 고객이 물건 하나의 주문을 사용할 때
		 	컬럼을 최소로 사용할 수 있지만 테이블 간에 연관 관계가 많을 때 복합키를 많이 만들어야 되면 복잡성은 높아질 때가 많다.
		 	
		 비식별자 관계 : 참조하는 테이블의 키를 현재 테이블에 키로 사용하지 않을 때
		 	ex) emp dept 관계
		 	pk 컬럼을 따로 잡아 컬럼이 추가 되는 경향이 있지만 복잡성이 많은 테이블 연관 관계는 보다 효과적으로 테이블 관계를 정리할 수 있는 특징이 있다.	 	
	 
	 5. 아래와 같은 제2정규화가 끝난 릴레이션을 제3정규화를 처리하세요(ERD 및  sql 테이블 구성)
	     학생명   점수   등급	최소	  최대
	     홍길동   90    A		90	  100
	     김길동   80    B		80	  89
	     마길동   80    B		80	  89
	     신길동   70    D		70	  79
	     오길동   55    F		0	  59
	 
	 	*/
			CREATE TABLE record( -- 점수
				name varchar2(50), -- 학생명
				point number -- 점수
			);
			
			INSERT INTO record VALUES('홍길동',90);
			INSERT INTO record VALUES('김길동',80);
			INSERT INTO record VALUES('마길동',80);
			INSERT INTO record VALUES('신길동',70);
			INSERT INTO record VALUES('오길동',55);
			
			SELECT * FROM record;
		
		
			CREATE TABLE ptgrade( -- 등급
				grade char(1), -- 등급
				minval number, -- 최소
				maxval number -- 최대
			);
			
			INSERT INTO ptgrade VALUES('A',90,100);
			INSERT INTO ptgrade VALUES('B',80,89);
			INSERT INTO ptgrade VALUES('C',70,79);
			INSERT INTO ptgrade VALUES('D',60,69);
			INSERT INTO ptgrade VALUES('F',0,59);
		
			SELECT * FROM ptgrade;
		
		
			SELECT a.*, grade, minval, maxval
			FROM RECORD a, ptgrade b
			WHERE point BETWEEN minval AND maxval;
		/*
	 
	 6. 3정규화가 끝난 릴레이션을 BCNF정규화를 처리하세요.(ERD 및 sql 테이블 구성)
	     학생번호  담당교수번호  과목명
	     S001    T001       컴퓨터공학
	     S002    T001       데이터베이스개론
	     S003    T002       알고리즘개론
	     S004    T001       컴퓨터공학
	     
		*/
			CREATE TABLE bcnf_01(
				stno char(4), -- 학생번호
				thno char(4) -- 담당교수번호
			);
		
			INSERT INTO bcnf_01 VALUES('S001','T001');
			INSERT INTO bcnf_01 VALUES('S002','T001');
			INSERT INTO bcnf_01 VALUES('S003','T002');
			INSERT INTO bcnf_01 VALUES('S004','T001');
		
			SELECT * FROM bcnf_01;
		
		
			CREATE TABLE bcnf_02(
				thno char(4), -- 담당교수번호
				subject varchar2(50) -- 과목명
			);
		
			INSERT INTO bcnf_02 VALUES('T001','컴퓨터공학');
			INSERT INTO bcnf_02 VALUES('T001','데이터베이스개론');
			INSERT INTO bcnf_02 VALUES('T002','알고리즘개론');
		
			SELECT * FROM bcnf_02;
		
			-- 학생번호와 담당교수번호 join
			SELECT a.*
			FROM bcnf_01 a, bcnf_02 b
			WHERE a.thno = b.thno;
		/*
	     
 */