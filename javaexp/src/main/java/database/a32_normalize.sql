/*
 # 정규화
 	1. 목표
 		1) 정규화의 필요성과 이상 현상의 의미를 이해한다.
 		2) 정규화를 수행하기 위해 함수 종속성의 개념을 이해한다.
 		3) 정규형의 유형과 관계를 이해하고 실제 예를 통해 정규화 과정을 진행할 수 있다.
 	2. 목차
 		1) 이상현상에 대한 이해
 		2) 함수 종속성 개념
 		3) 정규화 과정
 			제 1 정규형
 			제 2 정규형
 			제 3 정규형
 			보이스/코드 정규형
 			제 4 정규형
 			제 5 정규형
 	3. 정규화와 이상 현상
 		1) 이상 현상 : 불필요한 데이터 중복으로 인해 릴레이션에 대한 데이터 삽입, 수정, 삭제 연산을 수행할 때 발생할 수 있는 부작용
 		2) 정규화 과정 : 이러한 이상 현상을 제거하면서 데이터베이스를 무결성 있게 설계해 나가는 과정
 	4. 이상 현상의 종류
 		1) 삽입 이상 : 새 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야 하는 문제
 		2) 갱신 이상 : 중복 튜플 중 일부만 변경하여 데이터가 불일치하되 되는 모습의 문제
 		3) 삭제 이상 : 튜플을 삭제하면 꼭 필요한 데이터까지 함께 삭제되는 데이터 손실의 문제
 	5. 함수 종속성
 		1) 속성들 간의 관련성
 			ex) 컬럼간의 관련성을 의미한다.
 		cf) 정규화란 함수적 종속성을 이용하여, 릴레이션(테이블을 연관성이 있는 속성(컬럼)들로만 구성되도록 분해하여
 			이상 현상이 발생하지 않는(무결성 있는 데이터) 올바른 릴레이션(테이블관계)으로 만들어 나가는 과정
 		2) 함수 종속
 			"X가 Y를 함수적으로 결정한다."
 			X -> Y 로 표현 (X는 결정자, Y는 종속자)
 			보통 X를 테이블의 key로 만들었고 Y는 그 구성요소들을 말한다.
 			ex) 사원번호 -> (사원명, 직책, 입사일, 급여, 보너스)
 			사원번호 -> 사원명, 사원번호 -> 직책
 		3) 함수 종속 관계 판단 시 유의 사항
 			속성 자체의 특성과 의미를 기반으로 함수 종속성을 판단해야 함
 				- 속성 값은 계속 변할 수 있으므로 현재 릴레이션(테이블)에 포함 된 속성(컬럼)의 값만으로 판단하면 안 됨.
 			일반적으로 기본키(사원번호)와 후보키(주민번호)는 릴레이션(테이블)의 다른 모든 속성(컬럼)들을 함수적으로 결정한다. (결정자)
 			기본키(사원번호)나 후보키(주민번호)가 아니어도 다른 속성 값을 유일하게 결정하는 속성은 함수 종속 관계에서 결정자가 될 수 있음.
 		4) 완전 함수 종속
 			릴레이션(테이블)에서 속성집합(컬럼1의 데이터) Y가 속성집합(컬럼2의 데이터) X에 함수적으로 종속되어 있지만
 			속성집합 X(컬럼2의 데이터)의 전체가 아닌 일부분에는 종속되지 않음을 의미
 			일반적으로 함수 종속은 완전 함수 종속을 의미한다.
 			ex) 당첨 여부는 key인 {고객ID, 이벤트번호}에 완전 함수 종속됨.
 		5) 부분 함수 종속
 			릴레이션(테이블)에서 속성집합(컬럼1의 데이터) Y가 속성집합(컬럼2의 데이터) X의 전체가 아닌 일부분에서 함수적으로 종속됨을 의미
 			ex) 고객이름은 {고객ID, 이벤트번호}에 부분 함수 종속된다.
 		# 고객ID -> 고객명 : 고객명은 고객ID에 완전 종속적
 			{고객ID, 이벤트번호} -> 당첨여부 : 당첨여부는 고객ID와 이벤트번호(복합키)에 완전 종속
 			{고객ID, 이벤트번호} -> 고객명 : 고객명은 고객ID와 이벤트번호(복합키)에 부분 종속		
 	6. 정규화
 		1) 개념 : 함수 종속성을 이용해 릴레이션(테이블)을 연관성이 있는 속성들로만 구성되도록 분해하여
 				 이상 현상이 발생하지 않는 올바른 릴레이션(테이블)로 만들어 가는 과정
 				 - 기본 목표 : 관련이 없는 함수 종속성은 별개의 릴레이션으로 표현
 		2) 주의 사항 : 정규화를 통해 릴레이션(테이블)은 무손실 분해 되어야 한다.
 					 - 릴레이션(테이블)의 의미상 동등한 릴레이션(테이블)들로 분해되어야 하고 분해로 인한 정보 손실이 발생하지 않아야 함.
 					 - 분해 된 릴레이션(테이블)들을 자연 join(where 분해 후 테이블.컬럼 = 분해 후 테이블.컬럼)하면 분해 전의 릴레이션(테이블)으로 복원 가능해야 함.
 		3) 정규형(NF:Normal form)
 			릴레이션(테이블)이 정규화(분해) 된 정도
 			각 정규형마다 제약조건이 존재
 				- 정규형의 차수가 높아질수록 요구되는 제약조건이 많아지고 염격해짐
 			릴레이션(테이블)의 특성을 고려해서 적합한 정규형으로 나아가진다.
 		4) 정규화 과정
 			기본 정규형 = 제 1 정규형, 제 2 정규형, 제 3 정규형, 보이스/코드(BCNF)
 			고급 정규형 = 제 4 정규형, 제 5 정규형
 			상위 정규가 끝나야 하위 정규화 과정을 진행할 수 있다.
 				제 1 정규형 > 제 2 정규형 > 제 3 정규형 > 보이스/코드(BCNF) > 제 4 정규형 > 제 5 정규형
 	7. 제 1 정규화
 	8. 제 2 정규화
 	9. 제 3 정규화
 		1) 이행적 함수 종속성
 			릴레이션(테이블)을 구성하는 3개의 속성(컬럼) 집합 X, Y, Z에 대해 함수 종속 관계가 X -> Y, Y -> Z가 존재하면
 			논리적으로 X -> Z가 성립되는데 이 때 Z가 X에 이행적으로 함수 종속되었다고 함.
 		2) 릴레이션(테이블)이 제 2 정규형에 속하고 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이 되지 않으면 제 3 정규형을 만족함.
 			제 2 정규형에 속하는 릴레이션(테이블)이 제 3 정규형을 만족하게 하려면
 				- 모든 속성이 기본 키에 이행적 함수 종속이 되지 않도록 분행.
 */

CREATE TABLE normal_exp03(
	cus_id varchar(50),
	grade varchar(10),
	discount number
);
INSERT INTO normal_exp03 VALUES('apple', 'gold', 0.1);
INSERT INTO normal_exp03 VALUES('banana', 'vip', 0.2);
INSERT INTO normal_exp03 VALUES('carrot', 'gold', 0.1);
INSERT INTO normal_exp03 VALUES('orange', 'silver', 0.05);
SELECT * FROM normal_exp03;

CREATE TABLE normal_exp03_1
AS SELECT cus_id, grade FROM normal_exp03;
SELECT * FROM normal_exp03_1;

CREATE TABLE normal_exp03_2
AS SELECT DISTINCT grade, discount FROM normal_exp03;
SELECT * FROM normal_exp03_2;

-- ex) 위 테이블과 데이터를 제 3 정규화 처리하여 ERD와 SQL 코드를 처리하세요.

/*
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
 */

SELECT * FROM normal_orderlist_1;
SELECT memnum, busnum, priority
FROM productex_0;

CREATE TABLE normal_order_1_3
AS SELECT ordernum, memnum
FROM normal_orderlist_1;

CREATE TABLE normal_order_2_3
AS SELECT DISTINCT memnum, busnum, priority
FROM normal_orderlist_1;
6
SELECT * FROM normal_order_1_3;
SELECT * FROM normal_order_2_3;

/*
		 식별자 관계 : 참조하는 테이블의 키를 현재 테이블에 키로 같이 사용할 때
		 	ex) 고객이 물건 하나의 주문을 사용할 때
		 	컬럼을 최소로 사용할 수 있지만 테이블 간에 연관 관계가 많을 때 복합키를 많이 만들어야 되면 복잡성은 높아질 때가 많다.
		 	
		 비식별자 관계 : 참조하는 테이블의 키를 현재 테이블에 키로 사용하지 않을 때
		 	ex) emp dept 관계
		 	pk 컬럼을 따로 잡아 컬럼이 추가 되는 경향이 있지만 복잡성이 많은 테이블 연관 관계는 보다 효과적으로 테이블 관계를 정리할 수 있는 특징이 있다.
 	
 	10. 보이스/코드 정규형 (BCNF:Boyce/Codd Normal Form)
 		1) 필요성
 			하나의 릴레이션(테이블)에 여러 개의 후보키(사원 테이블에 주민번호, 복합 된 후보키)가 존재하는 경우 제 3 정규형까지 모두 만족해도 이상 현상이 발생할 수 있다.33
 	
 */

CREATE TABLE normalform3(
	cus_id varchar2(50),
	ilesson varchar2(50),
	tech_id varchar2(50)
);
INSERT INTO normalform3 VALUES('apple', '영어회화', 'P001');
INSERT INTO normalform3 VALUES('banana', '기초토익', 'P002');
INSERT INTO normalform3 VALUES('carrot', '영어회화', 'P001');
INSERT INTO normalform3 VALUES('carrot', '기초토익', 'P004');
INSERT INTO normalform3 VALUES('orange', '영어회화', 'P003');
INSERT INTO normalform3 VALUES('orange', '기초토익', 'P004');

SELECT * FROM normalform3;

-- ex) 보이스코드 정규화를 처리해서 제출하세요.
CREATE TABLE normalform_boyce_1
AS SELECT cus_id, ilesson 
FROM normalform3;
CREATE TABLE normalform_boyce_2
AS SELECT DISTINCT tech_id, ilesson
FROM normalform3
ORDER BY tech_id;
SELECT * FROM normalform_boyce_1;
SELECT * FROM normalform_boyce_2;

/*
 제 4 정규형 : 릴레이션(테이블)이 보이스/코드 정규형을 만족하면서 함수 종속이 아닌 다치 종속(MVD; Mulit Valued Dependency)을 제거하면 제 4 정규형에 속함.
 제 5 정규형 : 릴레이션(테이블)이 제 4 정규형을 만족하면서 후보키를 통하지 않는 join 종속 (JD; Join Dependency)을 제거하면 제 5 정규형에 속함
 
 # 정규화 시 주의 사항
 	모든 릴레이션(테이블)이 제 5 정규형에 속해야만 바람직한 것은 아님.
 	일반적으로 제 3 정규형이나 보이스/코드 정규형에 속하도록 릴레이션(테이블)을 분해하여 데이터 중복을 줄이고 이상 현상을 해결하는 경우가 많음.
 	
 *** 결국 정규화 규칙은 원자성이라는 개념에 의해 원인에 대한 분석으로 1~5 정규 및 보이스코드 정규를 처리하기에 식별자와 비식별자를 통해 효과적으로 이상현상(삽입/삭제/수정)
 	이 발생하지 않도록 테이블을 분해시켜가는 과정으로 진행하면 된다.
 */