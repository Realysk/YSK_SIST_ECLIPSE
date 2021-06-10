package javaexp.a12_thread;

public class A01_Basic {
	/*
# Thread 프로그래밍
1. 하나의 프로세스(프로그래밍단위) 안에서 여러 개의
	쓰레드를 통해서 한번에 여러 작업을 할 수 있게 해주는
	프로그래밍 방식이다.
2. 기본 형식.
	1) Thread를 직접 상속 받아서 처리해주는 방식
		class 클래스명 extends Thread{
			void run(){
				쓰레드로 처리할 프로그래밍.
			}
		}
		클래스명 참조변수 = new 생성자();
		참조변수.start(); ==> 정의된 run()를 life cycle에 의해서
			호출하게 한다.
		장점) 바로 객체를 start()에 의해서 생성해서 사용할 수 있다
		단점) extends를 이용해서 Thread를 상속했기때문에 추후 추가상속을
			불가능하다.
			
	2) Runnable 인터페이스를 implements 받아서 처리해주는 방식.
		class 클래스명 implements Runnable{
			void run(){}
		}
		클래스명 참조변수 = new 생성자();
		Thread t1 = new Thread(참조변수);
		t1.start();
		장점) implements인터페이스 형태로 사용했기때문에, 다른 클래스를
			상속하여 사용할 수 있다.
		단점)	 Thread를 다시 만들어서 참조변수로 넣어야 하는 불편함이 있다.
3. 쓰레드 설정 기본 메서드
	1) getName() :쓰레드의 고유명을 가져온다.
		setName("저장할 이름")
	2) getPriority() : 쓰레드의 우선 순위 설정된 내용을 가져온다.
	- 쓰레드 우선 순위 설정 상수
		setPriority(Thread.MAX_PRIORITY);
		Thread.MAX_PRIORITY : 최우선 쓰레드 처리
		Thread.NORM_PRIORITY : 중간 우선 쓰레드 처리
		Thread.MIN_PRIORITY : 최하위 우선 쓰레드 처리
		
	*/	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 각각의 프로그램의 수행되어, 하나의 프로그램이 다 끝난 후에,
		// 다른 프로그램이 수행되어 진다 
		Go g1 = new Go();
		Come c1 = new Come();
		g1.run();
		c1.run();
	}

}
class Go{
	public void run() {
		for(int cnt=1;cnt<=1000;cnt++)
		System.out.println("gogo!![쓰레드없는 프로그램]");
	}
}
class Come{
	public void run() {
		for(int cnt=1;cnt<=1000;cnt++)
		System.out.println("come!![쓰레드없는 프로그램]");
	}
}



