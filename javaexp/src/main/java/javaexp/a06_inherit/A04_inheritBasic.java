package javaexp.a06_inherit;

public class A04_inheritBasic {
	
	/*
	 # 명시적인 부모 생성자 호출
	 	1. 부모 객체 생성할 때 부모 생성자 하위에 선택하여 호출.
	 		1) super(매개값)
	 			- 매개값과 동일한 타입, 갯수, 순서, 맞는 부모 생성자 호출.
	 		2) 부모 생성자가 없다면 컴파일 오류 발생.
	 		3) 반드시 자식 생성자의 첫 줄에 위치.
	 			생성자() {
	 				super(); // 첫 줄에 위치.
	 			}
	 			
	 # 메서드 재정의 (Override)
	 	1. 부모 클래스의 상속 메서드 수정해 자식 클래스에서 재정의 하는 것을 말한다.
	 	2. 메서드 재정의 조건
	 		1) 부모 클래스의 메서드와 동일한 이름으로 사용하여야 한다.
	 		2) 접근 제한을 더 강하게 재정의는 불가능하다.
	 			- 상위 메서드가 public이면 default나 private으로 재정의 불가.
	 			- 상위 메서드가 default이면 public으로 재정의 가능.
	 		3) 새로운 예외 throws 불가능하다.
	 	3. 부모 메서드와 구분하여 사용.
	 		1) 자식 클래스에서 재정의 되기 전 부모 메서드 호출을 할 때, super.부모메서드() 형식으로 선언한다.
	 
	 # final 키워드
	 	1. 필드 : 상수로 사용.
	 	2. final 클래스명 : 하위 상속클래스 선언 불가
	 	3. final 메서드 : 자식클래스에서 재정의 불가
	 	
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpiderMan m01 = new SpiderMan();
//		m01.name = "홍길동";
		m01.eat();
		m01.jump();
		m01.isSpider=true;
		m01.fireWeb();
		
		/*
		 ex1) Animal 종류 선언 - 달리다(), 먹다() 상속받은 Tiger 클래스 사냥하다() 추가하여 처리.
		 ex2) Animal 생성자를 통해서 kind 설정. eat() 재정의 하여 고기를 먹다 추가. 
		*/
		
		Tiger t01 = new Tiger();
		t01.kind = "호랑이";
		t01.run();
		t01.eat2();
		t01.isTiger=true;
		t01.hunting();
	}
}
class Animal {
	String kind;
	public Animal(String kind) {
		// TODO Auto-generated constructor stub
	}
	public void run() {
		System.out.println(kind + "가 달려간다!!");
	}
	public void eat2() {
		System.out.println(kind + "가 먹잇감을 찾았다!!");
	}
}
class Tiger extends Animal {
	boolean isTiger;
	Tiger() {
		super("호랑이");
	}
	public void eat2() {
		super.eat2();
		System.out.println(kind + "가 고기를 먹는다!");
	}
	public void hunting() {
		System.out.println(kind + "가 다음 사냥을 하러 간다!");
	}
}

class Person {
	String name;
	// 상위의 클래스 생성자를 통해서 할당.
	Person(String name) {
		this.name = name;
	}
	public void eat() {
		System.out.println(name + " 먹다!!");
	}
	public void jump() {
		System.out.println(name + " 뛰다!!");
	}
}
class SpiderMan extends Person {
	boolean isSpider;
	SpiderMan() {
		super("스파이더 맨"); // 상위에 선언된 생성자 반드시 호출하여야 한다.
	}
	// 상위에 있는 메서드 재정의
	public void jump() {
		super.jump(); // 상위에 있는 동일한 기능 메서드 호출.
		// 현재 재정의한 클래스와 구분하여 super.메서드로 처리.
		System.out.println("건물 사이를 뛰면서 나른다!!");
	}
	public void fireWeb() {
		System.out.println(name + " 거미줄을 발사하다!");
	}
}