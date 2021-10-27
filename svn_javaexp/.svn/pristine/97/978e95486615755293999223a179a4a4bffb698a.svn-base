package javaexp.a07_exception;

import java.io.IOException;
import java.io.InputStream;

public class A03_MultiException {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 예외의 종류
1. 일반(컴파일 체크) 예외
	예외 처리 코드 없으면 컴파일 오류 발생
	ex) stream 관련 예외, 메모리 로딩 관련, 
		DB처리 등 io가 발생하는 경우 반드시 예외를 처리하여
		야 컴파일이 가능하다.(필수 예외 처리)
 * */
		/*
		InputStream io = System.in;
		try {
			// 예외를 처리 하지 않으면 컴파일이 되지 않는다.
			io.read();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
/*
2. 실행 예외(RuntimeException)
	1) 예외 처리 코드를 생략하더라도 컴파일이 되는 예외
	2) 예외의 가망성 있는 코드 작성시 필요
	3) 여러가지 실행 예외의 종류
		NullPointerException : 객체 참조가 없는 상태(객체 생성되지 않음)에서
			객체의 멤버를 호출하는 경우 발생..
		ArrayIndexOutOfBoundsException : 배열에서 인덱스 범위를
			초과하여 사용할 경우 발생.			
 * */		
		try {
		 System.out.println(1/0);
		}catch(ArithmeticException ae) {
			System.out.println("# 실행 예외 처리#");
			System.out.println(ae.getMessage());
		}
		try {
		System.out.println(args[0]);
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("# args의 해당 index 값이 없음 #");
			System.out.println(e.getMessage());
		}
/*
3. 여러가지 예외 처리 
	1) 예외는 계층 구조에 의해 최하위 예외를 먼저 처리하고,
	2) 상위 예외는 가장 마지막에 처리한다.
	3) 예외를 발생하든 발생하지 않든 처리할 구문은 finally{}에서 처리한다.
 * */	
		
			try {
				System.out.println("# jdbc 드라이버 메모리 로딩 #");
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("예외 발생:"+e.getMessage());
			} catch(Exception e) { // 예외클래스의 최상의 클래스
				System.out.println("기타 예외 발생:"+e.getMessage());
			} finally {
				System.out.println("예외 상관 없이 수행할 구문 처리");
			}
			System.out.println("예외 block 처리 끝!!!");
			
// ex1) int[] arry=null;
//			arr.length
//		String[] arr2 = {"사과","바나나"}
//			arr2[2]
//		위 코드와 기타 예외를 처리하고, 예외 발생 상관없이 처리할 block를 처리하세요.
			// NullPointerException
		try {	
			int[] arry=null;
			System.out.println(arry.length);
			String[] arr2 = {"사과","바나나"};
			//ArrayIndexOutOfBoundsException
			System.out.println(arr2[2]);
		}catch(NullPointerException e) {
			System.out.println("# null 예외 #");
			System.out.println(e.getMessage());
			
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("# 배열 예외 #");
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println("# 기타 예외 #");
			System.out.println(e.getMessage());
		}finally {
			System.out.println("기타 예외 발생!!");
		}
			
		
	}

}
