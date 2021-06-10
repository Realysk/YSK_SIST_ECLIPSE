package javaexp.a01_basic;

public class A05_LocalExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Product p1 = new Product(5000, 4530);
		System.out.println(p1.sum());
	}
}

/*
 	ex) Product 클래스 선언하여
 		생성자 : 물건명
 		기능메서드 : 가격, 갯수 입력받아
 		총계를 처리한 내용을 계층 구조 변수에 의해 처리하세요.
 */

class Product {
	private int price01;
	private int cnt01;
	// 객체 생성지 name의 필드 값을 할당.

	Product(int price02, int cnt02) {
		this.price01 = price02;
		this.cnt01 = cnt02;
	}

	int sum() {
		return price01 * cnt01;
	}
}