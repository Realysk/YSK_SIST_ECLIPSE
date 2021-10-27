package javaexp.a05_object;

public class A15_StaticFinal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# final
1. 클래스의 일반 필드명 앞에 붙으면, 초기데이터를
	할당한 이후에 변경이 불가능하게 한다.
2. final만 붙으면 객체마다 변경할 수 없는 필드를
	가지고 있게 한다.
# static final
1. 객체 공유메모리, 고정된 클래스의 상수를 설정한다.

 * */
		Person04 p1 = new Person04("홍길동");
		Person04 p2 = new Person04("김길동");
		p1.getAge();
		p1.getAge();
		p1.getAge();
		p1.getAge();
		p1.getAge();
		p2.getAge();
		p2.getAge();
		p1.age=25;
//		p1.name="마길동"; 객체 단위로 한번 할당된 것은 변경이 불가능하다.
//		Person04.KIND="동물"; 클래스 단위로 한번 할당된 것은 변경이 불가능하다.
		
//	ex) Animal  final 상수로 동물의 종류, static final로 동물로 설정..
//				일반변수로 먹이의 종류 *	
//			생성자를 통해서 동물의 종류
//			setFood(먹이의 종류)
//			eatFood() 
//		    	(동물)인  [사자]가 먹이 @@@을 먹다.  [3조]
		Animal an1 = new Animal("사자");
		an1.setFeed("토끼");
		an1.eatFood();
		an1.setFeed("사슴");
		an1.eatFood();
		Animal an2 = new Animal("토끼");
		an2.setFeed("클로버");
		an2.eatFood();
	}

}
class Animal{
	static final String ALIAS="동물"; // 클래스 단위 변경되지 않는 상수
	final String KIND; //객체 단위 변경되지 않는 상수
	String feed; // 객체 단위로 변경되는 변수
	public Animal(String kind) {
		this.KIND = kind;
	}
	public void setFeed(String feed) {
		this.feed = feed;
	}
	public void eatFood() {
		System.out.println(ALIAS+"인 "+KIND+"가  먹이 "+feed+" 먹다!!");
	}
	
}
class Person04{
	int age;	
	final String name; // 객체단위로 변경불가
	static int EARCH_RESOURCE; // 객체 공유 메모리
	static final String KIND="사람"; // 클래스로 한번 할당 변경불가.
	public Person04(String name) {
		this.name = name;
	}
	public void getAge() {
		age++;
		System.out.println(KIND+"인 "+name+"의 나이를 먹다! 현재 나이:"+age);
	}
	
	
	
}
