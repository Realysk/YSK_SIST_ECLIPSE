package javaexp.a13_lambda;

public class A01_Basic {
	
	/*
	 # 람다식 표현
	 	1. 메서드 (함수)에 대한 표현방식을 보다 간편하게 화살표 형식으로 표현하는 것을 말한다.
	 	2. 주로 메서드의 익명함수로 바로 사용할 때 활용된다.
	 */
	
	static void call(String print) {
		System.out.println("출력내용 : " + print);
	}
	// 기능 메서드가 매개변수로 인터페이스를 가져온다.
	public static void useFIMethod(FunctionInterface1 fi) {
		fi.methodA();
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 상위 인터페이스 = 하위 객체
		Show s1 = new RealObj();
		// 재정의 메서드 호출
		s1.call01();
		// 상위 인터페이스 = 하위 인터페이스명으로 하위 객체를 익명으로 선언
		// * 선언한 내용을 호출하는 것이 아니라 프로그래밍 메모리를 로딩하는 main()에서 익명으로 선언항 바로 사용하게 처리하는 형태를 말한다.
		Show s2 = new Show() {
			@Override
			public void call01() {
				// TODO Auto-generated method stub
				System.out.println("인터페이스의 익명 실제 객체 메서드");
			}
		};
		s2.call01();
		
		useFIMethod (new FunctionInterface1() {
			@Override
			public void methodA() {
				// TODO Auto-generated method stub
				System.out.println("안녕하세요(익명의 재정의 메서드)");
			}
		});
		
		// 람다식으로 표현1
		useFIMethod(() -> {
			System.out.println("람다식1으로 익명 인터페이스 메서드 호출");
		});
		// 람다식으로 표현2
		useFIMethod(() ->
			System.out.println("람다식1으로 익명 인터페이스 메서드 호출"));
	}

}
interface Show {
	void call01(); // 추상 메서드 선언
}
class RealObj implements Show {
	@Override
	public void call01() {
		// TODO Auto-generated method stub
	System.out.println("안녕하세요");	
	}
}
interface FunctionInterface1 {
	void methodA();
}