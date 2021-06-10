package javaexp.a09_api;

import java.util.Random;

public class A15_Math {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # Math 클래스 하위 여러가지 기능 api
		 	1. Math.abs() : 절대값 처리 |-5|
		 	2. Math.ceil() : 올림 처리
		 	3. Math.floor() : 내림 처리
		 	4. Math.min(데이터1, 데이터2) : 두개의 수 중 최소값 리턴
		 	5. Math.max(데이터1, 데이터2) : 두개의 수 중 최대값 리턴
		 	6. Math.round() : 반올림 처리
		 	7. Math.random() : 랜덤 데이터 처리 (0.0 <= R < 1.0)
		 		cf) Random r = new Random();
		 			r.nextInt(정수형범위)
		 */
		
		int v1 = Math.abs(-5);
		double v2 = Math.abs(-3.14);
		System.out.println("절대 값 : " + v1);
		System.out.println("절대 값 : " + v2);
		double v3 = Math.ceil(5.3);
		double v4 = Math.ceil(-5.3);
		System.out.println("올림 1 : " + v3);
		System.out.println("올림 2 : " + v4);
		double v5 = Math.floor(5.3);
		double v6 = Math.floor(-5.3);
		System.out.println("내림 1 : " + v5);
		System.out.println("내림 2 : " + v6);
		int v7 = Math.max(5, 9);
		double v8 = Math.max(5.3,  2.5);
		System.out.println("최대 값 1 : " + v7);
		System.out.println("최대 값 2 : " + v8);
		int v9 = Math.min(5, 9);
		double v10 = Math.min(5.3, 2.5);
		System.out.println("최소 값 1 : " + v9);
		System.out.println("최소 값 2 : " + v10);
		long v11 = Math.round(5.3);
		long v12 = Math.round(-5.3);
		System.out.println("반올림 1 : " + v11);
		System.out.println("반올림 2 : " + v12);
		
		/*
		 ex1) 최대 값 / 최소 값 가져오기
		 		주사위 2개를 던져서 둘 중에 나온 수 중에
		 		승리 숫자 : @@ (승)
		 		패배 숫자 : @@ (패) (위 함수 활용)
		 		
		 ex2) 임의의 범위를 10자리와 소숫점 1자리로 나오게 하여
		 		반올림, 올림, 내림 처리 결과를 출력하세요. **
		 		hint _ 경우의 수, /(나눗셈) 활용
		 			 _ 0 ~ 999 => 0.0 ~ 99.9
		 */
		
		int dice1 = (int)(Math.random()*6+1);
		int dice2 = (int)(Math.random()*6+1);
		if(dice1==dice2) {
			System.out.println(dice1 + " : 무승부");
		} else {
			System.out.println("승리 숫자 : " + Math.max(dice1, dice2) + " (승)");
			System.out.println("패배 숫자 : " + Math.min(dice1, dice2) + " (패)");
		}
		
		double ran = ((int)(Math.random()*1000))/10.0;
		System.out.println("나올 범위 데이터 : " + ran);
		System.out.println("반올림 : " + Math.round(ran));
		System.out.println("올림 : " + Math.ceil(ran));
		System.out.println("내림 : " + Math.floor(ran));
		
		/*
		 # Random
		 	Random 클래스를 통해서 임의의 범위로 데이터를 처리.
		 */
		
		Random ran02 = new Random();
		
		System.out.println(ran02.nextBoolean());
		System.out.println(ran02.nextDouble());
		System.out.println(ran02.nextInt());
		System.out.println(ran02.nextInt(10));
				
	}

}
