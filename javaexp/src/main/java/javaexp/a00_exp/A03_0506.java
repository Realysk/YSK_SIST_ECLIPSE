package javaexp.a00_exp;

import javaexp.a00_exp.Movie;

/*
	1. 클래스와 객체와의 관계를 Movie 클래스 선언과 참조변수 m01, m02를 통해서 메모리와 함께 설명하세요.
		import a00_exp.Movie;
		
		Movie m01 = new Movie();	
		m01.name = "범죄도시";
		m01.rank = 1;
		m01.loc = "서울시 중계동";
		
		Movie m02 = new Movie();
		m02.name = "분노의질주";
		m02.rank = 2;
		m02.loc = "경기도 광주시";

		System.out.println("영화의 이름 : " + m01.name);
		System.out.println("영화의 순위 : " + m01.rank);
		System.out.println("영화의 개봉 지역 : " + m01.loc);
		System.out.println("영화의 이름 : " + m02.name);
		System.out.println("영화의 순위 : " + m02.rank);
		System.out.println("영화의 개봉 지역 : " + m02.loc);
		
	2. 클래스의 구성요소와 각 구성요소의 특징(생성자/메서드의 차이)에 대하여 기술하세요.
		- 생성자와 메서드가 있다. 이 둘의 차이는 생성자는 객체의 주제라고 생각하면 되고, 메서드는 그 주제를 담는 내용이라 생각할 수 있다.
		
	3. 클래스에서 this를 사용하는 경우에 대하여 기술하세요.
		- 지역변수를 의미한다. 이 말은 즉슨, 다른 클래스에서 불러오는 방식이 아닌 해당 클래스에서 즉흥적으로 써야하는 경우에 쓰인다.
		
	4. Calculator 클래스를 선언하고, 필드 값 (2개의 숫자)을 할당하여 합산의 값을 출력하세요.
	
	5. Calculator 클래스를 선언하고, 생성자로 필드 값을 할당하여 곱셈의 값을 출력하세요.
		Calculator c2 = new Calculator(5,7);
		System.out.println(c2.num01 + " + " + c2.num02 + " = " + (c2.num01 + c2.num02))
	
	6. Calculator 클래스를 선언하고, 생성자로 필드 값을 할당하여 메서드 plus(), minus(), divide(), multi()를 통해서
		덧셈, 뺄셈, 곱셈, 나눗셈을 출력하여 처리하세요.
			1. 생성자를 통해서 필드값을 초기화 처리.
			Calculator c3 = new Calculator(25,5);
			2. 같은 데이터를 통해서 여러가지 기능을 처리하는 메서드 구현
			c3.plus();
			c3.minus();
			c3.divide();
			c3.multi();

	7. 자바의 접근제어자 범위에 대하여 기술하세요.
		- 자바의 접근 제어자에는 4가지가 있다.
			private : 외부 객체에서는 사용이 불가능하다. 객체 내부에서만 사용이 가능하다.
	  		default : 앞서 선언한 같은 패키지 내에서만 사용할 수 있다.
	  		protected : 상속적인 관계이며 패키지가 달라도 사용이 가능하다.
	  		public : 패키지가 달라도 해당 구성에 접근이 가능하게 하는 것을 말한다.
	  		
	8. 추상클래스와 일반클래스의 차이점을 기술하세요.
		- 추상클래스는 일반클래스의 범위 한계에 다다를때 연장선으로 사용이 가능하다.
			단, 추상 메서드가 1개라도 있으면 추상 클래스이고 단독으로 객체 생성을 하지 못한다.
			만약 추상 클래스를 하위 클래스가 상속 받으면 반드시 추상메서드를 재정의를 해야 한다.
	
	9. Duck 추상클래스(quack() 꽥!!, flying()-추상메서드)에 상속받은 RubberDuck(고무오리), Mallard(청둥오리)를 선언하세요.
 */

public class A03_0506 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
