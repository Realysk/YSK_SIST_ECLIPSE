/*
 # 정리문제
	1. 테이블 컬럼의 테이블 타입을 변경할 시, 제약사항을 기술하세요.
	
		*/
		
		/*
	
	2. emp의 구조만 있는 emp41 테이블을 생성하고 숫자형 컬럼을 문자형으로 변경하세요.
	
		*/
		
		/*
	
	3. 테이블명과 컬럼명을 변경시키는 코드를 기술하세요.
	
		*/
		
		/*	
	
	4. 인덱스의 기본형식과 유형을 기술하세요.
		
		- 기본 형식
		create index 인덱스명
 		on table명(컬럼명)
 		
 		1) 일반 index : 데이터의 중복 가능 index
 		2) 고유 index : 유일한 값을 가지는 컬럼에 대해 생성하는 index로 모든 index key는 테이블의 하나의 행과 연결되어 있다.
 			- 기본 형식
 				create unique index 인덱스명
 				on 테이블(컬럼명)
 		3) 단일 index : 하나의 컬럼으로만 구성 된 index
 		4) 결합 index : 두 개 이상의 컬럼을 결합하여 생성하는 index
 			- 기본 형식
 				create index 인덱스명
 				on 테이블명(컬럼명1, 컬럼명2)
 		5) descending index
 			- 컬럼별로 정렬 순서를 별도로 지정하여 결합 index를 생성하기 위한 방법을 말한다.
 			- 기본 형식
 				create index 인덱스명 on 테이블명(컬럼명1 desc, 컬럼2 asc);
 		6) 함수 기반 index
 			- 컬럼에 대한 연산이나 함수의 계산 결과를 index로 생성하는 것을 말한다.
 			- 함수 기반 index는 insert, update시에 새로운 값을 index에 추가한다.
 			- 기본 형식
 				create index 인덱스명 on 테이블(함수(컬럼));			
	
	5. emp38테이블에 index로 deptno(내림차순)와 empno(오름차순)로 중복 처리되게 하세요.
	
		*/
			
		/*	
	
	6. user01/8888계정을 생성하고, 접속하여 테이블을 생성하세요.
	
		*/
			CREATE USER user01 IDENTIFIED BY 8888;
			GRANT CREATE SESSION TO user01;			
		/*
	
	7. 부서정보가 함께 있는 부서명별 최고 급여자 사원 정보가 있는 emp42테이블을 만들고 mgr은 관리자명으로 데이터유형과 데이터를 변경 처리하세요.
	
		*/
			
		/*		
	
 */