package javaexp.a06_inherit;

public class A02_AbstractClass {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		1. 추상클래스는 단독을 객체 생성해서 사용하지 못 한다.
//		Vehicle v1 = new Vehicle();
//		2. 하위클래스만 생성한다.
		Car c1 = new Car();
		c1.driving();
		c1.speedUp();
//		3. 다형성(상위클래스를 참조로 하위 클래스 생성이 가능하다)
		Vehicle v2 = new Truck();
		v2.driving();
		v2.speedUp();
		
		PoiceMan p1 = new PoiceMan();
		p1.goWork();
		p1.working();
		// 다형성/폴리몰피즘
		Worker w1 = new FireMan();
		w1.goHome();
		w1.working();
	}
	// ex) Worker라는 추상클래스에 
	// 		실제메서드 goHome() goWork() 퇴근/출근하다..
	//      추상메서드 working()
	//     PoliceMan 상속받은 실제 클래스 working() 치안을 유지하다.
	//     FireMan 상속받은 실제 클래스 working() 불을 끄다.
}
abstract class Worker{
	// 1. 공통적으로 하위에서 사용할 기능 메서드 선언
	void goHome() {
		System.out.println("퇴근하다!!");
	}
	void goWork() {
		System.out.println("출근하다!!");
	}
	// 2. 하위 클래스에서 개별적으로 사용할 기능 메서드 선언
	abstract void working();
}
class PoiceMan extends Worker{
	// 하위에 있는 클래스는 상위 추상메서드를 반드시
	// 재정의 하여야 한다.
	@Override
	void working() {
		System.out.println("치안을 유지하다.");
	}
}
class FireMan extends Worker{
	@Override
	void working() {
		// TODO Auto-generated method stub
		System.out.println("불을 끄다.");
	}
	
}


// 1. 추상메서드가 1개라도 있으면, 추상클래스가 된다.
// 2. 추상클래스는 단독으로 객체 생성을 하지 못 한다.
abstract class Vehicle{
	void driving() {
		System.out.println("운행 하다!!");
	}
	abstract void speedUp();
}
// 3. 추상클래스를 상속받은 하위 클래스는 추상메서드를 받드시
//    재정의하여 사용하여야 한다.
class Car extends Vehicle{
	void speedUp() {
		System.out.println("자동차는 속도가 20km/h씩 증가한다");
	}
}
class Truck extends Vehicle{
	void speedUp() {
		System.out.println("자동차는 속도가 10km/h씩 증가한다");
	}	
}


