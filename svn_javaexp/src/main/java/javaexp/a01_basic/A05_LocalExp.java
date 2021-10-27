package javaexp.a01_basic;

public class A05_LocalExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Product p1 = new Product("사과");
		p1.setPrice(3000);
		p1.setCnt(2);
		int returnData = p1.showInfo();
		System.out.println("리턴된 데이터:"+returnData);
	}

}
/*
ex) Product 클래스 선언하여
//		생성자로 물건명
 * 		기능메서드로 가격, 갯수를 입력받아서,
 * 		총계를 처리한 내용을
 * 	계층 구조 변수(전역변수/지역변수 구분)에 의해 처리하세요
 * 	5조 분들 제출해주세요..
 * 		개념 파악이 안되거나 
 * 		문제 파악 안되신 분들은 사전에 메시지 주세요.
 * 		
 * 
 * */
class Product{
	private String name;
	private int price;
	private int cnt;
	// 객체 생성지 name의 필드값을 할당.
	public Product(String name) {
		super();
		this.name = name;
	}
	// 생성 후, 기능메서드로 필드값 price, cnt 할당.
	public void setPrice(int price) {
		// int price는 입력 받은 지역변수
		// this.price는 지역변수와 필드값을 구분하기 위하여 this.
		//    사용한 전역변수.
		// 
		this.price = price;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int showInfo() {
		System.out.println("구매한 물건명:"+name);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		System.out.println("총비용:"+price*cnt);
		return price*cnt;
	}
	
}