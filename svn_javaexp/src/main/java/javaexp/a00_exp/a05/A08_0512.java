package javaexp.a00_exp.a05;

public class A08_0512 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 1. Thread 프로그램 실행 형식 2가지를 코드로 기술하세요. Thread란 하나의 프로세스 안에서 여러가지 것들을 동시에 처리할 수
		 * 있게 해주는 것.
		 * 
		 * 1) Thread를 통해 직접 상속 받아 처리 class 클래스명 extends Thread{ void run(){ 처리할 코드 } }
		 * 클래스명 참조변수 = new 생성자(); 참조변수.start();
		 * 
		 * 2) Runnable을 통해 상속 받아 처리 class 클래스명 implements Runnable{ void run(){ 처리할 코드 }
		 * } // 클래스명 참조변수1 = new 생성자(); // Thread 참조변수2 = new Thread(참조변수1); //
		 * 참조변수2.start(); 2. 아래 내용을 Thread 상속한 프로그램으로 만들어 보세요. [1단계] ShoppingBuyer :
		 * 구매자를 통해 물건 10개를 구매 처리하는 프로그램을 구현하세요.
		 */
		/*
		 * ShoppingBuyer sb1 = new ShoppingBuyer("홍길동"); ShoppingBuyer sb2 = new
		 * ShoppingBuyer("신길동"); ShoppingBuyer sb3 = new ShoppingBuyer("마길동");
		 * sb1.start(); sb2.start(); sb3.start();
		 */
		/*
		ShoppingBuyer02 sb4= new ShoppingBuyer02("홍길동", "사과", 3000, 2);
		ShoppingBuyer02 sb5= new ShoppingBuyer02("신길동");
		sb5.setProduct("오렌지", 3000, 15);
		sb4.start();
		sb5.setProduct("수박", 12000, 13);
		sb5.start();
		*/
		//sb5.start();
		

		/*
		 * [2단계] ShoppingBuyer : 생성자로 구매자/물건/가격/갯수를 받아서 해당 갯수만큼 반복문을 처리하는 프로그램을 구현하세요.
		 * 3. Thread의 이름과 우선순위 기능 메서드를 기술하세요
	             setName("쓰레드 이름");  getName()
	             Thread.MAX_PRIORITY : 최상위 우선 처리
	             Thread.NORM_PRIORITY : 보통 우선 처리
	             Thread.MIX_PRIORITY : 최하위 우선 처리
	             setPriority(Thread.NORM_PRIORITY), 
	             getPriority();
		 * 4. 아래 내용을 Runnable 인터페이스를 처리한 프로그램을 만들어 보세요. [1단계] SeeingMovie : 배열로된 영화
		 * 목록(5개)을 보고 처리하는 프로그램
*/
		/*
		Thread t1 = new Thread(new SeeingMove("김청아"));
		Thread t2 = new Thread(new SeeingMove("홍신영"));
		Thread t3 = new Thread(new SeeingMove("김철수"));
		t1.start();
		t2.start();
		t3.start();
		*/
		/*		 
		 * 5. Weapon 인터페이스 하위의 익명객체를 선언하고, 처리하는 방식을 수업 중 진행하는 4단계를 선언하여 각종 무기에 공격방법을 선언
		 * 처리하세요. 1) 익명객체 생성 2) 함수선언 할당 3) 람다식1 선언 호출 4) 람다식2 선언 호출
		 * 
		 */
		Weapon wp01 = new Weapon() {
			@Override
			public void attack() {
				// TODO Auto-generated method stub
				System.out.println("로켓포 공격하다");
			}
		};
		wp01.attack();
		weaponFunction(()->{
			System.out.println("레이저빔 공격(람다1)");
		});
		weaponFunction(()-> System.out.println("발차기 공격(람다2)"));
		
	}
    static void weaponFunction(Weapon wf1){
        wf1.attack();
    };	
}

class ShoppingBuyer extends Thread {
	private String name;

	public ShoppingBuyer(String name) {
		super();
		this.name = name;
	}

	public void run() {
		for (int cnt = 1; cnt <= 10; cnt++) {
			System.out.println(name + " 물건을 " + cnt + "개 구매했습니다.");
		}
	};
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
	public void setProduct(String thing, int  price, int count) {
		this.thing = thing;
		this.price = price;
		this.count = count;
	}

	public void run() {
		for(int cnt=1;cnt<=count;cnt++) {
			System.out.println(name + "가 " + thing + "을 " 
					+ cnt + "개 구매해서 총 " + (price * cnt) 
					+ "원 입니다.");
		}
	};
}


class SeeingMove implements Runnable{
	private String name;
	public SeeingMove(String name) {
		super();
		this.name = name;
	}
	public void run() {
		String [] list = {"바람과 함께 사라지다",
    		  "신과 함께", "스파이더맨", "해리포터", "모범택시"};
		for(int idx=0; idx<list.length; idx++) {
			System.out.println(name+" " +(idx+1)+
					"번째에 영화 "+ list[idx]+"를 보다.");
		}
   }
	   
}
interface Weapon{
   void attack();
}