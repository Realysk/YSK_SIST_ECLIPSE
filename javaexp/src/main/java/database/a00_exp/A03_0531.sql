/*
 # 0531 정리문제 #
	ex1) sal+comm으로 연산하는 경우 comm null인 경우 문제가 발생한다.
		어떤 문제이고 이것을 해결하려면 어떤 처리를 해야 하는지 정리하세요.
		
		comm이 null인 경우는 숫자가 아니기 때문에 nvl함수를 이용해서 처리해야 한다.
	
		*/
			SELECT sal, comm, sal + comm "합산1",
			sal + nvl(comm, 0) "합산2"
			FROM emp;
		/*
	
	ex2) 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
	
		1) char(size) : 고정 길이 문자 데이터 타입
 		2) varchar2(size) : 가변 길이 문자 데이터 타입
 		3) number(p, s) : 정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입
 		4) date : 날짜/시간 형식을 저장하기 위한 데이터 타입
 			SYSDATE : 현재 오라클 시스템의 날짜를 저장하거나 불러올 때 사용된다.
 			*/
				SELECT ename, sysdate, hiredate
				FROM emp;
			/*
 		-----------------------------------------------------------------------
 		5) nvarchar2(size) : 국가별 문자 집합에 따른 size 크기의 문자/바이트문자 데이터 타입
 		6) rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 타입
 		7) blob : 대용량의 바이너리 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 		8) clob : 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 		9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입. 최대 4GB
 		10) timestamp(n) : date 데이터 타입의 확장된 형태. n은 millis second 자리수로 최대 9자리까지 표현 가능.
	
		*/
			
		/*
	
	ex3) 문자열을 저장하는 데이터 중 고정형과 가변형이 있다. 두 데이터 유형의 차이점을 기술하세요.
	
		고정형 데이터 : 코드형 데이터로 주민번호, 학번, 사번등에 해당된다.
		가변형 데이터 : 상황에 따라 변동되는 데이터를 의미한다.
	
	ex4) 데이터 유형을 확인하고, 학생테이블(번호, 이름, 국어, 영어, 수학)을 만들고 데이터를 입력하세요.
	
		*/
			DROP TABLE STUDENTS;
			CREATE TABLE STUDENTS (
				stuid char(8),
				name varchar2(20),
				kor varchar2(20),
				eng varchar2(20),
				math varchar2(20)
			);

			INSERT INTO STUDENTS VALUES ('20210531', '홍길동', '77', '86', '75');
			INSERT INTO STUDENTS VALUES ('20210530', '김길동', '57', '45', '55');
			INSERT INTO STUDENTS VALUES ('20210529', '박길동', '67', '67', '0');
			INSERT INTO STUDENTS VALUES ('20210528', '마길동', '99', '77', '11');
			INSERT INTO STUDENTS VALUES ('20210527', '구길동', '100', '100', '100');
			INSERT INTO STUDENTS VALUES ('20210526', '성길동', '27', '100', '86');
			INSERT INTO STUDENTS VALUES ('20210525', '최길동', '64', '33', '46');
			SELECT stuid 학번, name 이름, kor 국어점수, eng 영어점수, math 수학점수, kor+eng+math 총점, (kor+eng+math)/3 평균
			FROM STUDENTS;
		/*
	
	ex5) 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
	
		*/
			DROP TABLE SPORTSSTAR;
			CREATE TABLE SPORTSSTAR (
				name2 varchar2(20),
				comp varchar2(20),
				scor varchar2(20)
			);

			INSERT INTO SPORTSSTAR VALUES ('홍길동', '삼성', '224');
			INSERT INTO SPORTSSTAR VALUES ('김길동', 'LG', '177');
			INSERT INTO SPORTSSTAR VALUES ('박길동', '한화', '404');
			SELECT *
			FROM SPORTSSTAR;
		/*
	
	ex6) select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?
		
	ex7) where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
	
		where 컬럼명1 = 데이터
		and 컬럼명2 = 데이터
		비교 연산자
		논리 연산자
		기타 함수나 키워드
	
	ex8) between, in 구문의 기본형식을 선언하고 기본 예제를 기술하세요.
	
		*/
			SELECT ename, deptno
			FROM EMP e 
			WHERE deptno IN (10,20);
		
			SELECT *
			FROM emp
			WHERE sal BETWEEN 1000 AND 2000;
		/*
	ex9) 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.
	
		*/
			SELECT ename "사원이름", deptno "부서번호", c.*
			FROM emp c
			ORDER BY ename, deptno;
			WHERE deptno LIKE '%10%' AND deptno LIKE '%30%';
		/*
	
	ex10) 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요.(like %활용)
	
		*/
			SELECT ename, hiredate 입사일, ''||hiredate "입사일(문자)"
			FROM emp
			WHERE hiredate LIKE '%82%';
		/*
	
	ex11) 보너스가 급여의 20% 이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요.
		급여(sal), 보너스(comm)
	
		*/
			SELECT ename, sal, COMM
			FROM EMP e 
			WHERE comm >= sal*0.2
			AND deptno = 30;
		/*
	
	ex12) like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
	
		% : %를 어디다 앞 뒤 양쪽에 넣는 위치에 따라 검색되는 위치의 여부를 판단할 수 있다.
		_ : 특정 키워드를 찾기 위해 카운트를 해주는 역할이다. (ex. 마지막에서 2번째 '%N_')
	
		*/
			SELECT empno, ename
			FROM emp
			WHERE ename LIKE '%N';

			SELECT empno, ename
			FROM emp
			WHERE ename LIKE '__A%';
		/*
	
	ex13) 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요.(in subquery구문 활용)

		*/
			SELECT ename, hiredate
			FROM emp;
			SELECT max(hiredate) FROM emp;
			SELECT ename, hiredate
			FROM EMP e 
			WHERE hiredate in(SELECT max(hiredate) FROM emp);
		/*

*/