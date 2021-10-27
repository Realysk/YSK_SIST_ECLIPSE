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
// ex1) LunchMenu를 통해서 점심 메뉴로 먹은 횟수를 1~20회까지 출력하여
//      Runnable인터페이스를 통해 처리된 것을 수행하세요. 메뉴종류로는 3가지..
//		(2조분들 작성 후, 개인톡으로 전달부탁드립니다 - 수업/과제 속도 및 이해도 표기)
	}

}
class FoodEater implements Runnable{
	private String kind;
	public FoodEater(String kind) {
		super();
		this.kind = kind;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int cnt=1;cnt<=10;cnt++) {
			System.out.println(kind+"를 "+cnt+"개 먹다");
		}
	}
	
}