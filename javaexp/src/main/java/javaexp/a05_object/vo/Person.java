package javaexp.a05_object.vo;

// 하나의 클래스, 객체를 위한 도면과 같은 역할..
public class Person {
	// 클래스에서 사용되는 필드(구성요소1)
	// 클래스의 특정 속성을 나타낸다.
	// 전역변수 : 클래스내부에 모두가 사용될 수 있는 변수 : 필드
	public String name;
	public int age;
	public String loc;
	// 클래스에서는 클래스와 동일한 명칭을 가진 기능
	// 함수가 있는데 이것을 생성자라고 한다.(구성요소2)
	// 생성자를 일반적으로 속성(필드)를 초기 한다.
	// 그래서 리턴값이 없다.
	// Peron p01 = new Person(); // Person()부분을 지칭한다.
	public Person(){
		System.out.println("생성자 호출!!");
	}
	// 매개변수가 3개가 있는 생성자 선언..
	// main()메서드에서 객체 생성시, 선언된 type과 순서가 동일한
	//  생성자로 생성하여야 한다.
	//  Person p01 = new Person("홍길동", 25, "서울 신림동") (O)
	//  new Person( 25, "홍길동" "서울 신림동") (X)
	//  new Person("홍길동", "25", "서울 신림동") (X)
	public Person(String name, int age, String loc) {
		// 입력 매개변수와 this.필드의 속성으로 구분하여 데이터를 
		// 초기화(초기값 할당)을 처리한다.
		// 매개변수로 들어오는 데이터는 생성자에서만 사용할 수 있는 변수
		// 즉, 지역변수이다.
		// 이것을 = (대입연산)와 this.필드명으로 구분된 전역변
		this.name = name;
		this.age = age;
		this.loc = loc;
		
	}
	// Person p01 = new Person("홍길동", 25, "서울 신림동")
	// p01.name에는 "홍길동"이라는 문자열이 들어가 있다.
	// p01.age에는 25
	// p01.loc에는 "서울신림동"이 할당되어 데이터의 초기화를 효율적으로
	// 할 수 있다.
	
	
	
	// 클래스 내에서 기능을 처리하는 메서드(구성요소3)
	public String call() {
		System.out.println("기능 메서드 호출..");
		return "문자열 리턴";
	}
	
	
	
	
}
