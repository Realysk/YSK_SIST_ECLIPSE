package javaexp.a05_object.access.friendship;

public class WoodCutter {
	private String hiddenCloth = "뒷동산 바위 밑에";
	
	String hiddenDeer = "덤불속에 숨김";
	private String name;
	
	void callData(String name) {
//		# 지역변수 : 메서드나 생성자 내부중괄호({})에서 사용되는 변수.
//		1. 매개변수 : 입력받은 데이터를 해당 중괄호 내에서만 사용할 수 있다.
//		2. 메서드 안에서 선언한 변수
		int age = 25;
//		3. 지역변수의 전역변수화 : 지역변수의 데이터를 전역변수에 할당하면,
//			해당 데이터는 전역변수에서 사용할 수 있게 된다.
		this.name = name;
//		4. 지역변수와 전역변수의 식별 : 동일한 이름의 지역변수와 전역변수는
//			this.를 통해서 구분하여 사용할 수 있다.
		System.out.println(hiddenCloth);
		System.out.println(hiddenDeer);
	}

}
