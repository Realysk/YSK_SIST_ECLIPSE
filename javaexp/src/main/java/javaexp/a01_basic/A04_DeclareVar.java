package javaexp.a01_basic;

public class A04_DeclareVar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * # 변수 이름 명명 규칙
		 * 1. 변수는 데이터 유형과 이름으로 선언한다.
		 * 	int num01; 유형 이름;(세미콜론)
		 * 		ex) Person p;
		 * 2. 변수 명으로 선언할 수 있는 이름을 다음과 같은 필수 및 관례(가독성)를 지켜야 한다.
		 * 	1) 변수 명의 첫 자는 문자여야 한다.
		 * 		특수문자는 $ _ 만 허용한다.
		 */
		int price;
		int $price;
		String _companyName; // (O)
		/*
		 * 2) 변수 명의 첫번째 글자를 숫자로 사용하지 못 한다.
		 * // int 1price; int 25price; // (X) // int price01; // int cnt25; // (O) /* 3)
		 * 변수 명은 대/소문자가 구별된다. 변수 명을 동일하게 선언하면 에러가 발생한다.
		 */
		int num01;
//		int num01; // 동일한 변수 명 에러 발생
		int nuM01; // 대소문자 구분하기 때문에 발생하지 않는다.
		int numPrice;
		int numprice; // 대소문자 구분되기 때문에 같은 변수가 아니다.
		/*
		 * 4) 변수 명은 일반적으로 영어 소문자로 시작하되 다른 단어와 합성어로 사용될 때는 구분하여 첫 자를 대문자로 사용한다. (관례 -
		 * 가독성) ex) 참조변수명, 메서드명 소문자로 시작
		 * 5) 문자 수 길이 제한이 없다.
		 * 		너무 간단하게 해서 본인이 이 변수를 나중에 이해하지 못 할 정도로 하지 말아야 한다.
		 * 6) 자바 예약어는(명령어로 내장된 것) 변수로 사용할 수 없다.
		 * String break;(X)
		 * int if;(X)
		 */
		String break02; // 변수 명에 숫자를 붙여서 예약어에서 벗어나는 것도 tip이다.
		String break01;
		/*
		 * # 변수의 사용
		 * 1) 선언
		 */
		int score;
		/*
		 * 2) 저장 ( = 대입연산자 (오른쪽에 있는 데이터로부터 왼쪽에 있는 변수로 할당)
		 */
		score = 25;
		/*
		 * 3) 호출
		 */
		System.out.println(score);
		/*
		 * 4) 선언과 저장
		*/
			String name = "홍길동";
		/*
		 * 지역변수(메서드 안에 선언된 변수)는 반드시 초기화를 호출 해야 컴파일이 가능하다.
		 * int num01; System.out.println(num01); (X)
		 */

		int num02 = 25; // 지역변수의 초기화 처리.
		System.out.println(num02); // (O)

		/*
		*/
	}
}
