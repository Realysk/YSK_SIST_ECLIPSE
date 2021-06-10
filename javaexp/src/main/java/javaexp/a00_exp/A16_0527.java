package javaexp.a00_exp;

public class A16_0527 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
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
			
	3. 별칭선언의 기본 형식을 기술하세요.
		사원정보에서 사원번호를 번호, 사원명을 이 름, 급여를 연 봉으로 alias로 선언하여 출력하세요.
					
			select 컬럼명 as 별칭명,
		   		컬럼명 as 별칭명,
		   		컬럼명 별칭명,
		   		컬럼명 " 안 녕 하 세 요"
			from 테이블		
				 
	4. 사원 정보를 아래의 형식으로 출력하세요.
		부서번호를 %로 해서 보너스를 지정했다고 가정할 때,
		부서는 @@이고, 사원번호는 @@@, 급여는 @@@, 보너스 @@입니다. 한 라인으로 출력.
				 
	5. DB에 있어서 jdbc는 어떤 역할을 하는가?
		java database connection로 java 프로그램이나 DB Client 툴을 통해서 데이터베이스 서버에 연결해주는 모듈로 구성된 패키지이다.
		WEB 프로그램의 경우 javaexp\src\main\webapp\WEB-INF\lib에 프로젝트 단위로 위치시키면 클래스를 객체로 메모리에 로딩시켜서 사용할 수 있다.
	
	6. xe를 활용하여 db 서버에 접속하려고 한다. 필요로 하는 서버 등록 정보는 무엇인가?
		ip : 접속 주소
		port : 1521 기본 접속 포트
		sid : DB서버 식별자
		username : 계정명
		password : 비밀번호
		
 <<JAVA>>
	1. 예외의 종류 2가지를 기본 예제를 통해서 기술하세요.
				 	
			1) 일반(컴파일 체크) 예외
				예외 처리 코드가 없으면 컴파일 오류 발생
				ex) stream 관련 예외, 메모리 로딩 관련, DB처리 등 io가 발생하는 경우 반드시 예외를 처리해야 컴파일이 가능하다.
				 	(필수 예외 처리)
				 			
			2) 실행 예외(RuntimeException)
				- 예외 처리 코드를 생략하더라도 컴파일이 되는 예외
				- 예외의 가망성 있는 코드 작성시 필요
				- 여러가지 실행 예외의 종류
				 NullPointerException : 객체 참조가 없는 상태(객체 생성되지 않음)에서
				 객체의 맴버를 호출하는 경우 발생
				 ArrayIndexOutOfBoundsException : 배열에서 인덱스 범위를 초과하여 사용할 경우 발생.
				 	
	2. 예외 위임이란 무엇인지 기술하고,
		int [] iarr=null; iarr[0]; 코드가 포함되어 있는
		arrexp1(), arrexp2(), arrexp3() 예외 위임을 처리하세요.
			- 예외 위임이란 현재 메서드에서 처리할 예외를 다른 메서드와 함께 예외를 처리하게끔 메서드명 앞에 throws 예외명으로 예외를 위임하는 것을 말한다.			
*/
		try {
		arrexp1();
		arrexp2();
		arrexp3();
		} catch(NullPointerException e) {
			System.out.println("NULL 예외 : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			System.out.println("예외 상관없이 처리할 내용!!");
		}
	}
	static void arrexp1() throws NullPointerException {
		int [] iaar=null;
		System.out.println(iaar[0]);
	}
	static void arrexp2() throws NullPointerException {
		int [] iaar=null;
		System.out.println(iaar[0]);
	}
	static void arrexp3() throws NullPointerException {
		int [] iaar=null;
		System.out.println(iaar[0]);
	}
}
