package javaexp.a13_lambda;

public class A02_LambdaExp {
	// A02_LambdaExp.flyFunction()
	static void flyFunction(Flyway f1) {
		f1.fly();
	}
	
	static void swimFunction(SwimmingWay s1) {
		s1.swim();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1 인터페이스를 상위로 실제 객체 만들기
		Flyway f1 = new Flyway() {
			@Override
			public void fly() {
				System.out.println("우리 동네를 나르다!!");
			}
		};
		f1.fly();
		// 선언된 메서드에 인터페이스를 상속받은 익명 실제 객체를 바로 넘기면서 재정의된 내용을 수행하게 해주는 처리 형태
		flyFunction(new Flyway() {
			@Override
			public void fly() {
				// TODO Auto-generated method stub
				System.out.println("세계의 창공을 누비다! (함수)");
			}	
		});
		// 람다식 표현 1단계
		// 오버라이딩된 메서드를 바로 재정의 () -> { 처리 내용 }
		flyFunction(() -> {
			System.out.println("우주를 누비다.(람다식1)");});
		// 람다식 표현 2단계
		flyFunction(() -> 
			System.out.println("넓은 바다 위 창공을 나르다.(람다식2)"));
		
		// ex) SwimmingWay 인터페이스를 만들고 main() 익명의 실제 클래스를 구현하여 호수에서 수영을 하다라고 출력하세요.
		
		SwimmingWay s1 = new SwimmingWay() {
			@Override
			public void swim() {
				System.out.println("호수에서 수영을 하다.");
			}
		};
		s1.swim();
		
		// ex) static void swimFunction()을 선언하고 매개변수로 SwimmingWay를 받아서 처리하여
		// 1) 객체 생성
		// 2) 람다식1
		// 3) 람다식2
		
		swimFunction(() -> {
			System.out.println("호수에서 수영을 하다.(람다식1)");});
		swimFunction(() -> 
			System.out.println("넓디 넓은 호수 위에서 창공을 누비다.(람다식2)"));
	}
	
// 인터페이스 선언
interface Flyway {
	void fly();
	}

interface SwimmingWay {
	void swim();
	}
}