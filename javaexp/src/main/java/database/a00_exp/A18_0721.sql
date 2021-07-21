/*
 # 0721 정리 문제
	1. 함수 종속성의 개념을 JS에서 아는 function의 예로 기술하세요.
	
		함수 종속성이란 데이터가 특정 함수에 종속되어 매개변수로 입력 된 데이터가 결과값에 종속여부를 나타낸다.
	
		제 2 정규화에 가까운 개념으로 주 식별자에 종속되지 않는 속성의 분리, 부분적 종속 속성을 분리한다.
		(완전 함수 종속성, 부분 함수 종속성)
		
		function plus(num01, num02) {
 			return num01 + num02;
 		}
 		
 		ex) plus(300,250); 결과값은 550이 나올 것이고
 		300, 250은 550이라는 데이터에 함수 종속성을 갖고 있다.
 		함수 종속성은 결정자에 함수적으로 종속 관계를 갖는 것을 의미한다.
 		(이름, 나이, 거주지, 생년월일 인적사항 => 주민번호로 되는데 종속적인 데이터이다.
 		 그러므로 이름, 나이, 거주지, 생년월일의 데이터는 주민번호에 종속적인 데이터이다.) 
	
	2. 제 1,2 정규화의 개념을 기본예제와 함께 기술하세요.
	
		제 1 정규화 : 복수의 속성값을 갖는 속성을 분리
		제 2 정규화 : 주 식별자에 종속적이지 않는 속성의 분리 (부분 종속 속성 분리)
	
		1) 제 1 정규화를 만들기 위한 기본 테이블 구성
	
			DROP TABLE productex_0;
			CREATE TABLE productex_0 (
			pcode number, -- 제품번호
			pname varchar2(100), -- 제품명
			rcnt number(30), -- 재고수량
			ordernum char(5), -- 주문번호
			isexport char(1), -- 수출여부
			memnum number, -- 고객번호
			busnum number, -- 사업자번호
			priority number, -- 우선순위
			ordercnt number -- 주문수량
		);
		
		INSERT INTO productex_0 VALUES(1001, '모니터', 1990, 'AB345', 'X', 4520, 398201, 1, 150);
		INSERT INTO productex_0 VALUES(1001, '모니터', 1990, 'AD347', 'X', 2341, NULL, 3, 600);
		INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'CA210', 'X', 3280, 200212, 8, 1200);
		INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'AB345', 'X', 4520, 398201, 1, 300);
		INSERT INTO productex_0 VALUES(1007, '마우스', 9702, 'CB230', 'X', 2341, 563892, 3, 6900);
		INSERT INTO productex_0 VALUES(1201, '스피커', 2108, 'CB231', 'Y', 8320, NULL, 2, 80);
		
		SELECT * FROM productex_0;
		
		2) 제 1 정규화 : 중복적인 속성값을 분리하기 위함
		
			CREATE TABLE normal_product_1
			AS SELECT DISTINCT pcode, pname, rcnt
			FROM productex_0
			ORDER BY pcode;
			SELECT * FROM normal_product_1;
			
			DROP TABLE normal_orderlist_1;
			CREATE TABLE normal_orderlist_1
			AS SELECT pcode, ordernum, isexport, memnum, busnum, priority, ordercnt
			FROM productex_0;
			
			SELECT * FROM normal_product_1;
			SELECT * FROM normal_orderlist_1;
			
		3) 제 2 정규화 : 주 식별자에 종속되지 않는 속성 분리 및 부분 종속 속성을 분리하기 위함
		
			-- 주문 목록 테이블
				DROP TABLE ordermenu;
				CREATE TABLE ordermenu
				AS SELECT pcode, ordernum, ordercnt
				FROM productex_0;
				
				SELECT * FROM ordermenu;
				
			-- 주문 테이블
				DROP TABLE order_table;
				CREATE TABLE order_table
				AS SELECT ordernum, isexport, memnum, busnum, priority
				FROM productex_0;
				
				SELECT * FROM order_table;

	
	3. 아래 테이블을 제 1 정규화 과정을 거쳐 테이블을 구성하세요.
	고객번호	고객명	구매물건			구매건수
	1000	홍길동	사과,바나나,딸기		5,4,3
	1001	김길동	오렌지,수박,키위		5,3,2
	1002	신길동	망고,바나나,수박		3,2,1
	
		-- 기본 테이블 구성
		DROP TABLE orderlistexp1;
		CREATE TABLE orderlistexp1 (
			pcode number, -- 고객번호
			pname varchar(50), -- 고객명
			buyprod varchar(200), -- 구매물건
			buycnt varchar(200) -- 구매건수
		);
	
		INSERT INTO orderlistexp1 VALUES(1000, '홍길동', '사과,바나나,딸기', '5,4,3');
		INSERT INTO orderlistexp1 VALUES(1001, '김길동', '오렌지,수박,키위', '5,3,2');
		INSERT INTO orderlistexp1 VALUES(1002, '신길동', '망고,바나나,수박', '3,2,1');
	
		SELECT * FROM orderlistexp1;
	
		-- 제 1 정규화를 거친 테이블
		CREATE TABLE orderlistexp2
		AS SELECT * FROM orderlistexp1 WHERE 1=0;
		SELECT * FROM orderlistexp2;
		
		INSERT INTO orderlistexp2 VALUES(1000, '홍길동', '사과', '5');	
		INSERT INTO orderlistexp2 VALUES(1000, '홍길동', '바나나', '4');	
		INSERT INTO orderlistexp2 VALUES(1000, '홍길동', '딸기', '3');	
		INSERT INTO orderlistexp2 VALUES(1001, '김길동', '오렌지', '5');	
		INSERT INTO orderlistexp2 VALUES(1001, '김길동', '수박', '3');	
		INSERT INTO orderlistexp2 VALUES(1001, '김길동', '키위', '2');	
		INSERT INTO orderlistexp2 VALUES(1002, '신길동', '망고', '3');	
		INSERT INTO orderlistexp2 VALUES(1002, '신길동', '바나나', '2');	
		INSERT INTO orderlistexp2 VALUES(1002, '신길동', '수박', '1');	
	
		SELECT * FROM orderlistexp2;
	*/
		CREATE TABLE normalexp01_1(
			cus_num number,
			cun_name varchar2(50)
		);
		INSERT INTO normalexp01_1 VALUES(1000, '홍길동');
		INSERT INTO normalexp01_1 VALUES(1001, '김길동');
		INSERT INTO normalexp01_1 VALUES(1002, '신길동');
		SELECT * FROM normalexp01_1;
	
		CREATE TABLE normalexp01_2(
			cus_num number, -- 다음 제 2 정규화 과정을 위해 구매번호 buy_cnt를 넣어주는 것도 효과적이다.
			buy_product varchar2(50),
			cnt number
		);
		INSERT INTO normalexp01_2 VALUES(1000, '사과', 5);
		INSERT INTO normalexp01_2 VALUES(1000, '바나나', 4);
		INSERT INTO normalexp01_2 VALUES(1000, '딸기', 3);
		INSERT INTO normalexp01_2 VALUES(1001, '오렌지', 5);
		INSERT INTO normalexp01_2 VALUES(1001, '수박', 3);
		INSERT INTO normalexp01_2 VALUES(1001, '키위', 2);
		INSERT INTO normalexp01_2 VALUES(1002, '망고', 3);
		INSERT INTO normalexp01_2 VALUES(1002, '바나나', 2);
		INSERT INTO normalexp01_2 VALUES(1002, '수박', 2);
		SELECT * FROM normalexp01_2;
		-- 제 2 정규화 과정으로 구매번호를 추가하여
		-- 구매 테이블 : *구매번호 고객번호 물건번호 구매수량 (비식별자 관계), 물건테이블 : 물건번호, 물건명, 가격
		-- 구매 테이블 : *고객번호 *물건번호 구매수량 (식별자 관계), 물건테이블 : 물건번호, 물건명, 가격
	/*
	
	4. 아래 테이블을 정규화 과정(제 1,2 정규화)을 거쳐 테이블을 구성하세요.
	물건번호	물건명	가격		계약번호	구매자ID		구매자명	구매수량
	1000	사과		3000	A100	himan		홍길동	2
	1001	바나나	4000	A101	higirl		김영희	5
	1001	바나나	4000	A102	gooodman	오영희	6
	1002    오렌지	2000	A103	badboy		신영철	5
	
		-- 기본 테이블 구성
		DROP TABLE orderlistexp3;
		CREATE TABLE orderlistexp3 (
			pcode number, -- 물건번호
			pname varchar(50), -- 물건명
			price number, -- 가격
			joincode varchar(100), -- 계약번호
			buyid varchar(100), -- 구매자ID
			name varchar(100), -- 구매자명
			buycnt number -- 구매건수
		);
	
		INSERT INTO orderlistexp3 VALUES(1000, '사과', 3000, 'A100', 'himan', '홍길동', '2');
		INSERT INTO orderlistexp3 VALUES(1001, '바나나', 4000, 'A101', 'higirl', '김영희', '5');
		INSERT INTO orderlistexp3 VALUES(1001, '바나나', 4000, 'A102', 'gooodman', '오영희', '6');
		INSERT INTO orderlistexp3 VALUES(1002, '오렌지', 2000, 'A103', 'badboy', '신영철', '5');
	
		SELECT * FROM orderlistexp3;
	
		-- 제 1 정규화를 거친 테이블
	
	*/
		-- 제 1 정규화가 끝난 테이블
		CREATE TABLE normalexp02_1(
			pno number, -- 물건번호
			name varchar2(50), -- 물건명
			price NUMBER -- 가격
		);
		INSERT INTO normalexp02_1 VALUES(1000, '사과', 3000);
		INSERT INTO normalexp02_1 VALUES(1001, '바나나', 4000);
		INSERT INTO normalexp02_1 VALUES(1002, '오렌지', 2000);
		SELECT * FROM normalexp02_1;
			
		CREATE TABLE normalexp02_2(
			contno char(4),
			cusid varchar2(50),
			pno NUMBER,
			pname varchar2(50),
			bcnt NUMBER
		);
		INSERT INTO normalexp02_2 VALUES('A100', 'himan', 1000, '홍길동', 2);
		INSERT INTO normalexp02_2 VALUES('A101', 'higirl', 1001, '김영희', 5);
		INSERT INTO normalexp02_2 VALUES('A102', 'gooodman', 1001, '오영희', 6);
		INSERT INTO normalexp02_2 VALUES('A103', 'badboy', 1002, '신영철', 5);
		SELECT * FROM normalexp02_2;
	
		-- 제 2 정규화가 끝난 테이블
		CREATE TABLE normalexp02_3
		AS SELECT DISTINCT cusid, pname FROM normalexp02_2;
		SELECT * FROM normalexp02_3;
	
		CREATE TABLE normalexp02_4
		AS SELECT contno, cusid, bcnt FROM normalexp02_2;
		SELECT * FROM normalexp02_4;
	
		------------------------------------------------------------------------------
			
		-- 정규화가 안 된 테이블의 문제
		-- 1. 삽입, 삭제, 수정
		-- 삽입 : 부서정보가 확정이 안 된 상황에서 deptno, dname, loc 비워두고 처리를 해야하는 부분이 있다.
		--		 필요없이 임시 데이터를 입력해야 하는 경우.
		-- 삭제 : 사원번호 7839, 7782, 7934를 삭제하는 경우, 10번 부서정보가 삭제되어 다음에 10번 정보를 찾을 수가 없다.
		-- 수정 : 사원번호 7839의 부서명을 바꾸려 하는데 다른 사원의 부서명도 바꾸어야 하거나 일치하는 정보를 확인할 수 있다.
		-- 		 데이터의 무결성 문제가 발생하여 단계적으로 정규화가 필요로 한다.
		CREATE TABLE emp_dept_nm
		AS SELECT e.*, dname, loc
		FROM emp e, dept d
		WHERE e.deptno = d.deptno;
		SELECT * FROM emp_dept_nm;
	/*
	
 */