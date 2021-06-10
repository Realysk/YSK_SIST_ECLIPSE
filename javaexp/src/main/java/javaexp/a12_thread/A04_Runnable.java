package javaexp.a12_thread;

public class A04_Runnable {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FoodEater fe1 = new FoodEater("딸기");
		Thread t1 = new Thread(fe1);
		t1.start();
		FoodEater fe2 = new FoodEater("오렌지");
		Thread t2 = new Thread(fe2);
		t2.start();
		FoodEater fe3 = new FoodEater("수박");
		Thread t3 = new Thread(fe3);
		t3.start();
	// ex1) LunchMenu를 통해서 점심메뉴로 먹은 횟수를 1~20회까지 출력해서
	// Runnable 인터페이스를 통해 처리 된 것을 수행하세요. (메뉴 종류 - 3가지)
		
		LunchMenu lm1 = new LunchMenu("김치찌개");
		Thread t4 = new Thread(lm1);
		t4.start();
		LunchMenu lm2 = new LunchMenu("부대찌개");
		Thread t5 = new Thread(lm2);
		t5.start();
		LunchMenu lm3 = new LunchMenu("된장찌개");
		Thread t6 = new Thread(lm3);
		t6.start();
		
		// new Thread(인터페이스상속한객체).start();
		new Thread(new LunchMenu("김치찌개")).start();
		new Thread(new LunchMenu("부대찌개")).start();
		new Thread(new LunchMenu("된장찌개")).start();
	}

}

class LunchMenu implements Runnable {
	private String kind;
	public LunchMenu(String kind) {
		super();
		this.kind = kind;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int cnt=1; cnt<=20; cnt++) {
			System.out.println(kind + "를 " + cnt + " 회 먹다.");
		}
	}
}

class FoodEater implements Runnable {
	private String kind;
	public FoodEater(String kind) {
		super();
		this.kind = kind;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int cnt=1; cnt<=10; cnt++) {
			System.out.println(kind + "를 " + cnt + "개 먹다.");
		}
	}
}