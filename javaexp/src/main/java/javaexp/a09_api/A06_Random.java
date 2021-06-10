package javaexp.a09_api;

public class A06_Random {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 랜덤
		 	1. 프로그래밍에서 랜덤으로 수를 처리하여, 여러가지 경우에 나타나는 데이터를 처리할 수 있다.
		 	
		 	2. 자바에서 기본 Random수 처리 api.
		 		1) 0.0 <= Math.random() < 1.0
		 	
		 	3. 특정한 범위에 데이터를 처리하기
		 		0) 공식 : (int)(Math.random() * 경우의 수 + 시작 수)
		 		1) 주사위 (1~6)
		 			1 <= (int)(Math.random()*6 + 1) < 7
		 			
		 */
		for (int cnt = 1; cnt <= 10; cnt++) {
			System.out.println(Math.random());
		}
		for (int cnt = 1; cnt <= 10; cnt++) {
			System.out.println((int)(Math.random()*6 + 1));
		}
		
//		ex1) 두 개의 주사위를 던져서 합산한 값을 출력.
		int dice1 = (int)(Math.random() * 6 + 1);
		int dice2 = (int)(Math.random() * 6 + 1);
		System.out.println("두 개의 주사위의 총합 : " + (dice1 + dice2));
		
//		ex2) 임의로 1~10까지 숫자가 출력되게 하세요.
		System.out.println("1 ~ 10 까지 어떤 수가? " + (int)(Math.random() * 10 + 1));
	}

}
