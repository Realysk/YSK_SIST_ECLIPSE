package javaexp.a04_condition;

import java.util.Scanner;

public class A03_SwitchCase {
	
	/*
	 # Switch case문
	 	1. 특정한 변수를 받아서 해당 변수의 case를 지정하여 조건문을 처리하는 형식을 말한다.
	 	2. 기본형식
	 		switch(변수) {
	 			case 변수유형1
	 				처리할 내용
	 				break;
	 			case 변수유형1
	 				처리할 내용
	 				break;
	 			...
	 			default :
	 				위에 정의한 변수유형이 아닐 때 처리할 내용
	 		}
	 	
	 	3. switch case 문에서 break;
	 		1) 해당 case에 process를 중단처리하여 switch문의 {}블럭을 벗어나게 한다.
	 		2) break; case문에 없으면 바로 밑 case로 처리가 된다.
	 		3) 누적된 효과가 필요할 때는 적절하게 break문을 사용하면 된다.
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int buttonNum = 2;
		switch(buttonNum) {
			case 1:
				System.out.println("A 구역의 불이 켜졌습니다.");
				break;
			case 2:
				System.out.println("B 구역의 불이 켜졌습니다.");
				break;
			default:
				System.out.println("해당 버튼은 사용하는 버튼이 아닙니다.");
		}
		System.out.println("입장");
		
		/*
		 ex) 문제의 정답을 입력하세요. (1~4) 3번인 경우만 정답 그 외에는 오답을 출력하는 switch case문을 작성하세요.
		 */
		
		int ans = 3;
		switch(ans) {
			case 1:
				System.out.println("오답입니다.");
				break;
			case 2:
				System.out.println("오답입니다.");
				break;
			case 3:
				System.out.println("정답입니다!");
				break;
			case 4:
				System.out.println("오답입니다.");
				break;
			default:
				System.out.println("입력할 번호가 아닙니다.");
		}
		
		int month = 5;
		// 월 별 마지막일 계산 프로그램
		System.out.println("# " + month + "월 #");
		switch(month) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				System.out.println("31일까지 입니다.");
				break;
			case 2:
				System.out.println("마지막 날은 28일까지 입니다.");
				break;
			case 4:
			case 6:
			case 9:;
			case 11:
				System.out.println("마지막 날은 30일 까지 입니다.");
				break;
			default:
				System.out.println(" 월의 입력 범위는 1~12월까지 입니다.");
		}
		
		/*
		 ex) 제비뽑기 1~10 번호 중에
		 	1,5,8번은 입력금액의 200% 처리,
		 	2,4,9번은 입력금액의 300% 처리,
		 	그 외에는 꽝 처리,
		 	기본 입력 범위는 1~10
		 	투자할 금액을 입력하세요.
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("투자할 금액을 입력하세요 : ");
		int input_mn = sc.nextInt();
		int ranNum = (int)(Math.random() * 10 + 1);
		System.out.println("투자 금액 : " + input_mn);
		System.out.println("선택 번호 : " + ranNum);
		
		switch(ranNum) {
			case 1:
			case 5:
			case 8:
				System.out.println("당첨 금액 : " + (input_mn * 2));
				break;
			case 2:
			case 4:
			case 9:
				System.out.println("당첨 금액 : " + (input_mn * 3));
				break;
			default:
				System.out.println("꽝");
		}
	}
}
