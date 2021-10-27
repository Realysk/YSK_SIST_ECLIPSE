package javaexp.a05_object;

public class A07_OOP {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 객체 지향 프로그래밍
1. OOP:Object Oriented Programming
 	1) 부품 객체를 먼저 만들고 이것들을 하나씩 조립해 완성해
 	프로그램을 만드는 기법을 말한다.
2. 객체(Object)란?
	1) 물리적 존재하는 것(자동차, 책,사람)
	2) 추상적인 것(회사, 날짜) 중에서 자신의 속성과 동작을 가지고
		프로그램적으로 의미가 있는 것.
	3) 객체는 필드(속성)과 메소드(동적)으로 구성된 자바 객체로 모델링이 가능
		한 것을 말한다.	

# 클래스의 구성요소
1. 필드
	1) 객체가 사용할 고유 데이터
	2) 객체가 가져야 할 상태 데이터
	3) 그외 객체 안에 또 호출되는 부품 데이터
2. 생성자
	1) 객체를 생성할 때, 사용하는 클래스명과 같은 함수
	2) default 생성자 :
		생성자는 아무것도 선언하지 않으면 클래스명과 
		동일한 매개변수 없는 생성자가 내부적으로 
		호출되어 사용할 수 있다.
	3) 사용자 생성자를 선언하는 순간, default 생성자를 
		사라지게 된다.
	4) 생성자는 this(매개변수데이터)로 생성자를 호출할 수 있다.
		
3. 메서드.
	1) 객체 생성 후, 기능적인 처리를 하는 함수를 말한다.
	2) 구성요소로 리턴할 타입, 메서드명, 매개변수, 실행 처리할 내용 등이 
		있다.
	3) 리턴 타입은 해당 기능 메서드를 호출했을 호출한 곳에 전달할 데이터
		유형을 선언하고, 실제 데이터를 전달 하는 것을 말한다.
		= 리턴값이 없을 때는 void라고 선언하고, 리턴 처리를 하지 않는다.
	4) 메서드는 여러 타입의 매개변수를 통해서 데이터를 입력받는다.
		기본유형, 객체
		cf) 객체를 매개변수를 선언하여 처리하면, 여러개의 기본 유형을
		선언하는 것보다 효율적으로 간편하게 선언하여 전달될 수 있는 
		특징을 가진다.
		void call(String name, int age, String loc){}
		void call(Person p){}
	5) 메서드는 입력값과 리턴사이에 특정한 프로세스를 처리한다.
		반복적이고 재활용해야할 내용을 기능 메서드를 통해서 처리할 수 
		있다.
		
	
		
 * */
		// 선언된 객체 생성.
		Z02_Bus b1 = new Z02_Bus();
		b1.no=7900; // 데이터 할당.
		b1.from="서울";
		b1.to="수원";
		System.out.println("할당된 속성값 확인:"+b1.no);
		System.out.println("할당된 속성값 확인:"+b1.from);
		System.out.println("할당된 속성값 확인:"+b1.to);
// ex) Z03_Computer 클래스를 선언하고, 속성으로 제조사/cpu/ram의 속성을
		// 선언하고, 해당 main()안에서 객체(2개)를 생성하고 필드를 할당하고,
		// 출력하세요.. (6조)
		// 해당 클래스의 default 생성자에 의해서 호출..
		// 가지고 있는 필드의 값 할당 및 호출 처리..
		Z03_Computer com01 = new Z03_Computer();
		com01.company="삼성전자";
		com01.cpu="3.2Ghz 4core";
		com01.ram="256G";
		Z03_Computer com02 = new Z03_Computer();
		com02.company="LG전자";
		com02.cpu="3.4Ghz 8core";
		com02.ram="500G";
		System.out.println(com01.company);
		System.out.println(com01.cpu);
		System.out.println(com01.ram);
		System.out.println(com02.company);
		System.out.println(com02.cpu);
		System.out.println(com02.ram);
		
		
//		Person p1 = new Person();
//		매개변수로 문자열을 입력하는 생성자를 선언하는 순간
//		default 생성자는 사라지게 된다.
//		생성자는 여러가지를 overloading 규칙에 의해 생성할 수 있다.
//		생성자는 객체 생성자 선택적으로 1개를 선택하여 호출할 수 있다.
		Person p2 = new Person();
		Person p3 = new Person("홍길동");
//		생성자는 일반적으로 필드의 값을 할당하여, 초기화 시킨다.
		Person p4 = new Person("오길동");
		System.out.println(p4.name);
//	ex) Note 클래스를 선언하고, default 생성자 호출/매개변수1개 있는 생성자
//		선언-가격할당/매개변수없는 생성자 선언/매개변수2개 있는 생성자 선언-가격,갯수
//		로 할당하여 처리결과를 출력하세요. (5조)
		Note n1 = new Note();
		System.out.println(n1.price+":"+n1.cnt);
		Note n2 = new Note(3000);
		System.out.println(n2.price+":"+n2.cnt);		
		Note n3 = new Note(2000,2);
		System.out.println(n3.price+":"+n3.cnt);		
	}
}
class Member{
	String id;
	String pass;
	String name;
	String auth;
	// 생성자 오버로딩(overloading) : 생성자가 이름이 동일하지만, 여러가지 선언할 수 있는
	// 규칙을 말한다. 메서드도 오버로딩이 적용되는데, 다음과 같이
	// 매개변수의 갯수가 다르거나, 갯수가 같더라도 타입이 다르게 선언된 경우나
	// 갯수가 같고 타입이 같더라도 순서가 다른 경우에 선언이 가능한 것을 말한다.
	/*
	# this
	1. 현재 클래스 안에 있는 구성요소(필드/생성자/메서드)
	2. 생성자나 메서드안에서
		this.필드 : 동일한 이름의 지역변수와 구분.. cf) js 반드시 써야 된다.
	3. this() : 현재클래스에 다른 매개변수로 있는 생성자를 호출할 때..
		cf)상속관계에서는 super() : 상위 클래스의 구성요소(생성자)
	3. this.메서드명() : 상속관계에서 오버라이딩시에 현재 클래스의 메서드와
	 	상위 클래스의 메서드(super.메서드명)를 구분할 때, 사용된다.
	
		
	 * */
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id) {
		this.id = id;
	}
	// 1. 갯수가 다르기 때문에 선언가능(오버로딩규칙1)
	public Member(String id, String pass) {
		this(id);
		this.pass = pass;
	}
	// 2. 갯수가 같더라도 타입이 다른 경우(오버로딩규칙2)
	public Member(String id, int pass01) {
		this(id);
	}	
	// 3. 갯수가 같고 타입이 같더라도 순서가 다른 경우(오버로딩규칙3)
	public Member(int pass01, String id ) {
		this(id);
	}		
	public Member(String id, String pass, String name) {
		this(id,pass); // 선언된 생성자를 활용하여 데이터를 처리를 효과적으로
		// 할 수 있다.
		this.name = name;
	}
	
}


class Person{
	String name;
	Person(){
		System.out.println("매개변수가 없는 생성자.ㅡ");
	}
	Person(String s){
		this(); // 현재 이 클래스에서 선언한 다른 생성자를 호출할 수 있다.
		name = s;
		
		System.out.println("문자열 매개변수가 있는 생성자1");
	}
	
}
class Note{
	int cnt;
	int price;
	Note(){   
	     System.out.println("매개변수가 없는 생성자");
	}
	Note(int p){
	    price = p;
	    System.out.println("문자열 매개변수1개 있는 생성자");
	}
	Note(int p,int c){
		price = p; 
		cnt = c;
		System.out.println("문자열 매개변수2개 있는 생성자");
   }
}