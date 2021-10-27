package javaexp.a00_exp.a05;

public class A03_0506 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//# 아래 내용 풀어서 17:40까지 개인톡으로 올려주세요..
//1. 클래스와 객체와의 관계를 Movie클래스 선언과 참조변수 m01, m02를 통해서
//    메모리와 함께 설명하세요.
//    클래스는 객체를 위한 code를 위한 처리 역할로 건물로 비유하면 도면과 같다.
//    이러한 클래스를 통해, main()에서 new 생성자()통해 만들어 진 것이 객체이다.
//    아래의 m01, m02를 통해 객체가 생성이 된다. 객체는 다른 메모리에 해당하는 class의 구조를 기준으로
//	  만들어 진다. 같은 도면으로 서울에서 건물을 지을 수 있고, 제주도에서 건물을 지을 수 있는 것과
//    같다. 그 안에 사용되는 데이터를 다를 수 있다.  
  		Movie m01 = new Movie();
  		Movie m02 = new Movie();
  		System.out.println("m01참조변수:"+m01);
  		System.out.println("m02참조변수:"+m02);
  		
  		
//2. 클래스의 구성요소와 각 구성요소의 특징(생성자/메서드의 차이)에 대하여 기술하세요.
/*	클래스는 필드, 생성자, 메서드로 구성되어 있다.
 *  필드는 클래스의 속성을 나타내고 클래스에서 사용되는 전역의 값을 저장한다.
 *  생성자는 클래스를 통해 객체를 만들 때, new 생성자()형식으로 만들어 진다.
 *  보통 객체단위로 하나의 생성자를 사용하며 리턴값이 없는 것이 특징이다.
 *  메서드는 클래스에서 객체단위로 사용하는 기능 함수를 정의한다.
 *  리턴값 매개변수, 프로세스로 구성되어 있다. 생성자와 달리 리턴값과 여러번 사용이 가능하다는 특징이 있다.*/  		
//3. 클래스에서 this를 사용하는 경우에 대하여 기술하세요.
/*   상속 및 일반 클래스에서 현재 클래스의 필드와 지역변수를 구분하기위하여 사용된다. 
 * 	  매개변수와 메서드 및 생성자에서 선언된 변수를 지역변수라 하면, 해당 중괄호 블럭에서만
 * 	활용될 수 있지만, this는 전역 필드를 지칭할 때, 식별자로 사용되고 있다.*/  		
//4. Calculator 클래스를 선언하고, 필드값(두개의 숫자)을 할당하여 합산의 값을
// 	출력하세요.
  		Calculator c1 = new Calculator();
  		c1.num01 = 25;
  		c1.num02 = 30;
  		System.out.println(c1.num01 + " + "+c1.num02 + " = "+(c1.num01+c1.num02));
//5. Calculator 클래스를 선언하고, 생성자로 필드값을 할당하여 곱셈의 값을 출력하세요.
  		Calculator c2 = new Calculator(5,7);
  		System.out.println(c2.num01 + " + "+c2.num02 + " = "+(c2.num01*c2.num02));  		
//6. Calculator 클래스를 선언하고, 생성자로 필드값을 할당하여 
//    메서드 plus(), minus(), divide(), multi()를 통해서 덧셈, 뺄셈, 곱셈,
//    나눗셈을 출력하여 처리하세요.
  		// 1. 생성자를 통해서 필드값을 초기화 처리.
  		Calculator c3 = new Calculator(25,5);
  		// 2. 같은 데이터를 통해서 여러가지 기능을 처리하는 메서드 구현..
  		c3.plus();
  		c3.minus();
  		c3.divide();
  		c3.multi();
  		// ex) 사람의 몸도 클래스로 비유하여 객체가 생성이 되어 여러가지
  		//    데이터가 입력이 되고, 그 데이터를 통해서 처리할 기능을 수행한다는
  		//    개념으로 기억하길..
//7. 자바의 접근제어자 범위에 대하여 기술하세요.
// 		private(클래스내부에서만), X(default패키지안에서), protected(상속관계의 다른 패키지까지),
//  	public(모두 접근가능)
//8. 추상클래스와 일반 클래스의 차이점을 기술하세요.
//  	하위 상속하는 클래스의 재정의를 위하 클래스이다.
//  	추상메서드가 1개 이상있는 클래스로 추상메서드는 반드시 하위에 상속하여야 한다.
//  	추상클래스는 혼자 객체 생성을 하지 못하고, 다형성으로 하위 클래스를 참조로 생성하거나,
//  	하위클래스만 생성이 가능하다.
//9. Duck 추상클래스(quack() 꽥!!, flying()-추상메서드)에 
//    상속받은 RubberDuck(고무오리), Mallard(청둥오리)를 선언하세요.
  		Duck d1 = new RubberDuck();
  		Duck d2 = new Mallard();
  		d1.quack();
  		d2.flying();
	}
}
class Movie{}

class Calculator{
	int num01;
	int num02;
	// 매개변수가 없는 생성자
	Calculator(){}
	// 매개변수가 있는 생성자.
	Calculator(int num01, int num02){
		this.num01 = num01;
		this.num02 = num02;
	}
	// 각각의 기능메서드..
	void plus() {
		System.out.println(num01 +" + "+num02+" = "+(num01+num02));
	}
	void minus() {
		System.out.println(num01 +" - "+num02+" = "+(num01-num02));
	}
	void divide() {
		System.out.println(num01 +" / "+num02+" = "+(num01/num02));
	}
	void multi() {
		System.out.println(num01 +" * "+num02+" = "+(num01*num02));
	}
}
abstract class Duck{
	// 상속받는 하위에서 사용할 공통내용을 선언
	void quack() {
		System.out.println("꽥!! 소리를 내다!");
	}
	// 상속받는 하위에서 각각의 다른 내용을 처리할 부분을 선언..
	abstract void flying();
}
class RubberDuck extends Duck{
	@Override
	void flying() {
		// TODO Auto-generated method stub
		System.out.println("고무 오리는 날으지 못한다.");
	}
}
class Mallard extends Duck{
	@Override
	void flying() {
		// TODO Auto-generated method stub
		System.out.println("청둥 오리는 하늘을 훨훨 나른다.");
	}
}

