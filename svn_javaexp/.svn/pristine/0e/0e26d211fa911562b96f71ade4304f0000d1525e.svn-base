package javaexp.a07_exception;

public class A04_Throws {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 예외 위임
1. 자바의 예외는 메서드 단위로 예외를 위임할 수 있다.
2. 동일한 예외를 다른 메서드와 함께 동시에 처리할 때, 사용된다.
3. 위임된 예외는 공통적인 예외 처리하는 곳에서
 	try{ }catch(위임된 예외){}로 처리할 수 있다.
4. 기본 형식
 	public void 메서드명1() throws 예외클래스1, 예외클래스2..{
 		발생할 가능성이 있는 block
 	}
 	public void 메서드명2() throws 예외클래스1, 예외클래스2..{
 		발생할 가능성이 있는 block
 	} 	
 	
 	try{
 		메서드명1();
 		메서드명2();
 	}catch(예외클래스1 e){
 	
 	}catch(예외클래스2 e){
 	
 	}
*/
		try {
			call1();
			call2();
			call3();
		}catch(ArithmeticException  e) {
			System.out.println(e.getMessage());
		}catch(NullPointerException  e) {
			System.out.println(e.getMessage());
		}catch(ArrayIndexOutOfBoundsException  e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		try {
			findClass1();
			findClass2();
			findClass3();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			System.out.println("예외 상관 없이 처리할 내용!!");
		}

		
	}	
	static void call1() throws ArithmeticException {
		System.out.println("call1() 메서드");
		System.out.println(1/0);
	}
	static void call2() throws NullPointerException{
		System.out.println("call2() 메서드");
		String s=null;
		System.out.println(s.toLowerCase());
	}
	static void call3() throws ArrayIndexOutOfBoundsException{
		System.out.println("call3() 메서드");
		String str[] = {"사과"};
		System.out.println(str[2]);
	}
 // ex) 아래와 같은 메서드명으로 예외 위임과 위임된 예외를 처리해주세요.
//      findClass1() Class cls = Class.forName("java.lang.String1");
//      findClass2() Class cls = Class.forName("java.lang.String2");
//      findClass2() Class cls = Class.forName("java.lang.String3");
	static void findClass1() throws ClassNotFoundException {
		// 컴파일 예외(필수예외)!!
		Class cls = Class.forName("java.lang.String1");
	}
	static void findClass2() throws ClassNotFoundException {
		// 컴파일 예외(필수예외)!!
		Class cls = Class.forName("java.lang.String2");
	}	
	static void findClass3() throws ClassNotFoundException {
		// 컴파일 예외(필수예외)!!
		Class cls = Class.forName("java.lang.String3");
		
	}	
	
	
}
