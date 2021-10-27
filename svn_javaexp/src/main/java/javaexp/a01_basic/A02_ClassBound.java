package javaexp.a01_basic;

public class A02_ClassBound {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calcu c1 = new Calcu(25,30);
		System.out.println(c1.plus());
		System.out.println(c1.minus());
		System.out.println(c1.multi());
		System.out.println(c1.divide());
	}
}
/*
ex) 코드 계층적 block 처리
아래의 Calcu 클래스를 선언하고,
입력값 2개로 4칙연산을 처리하는 코드를 처리하되,
변수의 중괄호 선언 규칙에 의해서 선언하고 할당하고,
main()를 통해서 호출 하세요 (4조분들 결과물 전달해주세요)!
 * */
class Calcu{
	// 필드 선언
	// 1. 이 클래스에서 다 사용할 수 있는 전역변수 : class의 {}(중괄호)에서
	//    선언되어 있음..
	// 2. 이 클래스에서 모든 구성 멤버에서 사용될 수 있다.
	private int num01;
	private int num02;
	// 생성자 선언
	Calcu(int num03, int num04){
		// int num01 : 매개변수로 받는 데이터는 지역변수이기에
		// 다른 중괄호 블럭에서 사용할 수 없다.
		// 그러나, this.num01(전역변수)에 할당해서 데이터를 활용할 수 있다.
		this.num01 = num03;
		this.num02 = num04;
	}
	int plus() {
//		return num03*num04; 지역변수이기에 다른 중괄호 블럭에서 사용 불가
		return num01+num02; // 전역변수로 할당된 것은 사용이 가능하다.
	}
	int minus() {
		return num01-num02;
	}
	int multi() {
		return num01*num02;
	}
	int divide() {
		return num01/num02;
	}
	// 기능메서드 선언
	// 연산자 조건 처리..
}
