package javaexp.a04_condition;

import java.util.Scanner;

public class A05_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# while
1. 조건에 따라 반복 여부를 결정할 때, 사용되는 구문..
2. 형식
	while(반복조건){
		
	}
3. 주로 반복 block에 있는 값의 입력으로 반복 여부를 결정할 때,
	사용된다.
 * */
		int cnt = 1;
		while(cnt<=10) {
			System.out.println("번호:"+cnt);
			cnt++;
		}
		System.out.println("반복문 종료!!");
// ex) while문을 이용해서 과일가격이 3000원인 사과를 10개까지 구매한 비용을
//     1~10까지 출력 하세요  (6조)
		cnt = 1;
		int fruPrice= 3000;
		while(cnt<=10) {
			System.out.println(cnt+"개 사과 구매 비용 :"+fruPrice*cnt);
			cnt++;
		}
		/*
		Scanner s = new Scanner(System.in);
		String order=""; // 주문 내역..
		while(true) { // 무한 반복..
			System.out.print("주문을 받습니다:");
			order+=s.nextLine()+" "; // 입력받은 데이터를 누적 처리..
			System.out.println("현재까지 주문한 내역");
			System.out.println(order);
			System.out.print("주문을 종료하시겠습니까?(Y/N):");
			// 종료할 수 있는 문자열을 지정하여 처리..
			if(s.nextLine().equals("Y")) {
				System.out.println("주문 완료!!");
				// break문을 통해서 while문을 벗어 나게 처리..
				break;
			}
		}
		
		System.out.println("# 최종 주문 내역 #");
		System.out.println(order);
		*/
		// ex) while문을 이용해서 구매한 금액을 입력하여, 
		//	 그만 구매하시겠습니까? 처리시, 최종 금액을 출력하세요..
		//   s.nextLine(), Integer.parseInt(s.nextLine()) 이용.[5조]
		Scanner s = new Scanner(System.in);
		int tot=0; //누적할 금액
		while(true) { 
			System.out.print("구매한 금액:");
			tot+=Integer.parseInt(s.nextLine()); // 입력받은 데이터를 누적 처리..
			System.out.println("현재 비용:"+tot);
			System.out.print("구매를 종료하시겠습니까?(Y/N):");
			// 종료할 수 있는 문자열을 지정하여 처리..
			if(s.nextLine().equals("Y")) {
				System.out.println("구매 완료!!");
				break;
			}
		}
		
		System.out.println("# 최종 비용 #");
		System.out.println(tot);	
		
		
		
	}

}
