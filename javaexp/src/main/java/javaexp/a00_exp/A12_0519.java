package javaexp.a00_exp;

import java.util.Scanner;

public class A12_0519 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 정리 문제
		 
		 	1. 클래스와 객체의 차이점을 예제 코드와 함께 기술하세요.
		 	
		 		클래스 : 개발자의 실제 코드를 선언한다. 앞으로 만들어질 객체를 위한 설계도 역할을 한다.
		 		객체 : main()메서드가 있는 클래스에서 class명과 생성자를 통해서 실제 객체를 생성하고 기능 메서드를 통해서 여러가지 프로세스를 처리한다.
		 		class Person {
		 			String name;
		 			void show() {
		 				System.out.println("이름은 " + name);
		 			}
		 		}
		 		main()
		 			Person p01 = new Person();
		 			p01.show();
		 	
		 	2. default 생성자가 무엇인지 기술하고 Calcu 클래스를 선언하고 생성자로 두개의 값을 받아서 객체 4개를 생성하고 사칙연산을 처리하는 내용을 기술하세요.
		 	
		 		default : class 선언시, 생성자를 선언하지 않더라도 jvm(java virtual machine)에 의해서 내부적으로 생성되는 생성자를 말한다.
		 				사용자 정의 생성자를 선언하는 순간 사라진다.
		 		
		 		*/
					Calcu c1 = new Calcu(); // default 생성자 호출.
					// 다른 생성자를 선언하더라도 사라지지 않게 하려면 다시 생성자를 선언한다.
					Calcu c2 = new Calcu(25, 5);
					Calcu c3 = new Calcu(25, 5);
					Calcu c4 = new Calcu(30, 5);
					Calcu c5 = new Calcu(50, 5);
					System.out.println(c2.num01 + " + " + c2.num02 + " = " + (c2.num01+c2.num02));
					System.out.println(c3.num01 + " - " + c3.num02 + " = " + (c3.num01-c3.num02));
					System.out.println(c4.num01 + " * " + c4.num02 + " = " + (c4.num01*c4.num02));
					System.out.println(c5.num01 + " / " + c5.num02 + " = " + (c5.num01/c5.num02));
				/*		 	
		 				 	
		 	3. 생성자/메서드 overloading이란 무엇인가? 기본 예제와 함께 설명하세요.
		 		
		 		Overloading : 동일한 이름을 갖고 있지만 서로 다른 매개변수 형식을 갖고 있는 메서드를 여러 개로 정의하는 것을 의미한다.
		 						매개변수의 갯수, 데이터 유형, 유형이 다른 순서로 가능하다.
		 			 	
		 	4. 생성자 안에서 this()를 사용하는 목적을 기술하고 Product 클래스 안에서 물건명, 가격, 갯수를 생성자의 매개변수가 없을 때
		 		1개, 2개, 3개 있게 선언하고 this()를 활용하여 선언된 생성자를 사용하세요.
		 				 		
		 		*/
					Product p1 = new Product();
					Product p2 = new Product("사과");
					Product p3 = new Product("바나나",3000);
					Product p4 = new Product("오렌지",2000,5);
				/*
		 	
		 	5. 메서드의 기본형식을 선언하고 primitive 데이터유형, 배열, 객체를 리턴하는 것을 선언하고, main()메서드에서 해당 내용을 출력하는 예제를 만드세요.
		 	
		 		- 메서드 기본형식
		 		
		 			접근제어자 리턴유형 메서드면(매개변수1, 매개변수2 ... ) {
		 				프로세스 처리
		 				return 리턴할 데이터;
		 			}
		 		
		 		*/
//					MethodExp e1 = new MethodExp();
//					boolean return01 = e1.getMethod08();
//					System.out.println("리턴할 데이터 : " + return);
//					Calcu cal = e1.getMethod10();
//					System.out.println("리턴한 객체 : " + cal.num01);
//					System.out.println("리턴한 객체 : " + cal.num02);
				/*
		 			
		 	6. 메서드의 매개변수를 통해 기본유형의 변수 할당과 객체형의 할당의 차이점을 기술하세요.
		 	
		 		기본유형의 변수 할당 : 기본유형은 데이터 값을 그대로 할당시킨다.
		 		객체형의 할당 : 값이 저장된 주소 값을 할당시킨다.
		 		
		 		클래스와 객체 개념과 비슷하다.
		 	
		 	7. OnLineLibrary 클래스를 선언하고 기능 메서드를 login(Member m), lent(Book b)를 처리하세요.
		 		login()메서드로는 입력된 id,pass가 goodMan/7777일 때 로그인 성공, 그 외에는 로그인 실패 문자열 리턴 처리
		 		lent()메서드로는 반납기한 @@ 인 @@@ 대출 처리로 출력하세요.
		 		
		 		*/
//					OnLineLibrary on2 = new OnLineLibrary();
//					on2.login(new Person("goodMan",7777));
				/*
		 	
		 	8. MathExp 클래스에 기능 메서드 gugu(구구단의 출력할 단수), totAll(1부터 합산 할 마지막 수 입력), withComMavel(내가 입력한 주사위 수)
		 		- 내가 입력한 주사위 수와 컴퓨터가 랜덤처리한 주사위 수로 승/무/패 출력하세요.
		 		
		 		*/
					
				/*
		  
		  
		 */
	}

}

class MathExp {
	void gugu() {
		System.out.println("구구단 시작 단수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int grade = s.nextInt();
		for (int b = 1; b <= 9; b++) {
			System.out.println(grade + "X" + b + "=" + grade * b);
		}
	}
	void totAll() {
		System.out.println("1부터 합산 할 마지막 수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int lastno = s.nextInt();
		int tot = 0;
		for (int startno = 1; startno <= lastno; startno++) {
			tot += startno;
			System.out.println(startno);
			if (startno == lastno) {
				System.out.println(" = " + tot);
			} else {
				System.out.println(" + ");
			}
		}
	}
	void withComMavel() {
		System.out.println("주사위 수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int me = s.nextInt();
		int robot = (int)(Math.random()*6+1);
		System.out.println("당신의 주사위 : " + me);
		if (me <= 0 || me > 6) {
			// 범위에 대한 처리
			System.out.println("1부터 6까지의 숫자를 선택해주세요!");
		} else {
				System.out.println("로봇의 주사위 : " + robot);
			} if (me < robot) {
				System.out.println("졌어요 ㅠㅠ!");
			} else {
				System.out.println("무승부에요!");
			}
	}
}


class Product {
	private String name;
	private int price;
	private int cnt;
	Product() {
		System.out.println("# 물건 객체 생성 #");
	}
	Product(String name) {
		this();
		this.name = name;
		System.out.println("물건명 할당 : " + name);
	}
	Product(String name, int price) {
		this(name);
		this.price = price;
		System.out.println("가격 할당 : " + price);
	}
	Product(String name, int price, int cnt) {
		this(name, price);
		this.cnt = cnt;
		System.out.println("갯수 할당 : " + cnt);
	}
	
}

class Person {
	Person(String name){} 			// # 오버로딩 규칙
	Person(String name, int age){ } // 1. 갯수가 다름
	Person(String name, String loc){ } // 2. 타입이 다름
	Person(int age, String name){ } // 3. 타입의 순서가 다름
}

class Note {
	int price;
	int cnt;
	Note() {
		System.out.println("매개변수가 없는 생성자");
	}
	Note(int p) {
		price = p;
		System.out.println("문자열 매개변수 1개만 있는 생성자");
	}
	Note(int p, int c) {
		price = p;
		cnt = c;
		System.out.println("문자열 매개변수 2개 있는 생성자");
	}
}

class MethodExp {
	byte getMethod01() {
		byte num01 = 25;
		return num01;
	}
	short getMethod02() {
		short num01 = 25;
		return num01;
	}
	char getMethod03() {
		char num01 = 25;
		return num01;
	}
	int getMethod04() {
		int num01 = 25;
		return num01;
	}
	long getMethod05() {
		long num01 = 25L;
		return num01;
	}
	float getMethod06() {
		float num01 = 25.254F;
		return num01;
	}
	double getMethod07() {
		double num01 = 25.2357;
		return num01;
	}
	boolean getMethod08() {
		boolean isPass = 70>=80;
		return isPass;
	}
	int[] getMethod09() {
		int arry[] = {2, 5, 35};
		return arry;
	}
	Calcu getMethod10() {
		return new Calcu(30,25);
	}
	// main() e1.setInfo("홍길동",25,"서울신림동");
	// Person p01 = new Person("김길동",27,"서울방배동");
	// main() e1.setInfo(p01);
	// 하나의 객체로 할당.
	void setInfo(Person p) {
		
	}
}

class Person02 {
	String name;
	int age;
	String loc;
}

class Calcu {
	int num01;
	int num02;
	public Calcu() {}
	public Calcu(int num01, int num02) {
		super();
		// TODO Auto-generated constructor stub
		this.num01 = num01;
		this.num02 = num02;
	}
}


// 3번 문제

class Member {
	String id;
	String pass;
	String name;
	String auth;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id) {
		this.id = id;
	}
	// 1. 갯수가 다르기 때문에 선언 가능 (오버로딩규칙1)
	public Member(String id, String pass) {
		this(id);
		this.pass = pass;
	}
	// 2. 갯수가 같더라도 타입이 다른 경우 (오버로딩규칙2)
	public Member(String id, int pass01) {
		this(id);
	}
	// 3. 갯수가 같고 타입이 같더라도 순서가 다른 경우 (오버로딩규칙3)
	public Member(int pass01, String id) {
		this(id);
	}
	public Member(String id, String pass, String name) {
		this(id,pass); // 선언된 생성자를 활용하여 데이터 처리를 효과적으로 할 수 있다.
		this.name = name;
	}
}

// 7번 문제
class OnLineLibrary {
	public String login(Member m) {
		return m.id.equals("himan")&&m.pass.equals("7777")?
				"로그인 성공":"로그인 실패";
	}
	public void lent(Book bk) {
		System.out.println("반납기한 " + bk.getTerm() + " 인 도서" + bk.getTitle() + " 대출");
	}
}
class Book {
	private String title;
	private String term;
	public Book(String title, String term) {
		super();
		this.title = title;
		this.term = term;
		// TODO Auto-generated constructor stub
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
}

class Member01 {
	String id;
	String pass;
	public Member01(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
}