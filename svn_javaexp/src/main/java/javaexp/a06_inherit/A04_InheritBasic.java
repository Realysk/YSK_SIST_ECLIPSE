package javaexp.a06_inherit;

public class A04_InheritBasic {
/*
# 명시적인 부모 생성자 호출
1. 부모 객체 생성할 때, 부모 생성자 하위에 선택하여 호출.
	1) super(매개값...)
		- 매개값과 동일한 타입, 갯수, 순서 맞는 부모 생성자 호출
	2) 부모 생성자가 없다면 컴파일 오류 발생
	3) 반드시 자식 생성자의 첫 줄에 위치..
		생셩자(){
			super();// 첫줄에 위치.
		}
# 메소드 재정의 (override)
1. 부모 클래스의 상속 메소드 수정해 자식 클래스에서 재정의 하는 것을 말한다.
2. 메소드 재정의 조건
	1) 부모 클래스의 메소드와 동일한 이름으로 사용하여야 한다.
	2) 접근 제한을 더 강하게 재정의는 불가하다.
		- 상위 메서드가 public이면 default나 private으로 재정의 불가
		- 상위 메서드가 default이면 public으로 재정의 가능
	3) 새로운 예외 throws 불가능 하다.
3. 부모 메소드와 구분하여 사용.
	1) 자식 클래스에서 재정의되기 전 부모 메서드 호출을 할 때,
		super.부모메서드() 형식으로 선언한다.
		
# final 키워드
1. 필드 : 상수로 사용
2. final 클래스명: 하위 상속클래스 선언 불가
3. final 메소드 : 자식클래스에서 재정의 불가
		
 * */
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpiderMan m01 = new SpiderMan("홍길동");
		//m01.name = "홍길동(스파이더맨)";
		m01.eat();
		m01.jump();
		m01.isSpider=true;
		m01.fireWeb();
		
		Tiger t01 = new Tiger();
		t01.eat();
		t01.eat();
		t01.hunt();
	}
}
// EX) Animal 종류선언, 달리다(), 먹다()
//     상속받은 Tiger 클래스 사냥하다() 추가하여 처리 [5조]
class Person{
	String name;
	// 상위의 클래스 생성자를 통해서 할당.
	Person(String name){
		this.name = name;
	}
	public void eat() {
		System.out.println(name+" 먹다!!");
	}
	public void jump() {
		System.out.println(name+" 뛰다!!");
	}
}
class SpiderMan extends Person{
	boolean isSpider;
	SpiderMan(String name){
		super("스파이더 맨("+name+")"); 
		// 상위에 선언된 생성자 반드시 호출하여야 한다.
	}
	// 상위에 있는 메서드 재정의
	public void jump() {
		super.jump(); // 상위에 있는 동일한 기능메서드 호출.
		// 현재 재정의한 클래스와 구분하여 super.메서드로 처리..
		System.out.println("건물 사이를 뛰면서 나른다!!");
	}
	public void fireWeb() {
		System.out.println(name+" 거미줄을 발사하다!");
	}
}
class Animal {
	String kind;
	Animal(String kind){
		this.kind = kind;
	}
	public void run() {
		System.out.println(kind + " 달리다!");
	}
	public void eat() {
		System.out.println(kind + " 먹다!");
	}
}
// ex) Animal 생성자를 통해서 kind 설정.. eat() 재정의하여 고기를 먹다 추가.. 
class Tiger extends Animal {
	Tiger() {
		super("호랑이");
	}

	public void eat() {
		super.eat();
		System.out.println(kind + " 고기를 먹다.");
	}

	public void hunt() {
		System.out.println(kind + " 사냥을 하다.");
	}
}
