package javaexp.a05_object;

public class A14_Static {
/*
# 정적멤버 static 활용하기
1. 클래스에 의해서 만들어진 객체는 각각의
	멤버들의 기능적인 처리와 데이터를 가지고 있다.
2. static을 선언된 멤버는 하나의 클래스에서 
	만들어진 모든 객체들의 데이터나 기능을 공유할 수 있다.
 * */
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
// ex) Bear name(이름)
// 		일반변수:먹은 빵의 갯수  static 변수로 전체 남은 빵의 갯수
//		1) 초기 전체 빵의 갯수를 할당.
		Bear.REST_BREAD=20;
		Bear b1 = new Bear("곰돌이1");
		Bear b2 = new Bear("곰돌이2");
		Bear b3 = new Bear("곰돌이3");
		b1.eat();
		b1.eat();
		b3.eat();
		b3.eat();
		b2.eat();
		b2.eat();
		b2.eat();
		System.out.println("현 남은 빵의 갯수:"+Bear.REST_BREAD);
//		2) 각자가 빵을 먹을 때, 각가의 먹은 갯수 증가, static변수의 빵의 갯수 감소
//		3) 최종 각 곰돌이가 먹은 빵의 갯수와 남의 빵의 갯수를 출력..[1조]
// ex) FruitBuyer 이름, 구매한 과일의 갯수, 남은 과일의 갯수
//        buy()를 통해서 일반변수와 static의 변수를 1개씩 구매한 갯수
//        buyInfo() @@가 구매한 과일의 갯수 @@@, 현재남은 과일갯수는 @@
//		1) 초기에		FruitBuyer.REST_FRUIT_CNT=50;
//      2) 구매자 3명, buy()를 통해 구매처리.
//		3) 마지막에 buyInfo()를 통해서 남은 구매 정보 출력 [2조]
		
		// 객체 생성 없이도 사용이 가능하다.
		Account.money2=5000;
		
		Account c1 = new Account(1000);
//		c1.money2=1000;	
		Account c2 = new Account(2000);
		c2.money2+=100;
		Account c3 = new Account(3000);
		// static 변수나 메서드는 공유하는 영역이기때문에 굳이 객체의 참조변수로
		// 쓰지 않고, 클래스명.static맴버로 사용한다.
		System.out.println("Account.money2:"+Account.money2);
		c1.show();
		c1.add();
		c1.add();
		c1.show();
		c2.show();
		c3.show();
		System.out.println("c1.money2:"+c1.money2);
		System.out.println("c2.money2:"+c2.money2);
		System.out.println("c3.money2:"+c3.money2);
		
		// static 변수는 public으로 객체 생성전에 클래스명.변수 형식으로
		// 사용한다.
		FruitBuyer.REST_FRUIT_CNT= 20;
		FruitBuyer fb1 = new FruitBuyer("홍길동");
		FruitBuyer fb2 = new FruitBuyer("김길동");
		FruitBuyer fb3 = new FruitBuyer("신길동");
		fb1.buy();
		fb1.buy();
		fb2.buy();
		fb2.buy();
		fb2.buy();
		fb3.buy();
		fb3.buy();
		
		
	}
}
class FruitBuyer{
	private String name;
	private int buyCnt;
	public static int REST_FRUIT_CNT;
	public FruitBuyer(String name) {
		super();
		this.name = name;
	}
	public void buy() {
		buyCnt++;
		REST_FRUIT_CNT--;
		System.out.println(name+" 과일을 구매했습니다.");
		buyInfo();
	}
	public void buyInfo() {
		System.out.println(name+" 구매 정보");
		System.out.println("구매한 과일의 갯수:"+buyCnt);
		System.out.println("남은 갯수:"+REST_FRUIT_CNT);
	}
	
}


class Bear{
	private String name;
	private int eatBread;
	static int REST_BREAD;
	public Bear(String name) {
		super();
		this.name = name;
	}
	public void eat() {
		eatBread++;
		REST_BREAD--;
		System.out.println(name+"의 빵의 정보");
		System.out.println("먹은 빵의 갯수:"+eatBread);
		System.out.println("남은 빵의 갯수:"+REST_BREAD);
	}
	
	
}

class Account{
	int money;
	static int money2;
	public Account(int money) {
		this.money = money;
	}
	public void add() {
		money+=10;
	}
	public void show() {
		System.out.println("현 계좌의 금액:"+money);
	}
	
}
