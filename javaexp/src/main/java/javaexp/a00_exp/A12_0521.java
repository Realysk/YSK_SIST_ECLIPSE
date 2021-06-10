package javaexp.a00_exp;

import java.util.Scanner;

public class A12_0521 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
1. 클래스와 객체의 차이점을  예제 코드와 함께 기술하세요. 
	클래스 : 개발자의 실제 코드로 선언한다. 앞으로 만들어질
		객체를 위한 설계도 역할을 한다.
	객체 : main()메서드가 있는 클래스에서 class명과
		생성자를 통해서 실제 객체를 생성하고, 기능 메서드를
		통해서 여러가지 프로세스를 처리한다.
	class Person{
		Strin name;
		void show(){
			System.out.println("이름은 "+name);
		}
	}
	main()
		Person p01 = new Person();
		p01.show();
		
2. default 생성자가 무엇인지 기술하고, Calcu
    클래스를 선언하고, 생성자로 두개의 값을 받아서, 객체 4개를 생성하고
    사칙연산 처리하는 내용을 기술하세요.
	default 생성자란 class 선언시, 생성자를 선언하지 않더라도
	jvm(java virtual machine)에 의해서 내부적으로 생성되는
	생성자를 말한다.
	사용자 정의 생성자를 선언하는 순간 사라진다.
*/
		Calcu c1 = new Calcu(); // default 생성자 호출.
		// 다른 생성자를 선언하더라도 사라지지 않게 할려면
		// 다시 생성자를 선언한다.
		Calcu c2 = new Calcu(25,5);
		Calcu c3 = new Calcu(25,5);
		Calcu c4 = new Calcu(30,5);
		Calcu c5 = new Calcu(50,5);
		System.out.println(c2.num01 + " + "+ c2.num02+" = "+(c2.num01+c2.num02)); 
		System.out.println(c3.num01 + " - "+ c3.num02+" = "+(c3.num01+c3.num02)); 
		System.out.println(c4.num01 + " * "+ c4.num02+" = "+(c4.num01+c4.num02)); 
		System.out.println(c5.num01 + " / "+ c5.num02+" = "+(c5.num01+c5.num02)); 
			
/*
3. 생성자/메서드 overloading이란 무엇인가? 기본 예제와 함께 설명을 하세요.
	동일한 이름의 생성자나 메서드를 선언할 수 있는 규칙을 매개변수에 의해서
	결정하는 것을 말한다.
	매개변수의 갯수, 데이터 유형, 유형이 다른 순서로 가능하다.
class Person{
	Person(String name){}			// #오버로딩 규칙
	Person(String name,int age){ } // 1. 갯수가 다름
	Person(String name,String loc){ } // 2. 타입이 다름
	Person(int age,String name){ } // 3. 타입의 순서가 다름
	
}

4. 생성자 안에서 this()를 사용하는 목적을 기술하고, Product 클래스 안에서
    물건명, 가격, 갯수를 생성자의 매개변수없을 때, 1개,2개,3개 있게 선언하고,
    this()를 활용하여 선언된 생성자를 사용하세요. 
   	this() : 현재 선언된 매개변수에 따른 생성자를 호출
class Product{
	private String name;
	private int price;
	private int cnt;
	Product(){
		System.out.println("# 물건 객체 생성 #");
	}
	Product(String name){
		this();
		this.name = name;
		System.out.println("물건명 할당:"+name);
	}
	Product(String name, int price){
		this(name);
		this.price = price;
		System.out.println("가격 할당:"+price);
	}
	Product(String name, int price, int cnt){
		this(name, price);
		this.cnt = cnt;
		System.out.println("갯수 할당:"+cnt);
		
	}
}
	main()
		Product p1 = new Product();
		Product p2 = new Product("사과");
		Product p3 = new Product("바나나",3000);
		Product p4 = new Product("오렌지",2000,5);	
5. 메서드의 기본형식을 선언하고, primitive데이터유형, 배열, 객체를 리턴하는 것을
    선언하고, main()메서드에서 해당 내용을 출력 처리하는 예제를 만드세요.
    
    접근제어자 리턴유형 메서드명(매개변수1, 매개변수2...){
    	프로세스 처리
    	return  리턴할데이터;
    }
*/
		MethodExp e1 = new MethodExp();
		boolean return01 = e1.getMethod8();
		System.out.println("리턴할데이터:"+return01);
		Calcu cal = e1.getMethod10();
		System.out.println("리턴한 객체:"+cal.num01);
		System.out.println("리턴한 객체:"+cal.num02);
		
/*		

6. 메서드의 매개변수를 통해 기본유형의 변수 할당과 객체형의 할당의 차이점을 기술하세요.
	// 전체적으로 각각의 변수로 할당.
	void setInfo(String name, int age, String loc) {
		
	}
	// main()  e1.setInfo("홍길동",25,"서울신림동");
	// Person p01 = new Person("김길동",27,"서울방배동");
	// main()  e1.setInfo(p01);
	// 하나의 객체로 할당.
	void setInfo(Person p) {
		
	}
	

7. OnLineLibrary 클래스를 선언하고, 기능 메서드롤 login(Member m), 
	lent(Book b) 을 처리하세요. login() 메서드로는 입력된 id, pass가 goodMan/7777일때 로그인 성공 그외는
    로그인실패 문자열 리턴 처리, lent() 메서드로는 반납기한 @@인 도서 @@@ 대출
    처리로 출력하세요.
8. MathExp 클래스에 기능 메서드 gugu(구구단의 출력할 단수), 
            totAll(1부터 합산할 마지막수입력),  
            withComMavel(내가 입력한 주사위수)
                - 내가 입력한 주사위 수와 컴퓨터가 랜덤처리한 주사위 수로 승/무/패 출력.
 * */

	}
}

class MathExp {
	void gugu() {
		System.out.println("구구단의 출력할 단수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int grade = s.nextInt();
		for (int b = 1; b <= 9; b++) {
			System.out.println(grade + "X" + b + "=" + grade * b);
		}
	}

	void totAll() {
		System.out.println("1부터 합산할 마지막 수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int lastno = s.nextInt();
		int tot = 0;
		for (int startno = 1; startno <= lastno; startno++) {
			tot += startno;
			System.out.print(startno);
			if (startno == lastno) {
				System.out.println(" = " + tot);
			} else {
				System.out.print(" + ");
			}
		}
	}

	void withComMavel() {
		System.out.println("주사위 수를 입력하세요!");
		Scanner s = new Scanner(System.in);
		int me = s.nextInt();
		int robot = (int) (Math.random() * 6 + 1);
		System.out.println("당신의 주사위 : " + me);
		if (me <= 0 || me > 6) {
			// 범위에 대한 처리
			System.out.println("1부터 6까지의 숫자를 선택해주세요!");
		} else {
			System.out.println("로봇의 주사위 : " + robot);
			if (me > robot) {
				System.out.println("이기셨어요!");
			} else if (me < robot) {
				System.out.println("졌어요 ㅠㅠ!");
			} else {
				System.out.println("무승부에요!");
			}
		}

	}
}

class OnLineLibrary{
	public String login(Member m) {
		return m.id.equals("himan")&&m.pass.equals("7777")?
				"로그인 성공":"로그인 실패";
	}
	public void lent(Book bk) {
		System.out.println("반납기한 "+bk.getTerm()
			+"인 도서 "+bk.getTitle()+"대출");
	}
}
class Book{
	private String title;
	private String term;
	public Book(String title, String term) {
		super();
		this.title = title;
		this.term = term;
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
class Member{
	String id;
	String pass;
	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
	
}

class MethodExp{
	byte getMethod1() {
		byte num01 = 25;
		return num01;
	}
	short getMethod2() {
		short num01 = 25;
		return num01;
	}
	char getMethod3() {
		char c01 = 'A';
		return c01;
	}
	int getMethod4() {
		int num01 = 25;
		return num01;
	}
	long getMethod5() {
		long num01 = 25L;
		return num01;
	}
	float getMethod6() {
		float num01 = 25.25F;
		return num01;
	}
	double getMethod7() {
		double num01 = 25.2433;
		return num01;
	}
	boolean getMethod8() {
		boolean isPass = 70>=80;
		return isPass;
	}	
	int [] getMethod9() {
		int []arry = {2,5,35};
		return arry;
	}	
	Calcu getMethod10() {
		return new Calcu(30,25);
	}	
	// 전체적으로 각각의 변수로 할당.
	void setInfo(String name, int age, String loc) {
		
	}
	// main()  e1.setInfo("홍길동",25,"서울신림동");
	// Person p01 = new Person("김길동",27,"서울방배동");
	// main()  e1.setInfo(p01);
	// 하나의 객체로 할당.
	void setInfo(Person p) {
		
	}
	
	
}
class Person{
	String name;
	int age;
	String loc;
	public Person(String name, int age, String loc) {
		super();
		this.name = name;
		this.age = age;
		this.loc = loc;
	}
	
}

class Calcu{
	int num01;
	int num02;
	public Calcu() {}
	public Calcu(int num01, int num02) {
		super();
		this.num01 = num01;
		this.num02 = num02;
	}
	
	
}