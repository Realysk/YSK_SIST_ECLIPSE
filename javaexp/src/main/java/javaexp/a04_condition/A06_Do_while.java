package javaexp.a04_condition;

import java.util.Scanner;

public class A06_Do_while {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # do while
		 	1. 초기에 출력/처리 내용을 먼저 진행하고 그 내용을 반복적으로 수행할 때 사용된다.
		 	어떠한 경우라도 한번은 수행처리 돼야한다.
		 	2. 기본 형식
		 		do {
		 			// 최소 한번 수행 할 구문
		 		} while(반복조건);
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.println("연산할 마지막 값을 입력하세요");
		int end = sc.nextInt();
		int cnt = 1;
		int tot = 0;
		do {
			tot += cnt;
			System.out.println((cnt++) + " 까지의 합산 값 : " + tot);
		} while(cnt<=end);
		System.out.println("반복문 종료!!");
		
		/*
		 ex) 어서오세요. 중국집입니다.
		 	 짜장면(4000원)입니다.
		 	 수량을 입력하세요 : @@
		 	 @ 번째 방문 총 비용은 @@@원 입니다.
		 	 누적 비용은 @@@ 원입니다.
		 	 또 방문하시겠습니까? (Y/N)
		 */
		
		Scanner s = new Scanner(System.in);
		int visitCnt = 0;
		int tot1 = 0;
		do {
			System.out.println("어서오세요. 짜장면 전문점입니다.");
			System.out.println("짜장면(4000)입니다.");
			System.out.print("수량을 입력하세요 : ");
			int cnt1 = Integer.parseInt(s.nextLine());
			tot += cnt*4000; // 누적 처리
			System.out.println((++visitCnt) + " 번째 방문 총 비용은 " + (cnt1*4000) + " 원 입니다.");
			System.out.println("누적 비용은 " + tot + " 원 입니다.");
			System.out.println("또 방문하시겠습니까? (Y/N)");
		} while(s.nextLine().equals("Y"));
		System.out.println("프로그램 종료!!");
	}
}
