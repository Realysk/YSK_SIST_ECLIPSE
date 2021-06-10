package javaexp.a05_object;

public class Z01_Person {
	private String name = "홍길동";
	String address = "서울시 강남구 대치동";
	protected String inherit = "고향에 있는 상속할 땅";
	public String announce = "우리 5/25에 결혼해요!!";

	public void call() {
		// 같은 클래스 내에서는 field에 선언한 데이터 접근이
		System.out.println(name);
		System.out.println(address);
		System.out.println(inherit);
		System.out.println(announce);
	}
}
