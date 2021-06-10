package javaexp.a04_condition;

import java.util.Scanner;

public class A05_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # While
		 	1. 조건에 따라 반복 여부를 결정할 때 사용되는 구문
		 	2. 기본 형식
		 		while(반복조건) {
		 			
		 		}
		 	3. 주로 반복 block에 있는 값의 입력으로 반복 여부를 결정할 때 사용 된다.
		 */
		
		int cnt = 1;
		while(cnt<=10) {
			System.out.println("번호 : " + cnt);
			cnt++;
		}
		System.out.println("반복문 종료!!");
		
		/*
		ex) while문을 이용해서 과일 가격이 3000원인 사과를 10개까지 구매한 비용을 1~10까지 출력하세요.
		*/
		
		cnt = 1;
		int fruPrice = 3000;
		while(cnt<=10) {
			System.out.println(cnt+" 개 사과 구매 비용 : " + fruPrice*cnt);
			cnt++;
		}
		
		Scanner s = new Scanner(System.in);
		String order = ""; // 주문 내역
		while(true) { // 무한 반복
			System.out.println("주문할 상품을 입력하세요. : ");
			order += s.nextLine() + "  "; // 입력받은 데이터를 누적 처리
			System.out.println("현재까지 주문한 내역");
			System.out.println(order);
			System.out.println("주문을 종료하시겠습니까? (Y/N) : ");
			// 종료할 수 있는 문자열을 지정하여 처리
			if(s.nextLine().equals("Y")) {
				System.out.println("주문 완료!");
				// break문을 통해서 while문을 벗어나게 처리
				break;
			}
		}
		System.out.println("# 최종 주문 내역 #");
		System.out.println(order);
		
		/*
		 ex) while문을 이용해서 구매한 금액을 입력하여 '구매를 마치시겠습니까?' 처리시 최종 금액을 출력하세요.
		 s.nextLine(), Integer.parseInt(s.nextLine()) 이용.
		 */
		
		Scanner scu = new Scanner(System.in);
		int pay = 0;
		while(true) { // 무한 반복
			System.out.println("구매한 금액을 입력하세요. : ");
			pay += Integer.parseInt(s.nextLine()); // 입력받은 데이터를 누적 처리
			System.out.println("현재까지 입력한 금액 내역 : " + pay + " 원");
			System.out.println("구매를 마치시겠습니까? (Y/N) : ");
			// 종료할 수 있는 문자열을 지정하여 처리
			if(scu.nextLine().equals("Y")) {
				System.out.println("구매 완료!");
				// break문을 통해서 while문을 벗어나게 처리
				break;
			}
		}
		System.out.println("# 입력한 금액의 총 내역 #");
		System.out.println(pay + " 원");
	}
}
