package javaexp.a06_inherit;

public class A01_Basic {
	
	/*	
# 상속은 java 프로그래밍의 핵심이라고 할 수 있다.
1. 객체를 재활용하고, 유지보수할 때, 다른 소스에 영향이 없으면서
확장성 있는 프로그래밍(응집성 있는 프로그래밍)을 할 때, 
반드시 알아야 할 지식이라고 할 수 있다.
2. 상속의 기본 프로그래밍
	1) 상위 클래스
	class Father{
		String shape="통통하다.";
		void running(){
			System.out.println("빠른 속도로 뛴다!!");
		}
	}
	class Son extends Father{
		Son클래스는 [접근제어자범위 안]에서 상위 클래스의
		구성요소를 사용할 수 있다.
		1. 외부에서 사용하는 경우  
			Son s1 = new Son()  
			s1.running();
		2. 내부구성요소로 호출..
		void gogo(){
	 		System.out.println("모습은 "+shape);
	 		running();
		}
	}
3. 상속의 종류
	1) 상위실제클래스 vs 하위실제클래스 상속
	2) 상위추상클래스 vs 하위실제클래스 상속
	3) 상위인터페이스 vs 하위실제클래스 상속

4. 추상클래스
	1) 오버라이딩 : 하위에서 상위 메서드 재정의 처리..
		overriding(재정의), polymorphism(다형성)
		
		
		
	2) 상속관계에서 상위에 body({}) 없는 메서드를 정의하면,
		이 메서드는 abstract붙은 추상메서드가 된다.
		추상메서드가 하나라도 있는 클래스 추상클래스로 선언이 되고,
	3) 추상클래스는 단독으로 객체생성을 하지 못 한다.
		
	*/	
	public static void main(String[] args) {
		
		
		Son s1 = new Son();
		s1.running();
		System.out.println(s1.shape);
		s1.gogo();
		Mother m1 = new Mother();
		Daughter d1 = new Daughter();
		d1.cooking();
		d1.callTalent();
	}
}
// ex) Mother 현명하다  cooking(),  
//     Daughter : Mother을 상속받아서 필드를 재활용하고,
//            추가필드와 메서드를 처리하여 호출하세요..
class Mother{
	String charac="현명하다";
	void cooking() {
		System.out.println("요리를 잘한다.");
	}
}
class Daughter extends Mother{
	String skill="주위 사람과 관계를 잘한다.";
	void callTalent() {
		System.out.println("# 딸의 재능 #");
		System.out.println(charac);
		cooking();
		System.out.println(skill);
	}
}


class Father{
	String shape="통통하다";
	void running() {
		System.out.println("빠른 속도로 뛴다!!");
	}
}
class Son extends Father{
	String height="키가 크다";
	void gogo() {
		// 선언한 필드나 메서드를 그대로 사용할 수 있다.
 		System.out.println("모습은 "+shape);
 		running();		
	}
}



