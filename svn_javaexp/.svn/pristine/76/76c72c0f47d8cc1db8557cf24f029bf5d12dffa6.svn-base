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
4. Math.min(데이터1, 데이터2) : 두 수중 최소값 리턴
5. Math.max(데이터1, 데이터2) : 두 수중 최대값 리턴
6. Math.round() : 반올림 처리. 
7. Math.random() : 랜덤 데이터 처리.(0.0<=R<1.0)
	cf) Random r = new Random();
		r.nextInt(정수형범위)
 * */
		int v1 = Math.abs(-5);
		double v2 = Math.abs(-3.14);
		System.out.println("절대값1:"+v1);
		System.out.println("절대값2:"+v2);
		double v3 = Math.ceil(5.3);
		double v4 = Math.ceil(-5.3);
		System.out.println("올림1:"+v3);
		System.out.println("올림2:"+v4);
		double v5 = Math.floor(5.3);
		double v6 = Math.floor(-5.3);
		System.out.println("내림1:"+v5);
		System.out.println("내림2:"+v6);
		int v7 = Math.max(5, 9);
		double v8 = Math.max(5.3, 2.5);
		System.out.println("최대값1:"+v7);
		System.out.println("최대값2:"+v8);
		int v9 = Math.min(5, 9);
		double v10 = Math.min(5.3, 2.5);
		System.out.println("최소값1:"+v9);
		System.out.println("최소값1:"+v10);
		long v11 = Math.round(5.3);
		long v12 = Math.round(-5.3);
		System.out.println("반올림1:"+v11);
		System.out.println("반올림2:"+v12);
//ex1) 최대값/최소값 가져오기
//		주사위 2개를 던져서, 둘 중에 나온 수중에
//		이긴 숫자 : @@ (승)
//		진 숫자 : @@ (패)  위 함수 활용 
		int dice1 = (int)(Math.random()*6+1);
		int dice2 = (int)(Math.random()*6+1);
		if(dice1==dice2) {
			System.out.println(dice1+"(무승부)");
		}else {
			System.out.println("이긴 숫자:"+Math.max(dice1, dice2)+"(승)");
			System.out.println("진 숫자:"+Math.min(dice1, dice2)+"(패)");
		}
		
//**ex2) 임의의 범위를 10자리와 소숫점 1자리로 나오게 하여,
//	   반올림, 올림, 내림 처리 결과를 출력하세요..	
/*
//    0 ~ 999 ==> 0.0 ~ 99.9 
 * 	 (int)(Math.random()*1000) 0 ~ 999
 *   ((int)(Math.random()*1000))/10.0 : 0.0 ~ 99.9 
//    경우의 수부터 생각하시고  /(나눗셈) 처리도 생각해보시면 됩니다.
 * */		
		double ran = ((int)(Math.random()*1000))/10.0;
		System.out.println("나온 범위 데이터 :"+ran);
		System.out.println("반올림:"+Math.round(ran));
		System.out.println("올림:"+Math.ceil(ran));
		System.out.println("내림:"+Math.floor(ran));
		/*
		# Random 클래스를 통해서
		임의의 범위로 데이터를 처리..
		 * */
		Random ran02 = new Random();
		
		System.out.println(ran02.nextBoolean());
		System.out.println(ran02.nextDouble());
		System.out.println(ran02.nextInt());
		System.out.println(ran02.nextInt(10));

		
		
		
		
		
		
		
		
		
		
	}

}
