package javaexp.a07_exception;

public class A02_ExceptionExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 예외 처리
		 	1. 자바는 프로그래밍의 안정의 확보를 위해 예외 처리를 지원한다.
		 	2. 예외 처리를 통해서 예외가 나더라도 프로그램을 종료가 될 수 있게 한다.
		 	3. 기본 형식
		 		try {
		 			예외가 나타날 가망성이 있는 코드.
		 		} catch(Exception e) {
		 			예외가 발생했을 때 코드
		 		}
		 		
		 # 예외 처리 순서
		 	1. 예외 가능성 있는 코드를 실행
		 	2. 예외 발생 및 발생 예외 클래스 복사
		 	3. try{}catch(복사한 예외 클래스){}
		 	4. 예외 내용 확인 및 테스트
		 */
		
//		ex1) A02_ExceptionExp.java
//		String s=null; s.toString();
//		코드가 예외가 발생하더라도 수행될 수 있게 처리하세요.
		
		try {
			System.out.println("실행1");
			System.out.println("실행2");
			String s = null; s.toString();
		} catch(NullPointerException e) {
			System.out.println("예외 내용 : " + e.getMessage());
		}
		System.out.println("프로그램 종료!!");
	}
}
