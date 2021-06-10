package javaexp.a09_api;

public class A08_Enum {
	/*
	 	# 상수를 효과적으로 열거형으로 사용할 때 쓰이는 데이터 유형 enum이라는 열거형 상수이다.
	 		1. 선언
	 			public enum 변수명 {사용할상수1, 상수2, 상수3...}
	 		2. 열거형 상수의 속성/메서드
	 			.values() : 배열로 상수 전체를 가져온다.
	 			.name() : 이름
	 			.ordinal() : enum의 포함되어 있는 순서 index 값
	 */
	public enum Colors {RED, BLACK, YELLOW, BLUE};
	public enum Flowers {SUNFLOWER, ROSE, ROSEBAY};

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 호출 및 활용..
		Colors color = Colors.BLACK;
		System.out.println(color);
		Colors[] cs = Colors.values();
		// for(단위 객체 : 배열형 데이터)
		for(Colors x:cs) {
			System.out.println(x.name() + "\t" + x.ordinal());
		}
		
		// ex) Flowers 상수로 꽃 이름 영문으로 3가지 설정하고 반복문 통해서 출력 처리하세요.
		
		Flowers[] fs = Flowers.values();
		for(Flowers x:fs) {
			System.out.println(x.name() + "\t" + x.ordinal());
		}
	}	
}
