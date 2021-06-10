/*
 # 정리 문제
 <<DB>>
 	1. SELECT 문의 기본 형식을 기술하세요.
		select *
		from 테이블명;
		
		select 컬럼명1, 컬럼명2..
		from 테이블명
		where 조건문
		group by 그룹할 컬럼
		having 그룹의 조건
		order by 정렬컬럼 desc;
 	
	2. 사원정보(emp)에서 부서번호, 사원번호, 사원명, 급여를 출력하세요.
	
		*/
			SELECT DEPTNO, EMPNO, SAL
			FROM emp;
		/*
	
	3. 별칭선언의 기본 형식을 기술하세요.
		사원정보에서 사원번호를 번호, 사원명을 이 름, 급여를 연 봉으로 alias로 선언하여 출력하세요.
			
		select 컬럼명 as 별칭명,
   			컬럼명 as 별칭명,
   			컬럼명 별칭명,
   			컬럼명 " 안 녕 하 세 요"
		from 테이블		
									
		*/
			SELECT EMPNO AS "번호",
				ENAME AS "이 름",
				SAL AS "연 봉"
			FROM emp;
		/*
		 
	4. 사원 정보를 아래의 형식으로 출력하세요.
		부서번호를 %로 해서 보너스를 지정했다고 가정할 때,
		부서는 @@이고, 사원번호는 @@@, 급여는 @@@, 보너스 @@입니다. 한 라인으로 출력.
		
		*/
			SELECT sal, deptno || '%' "보너스",
					sal*deptno/100 "보너스 금액",
					'부서는 '||deptno||'이고, 사원번호는 '|| empno ||', 급여는 '|| sal ||', 보너스 '|| sal*deptno/100 ||'입니다.' show
			FROM emp;
		/*
		 
	5. DB에 있어서 jdbc는 어떤 역할을 하는가?
		java database connection로 java 프로그램이나 DB Client 툴을 통해서 데이터베이스 서버에 연결해주는 모듈로 구성된 패키지이다.
		WEB 프로그램의 경우 javaexp\src\main\webapp\WEB-INF\lib에 프로젝트 단위로 위치시키면 클래스를 객체로 메모리에 로딩시켜서 사용할 수 있다.
	
	6. xe를 활용하여 db 서버에 접속하려고 한다. 필요로 하는 서버 등록 정보는 무엇인가?
		ip : 접속 주소
		port : 1521 기본 접속 포트
		sid : DB서버 식별자
		username : 계정명
		password : 비밀번호
 */