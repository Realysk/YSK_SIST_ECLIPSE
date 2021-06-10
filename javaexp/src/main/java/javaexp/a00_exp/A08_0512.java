package javaexp.a00_exp;

public class A08_0512 {
	
	static void WeaponFunction(Weapon w1) {
		w1.weapon();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 	1. Thread 프로그램 실행 형식 2가지를 코드로 기술하세요.
		 	
		 		1) Thread를 직접 상속 받아서 처리하는 방법
		 		
		 			class 클래스명 extends Thread {
							void run() {
								쓰레드로 처리할 프로그래밍.
							}
						}
					클래스명 참조변수 = new 생성자();
					참조변수.start();
					
				2) Runnable 인터페이스를 implements 받아서 처리하는 방법
				
					class 클래스명 implements Runnable {
							void run(){}
						}
					클래스명 참조변수 = new 생성자();
					참조변수.start();
		 	
		 	2. 아래 내용을 Thread 상속한 프로그램으로 만들어 보세요.
		 		[1단계] ShoppingBuyer : 구매자를 통해 물건 10개를 구매 처리.
		 		*/
					ShoppingBuyer01 sb1 = new ShoppingBuyer01("홍길동");
					ShoppingBuyer01 sb2 = new ShoppingBuyer01("신길동");
					ShoppingBuyer01 sb3 = new ShoppingBuyer01("마길동");
					sb1.start();
					sb2.start();
					sb3.start();
				/*

		 		[2단계] ShoppingBuyer : 생성자로 구매자/물건/가격/갯수를 받아서
		 								해당 갯수만큼 반복문을 처리하는 프로그램을 구현하세요.
		 		*/
//					ShoppingBuyer02 sb4 = new ShoppingBuyer02("홍길동", "사과", 3000);
//					ShoppingBuyer02 sb5 = new ShoppingBuyer02("신길동");
//					sb5.setProduct("오렌지", 3000, 5);
//					sb4.start();
//					sb5.setProduct("수박", 12000, 3);
//					sb5.start();
					
					//sb5.start();
				/*
		 		
		 	3. Thread의 이름과 우선순위 기능 메서드를 기술하세요.
		 	
		 		getName() : 쓰레드의 고유명을 가져온다.
				getPriority() : 쓰레드의 우선 순위 설정된 내용을 가져온다.
				
				우선순위 :
				Thread.MAX_PRIORITY - Thread.NORM-PRIORITY - Thread.MIN_PRIORITY
						
		 	4. 아래 내용을 Runnable 인터페이스를 처리한 프로그램으로 만들어 보세요.
		 		[1단계] SeeingMovie : 배열로 된 영화 목록 (5개)를 보고 처리하는 프로그램
		 		
		 		*/
					Thread t1 = new Thread(new SeeingMovie ("김청아"));
					Thread t2 = new Thread(new SeeingMovie ("홍신영"));
					Thread t3 = new Thread(new SeeingMovie ("김철수"));
					t1.start();
					t2.start();
					t3.start();
				/*
		 	
		 	5. Weapon 인터페이스 하위의 익명개체를 선언하고 처리하는 방식을
		 		수업 중 진행하는 4단계를 선언하여 각종 무기에 공격방법을 선언 처리하세요.
		 		1) 익명객체 선언
		 			*/
						Weapon w1 = new Weapon() {
							@Override
							public void weapon() {
								System.out.println("로켓포 공격하다!");
							}
						};
						w1.weapon();
					/*
		 		2) 함수선언 할당
		 		
						static void WeaponFunction(Weapon w1) {
							w1.weapon();
						}
						
		 		3) 람다식1 선언 호출
		 		
		 			*/
						WeaponFunction(() -> {
							System.out.println("레이저빔 공격!(람다식1)");});
					/*

		 		4) 람다식2 선언 호출
		 		
		 			*/
						WeaponFunction(() -> 
						System.out.println("발차기 공격!(람다식2)"));
					/*
					 
		 */

	}
}

class SeeingMovie implements Runnable {
	private String movie;
	public SeeingMovie(String movie) {
		super();
		this.movie = movie;
	}
	@Override
	public void run() {
			String [] list = {"바람과 함께 사라지다", "신과함께", "스파이더맨", "해리포터", "모범택시"};
			for(int idx=0; idx<list.length; idx++) {
				System.out.println(movie + " 이 " + (idx+1) + " 번째 영화 " + list[idx] + " 를 보다.");
			}
		}
	}

interface Weapon {
	void weapon(); // 추상 메서드 선언
}
class attack implements Weapon {
	@Override
	public void weapon() {
		// TODO Auto-generated method stub
	System.out.println("공격하다!");	
	}
}

class ShoppingBuyer01 extends Thread {
	private String name;
	public ShoppingBuyer01(String name) {
		super();
		this.name = name;
	}
	public void run() {
		for(int cnt=1; cnt<=10; cnt++) {
			System.out.println(name + " 물건을 " + cnt + " 개 구매했습니다.");
		}
	}
	
class ShoppingBuyer02 extends Thread {
	private String name;
	private String thing;
	private int price;
	private int count;
	
	public ShoppingBuyer02(String name) {
		super();
		this.name = name;
	}
	public ShoppingBuyer02(String name, String thing, int price, int count) {
		super();
		this.name = name;
		this.thing = thing;
		this.price = price;
		this.count = count;
	}
	public void setProduct(String thing, int price, int count) {
		this.thing = thing;
		this.price = price;
		this.count = count;
	}
	public void run() {
		for(int cnt=1; cnt<=cnt; cnt++) {
			System.out.println(name + " 가 " + thing + " 을(를)" + cnt + " 개 구매해서 총" + (price * cnt) + " 원 입니다.");
			}
		}
	}
}