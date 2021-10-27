package javaexp.a01_basic;

import java.util.Vector;

public class A04_DeclareVar {

	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		#  변수 이름 명명 규칙
		1. 변수는 데이터유형과 이름으로 선언한다
			int num01;
			유형 이름;(세미콜론)
			ex)
			Person p;
		2. 변수명으로 선언할 수 있는 이름을 다음과 같은 필수 및 관례(가독성)
			를 지켜주어야 한다.
			1) 변수명의 첫번째 글자는 문자이어야 한다.
				특수문자는 $, _ 만 허용한다. */
				
//				int price; int $price; String _companyName; //(O)
			/*	
			2) 변수명의 첫번째 글자를 숫자로 사용하지 못 한다. */
//				int 1price; int 25price; //(X)
//				int price01; 
//				int cnt25;  //(O)
			/*	
			 * 
			 * 
			3) 변수명은 대/소문자가 구별된다. 
				변수명을 동일하게 선언하면 에러가 발생한다.
			*/	
			int num01;
//			int num01; 동일한 변수명 에러 발생
			int nuM01; //대소문자 구분하기 때문에 발생하지 않는다.
			int numPrice;
			int numprice; // 대소문자 구분되기 때문에 같은 변수가 아니다.
//			4) 변수명은 일반적으로 영어 소문자로 시작하되, 다른 단어와 합성어
//			로 사용될 때는 구분하여 첫자를 대문자로 사용한다(관례-가독성)
//				ex) 참조변수명, 메서드명 소문자로 시작
			int fruitCnt = 15;
			String studentName="홍길동";
			Vector v01;
//			void setName(), void callFriend()
//				cf) 클래스명, 생성자명은 관례로 대문자로 시작한다.
//					class Person{   Person(){}}
//			5) 문자 수 길이 제한이 없다.
//				너무 간단하게 해서 본인이 이 변수를 나중이 이해하지 못 할 정도로
//				하지 말아야 된다. i, j, k.... n
//			    idx, setName  .. 
//			6) 자바 예약어는(명령어로 내장된 것) 변수명으로 사용할 수 없다.
//			String break;(X)
//			int if;(X)
			String break02;
			String break01; 
			// 변수명에 숫자를 붙여서 예약어에서 벗어나는 것도 tip이다.
//		# 변수의 사용
//			1) 선언
			int score;
//			2) 저장 ( = 대입연산자(오른쪽에 있는 데이터로부터 왼쪽에 있는 변수로 할당)
			score = 25;
			
//			3) 호출
			System.out.println(score);
//			4) 선언과 저장
			String name = "홍길동";
			// 지역변수(메서드 안에 선언된 변수)는 반드기 초기화를 호출하여야
			// 컴파일이 가능 하다.
			// 클래스안에 쓰이는 전역변수는 초기화하지 않더라도 하단에서
			// 사용이 가능하다.
			// class Person{
			//     String name;
			///    void call(){ System.out.println(name);}
			//}
			
//			int num01;
//			System.out.println(num01);// (X)*/
			int num04=25;	// 지역변수의 초기화 처리를 하여서
			// 호출해서 사용할 수 있다.
			System.out.println(num04); // (O)
			
			
			
			
			

	}

}
