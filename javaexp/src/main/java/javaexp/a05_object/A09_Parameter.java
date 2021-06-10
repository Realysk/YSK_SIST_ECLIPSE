package javaexp.a05_object;

public class A09_Parameter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Product p1 = new Product();
		p1.setPrice(200);
		p1.setPrice(50);
		p1.setPrice(10);
		p1.setPrice(70); // int price = 70;
//		p1.setPrice("홍길동"); // int price = "홍길동"
		byte num01 = 24;
		p1.setPrice(num01); // int price = num01; (promote)
		char ch01 = 'A';
		p1.setPrice(ch01); // char ==> int (promote)일어나 가능하다.
		p1.calcu(300,2); // 선언된 갯수와 type에 맞게 데이터를 넘겨주면 된다.
		p1.calcu(4000,5); // 선언된 갯수와 type에 맞게 데이터를 넘겨주면 된다.
		
		Calculator c1 = new Calculator();
		byte b1 = 22;
		char b3 = 22;
		float b2 = 22243.343F;
		c1.inAllData(b1);
		c1.inAllData(b2);
		c1.inAllData(b3);
		
	}

	/*
	 ex) Calculator 클래스에
	 	1) 기본유형의 데이터를 받는 메서드 선언 후 출력
	 	2) plus() 두 개의 값을 합산, multi() 두 개의 값을 곱셉처리.
	 		모든 데이터가 다 입력이 가능하게 처리
	 */
}

class Calculator {
	void inAllData(double b) {
		System.out.println("inAllData : " + b);
	}
	void plus(double num01, double num02) {
		System.out.println("합산 : " + num01 + num02);
	}
	void multi(double num01, double num02) {
		System.out.println("곱셈 : " + num01 * num02);
	}
	void inbyte(byte b) {
		System.out.println("byte : " + b);
	}
	void inshort(short b) {
		System.out.println("short : " + b);
	}
	void inint(int b) {
		System.out.println("int : " + b);
	}
	void inlong(long b) {
		System.out.println("long : " + b);
	}
	void infloat(float b) {
		System.out.println("float : " + b);
	}
	void indouble(double b) {
		System.out.println("double : " + b);
	}
	void inboolean(boolean b) {
		System.out.println("boolean : " + b);
	}
}

class Product {
	// 매개변수는 해당 type을 할당하면 데이터를 받아서 처리한다.
	void setPrice(int price) { // 외부에서 입력된 실제 데이터를 할당하는 변수
		System.out.println("입력된 값 : " + price);
		System.out.println("입력된 값의 연산 : " + price*0.1);
	}
	void calcu(int price, int cnt) {
		System.out.println("물건 가격 : " + price);
		System.out.println("물건 갯수 : " + cnt);
	}
}