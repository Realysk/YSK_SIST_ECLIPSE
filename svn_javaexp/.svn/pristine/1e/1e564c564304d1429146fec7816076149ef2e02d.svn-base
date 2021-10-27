package javaexp.a04_condition;

import java.util.Scanner;

public class A04_for {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
# for문
1. 반복 횟수를 알고 있을 때, 주로 사용되는 구문
2. 기본형식
	for(;;){ // 무한 loop
	}

	for(1초기값;2조건식;4증감식){
		3반복수행구문
	}
	1,2,3,4,2,3,4....
	1. 초기값 : 한번만 수행되어 진다.
	2. 조건식 : boolean형태로 반복수행할 구문을 처리할 조건을 나타낸다.
	3. 반복수행 구문 : 조건식이 true일 때, 처리될 구문.
	4. 증감식 : 증가(++,+=), 감소(--,-=)연산을 통해 증감 처리
	증감식 이후에 조건식에 해당하는 여부를 check해서 반복수행을 처리한다.
	
	# 프로그래밍 능력의 상승 ==> 문제 해결 능력
	1. 반복문, 배열, 조건문
	2. 다양한 데이터의 처리 ==> 알고리즘
	
		*/
		int sum = 0;
		for(int cnt=1;cnt<=100;cnt++) {
//			sum = sum+cnt;
			sum += cnt;
			System.out.println(cnt+"까지 합:"+sum);
		}
// ex1)	단가 2000과  구매수량 20까지 계를 출력하세요.
//		2000   1   2000
//		2000   2   4000
//		2000   3   6000
//		..
//		2000  20  40000
		int price= 2000;
		for(int cnt=1;cnt<=20;cnt++) {
			System.out.println(price+"\t"+cnt+"\t"+(price*cnt));
		}
		
// ex2) 물건명과 단가, 구매 갯수를 입력받아.
//		@@@  1  3000   3000
//		@@@  2  3000   6000
//		@@@  3  3000   9000
//		@@@  4  3000  12000    4조	
		/*
		Scanner sc = new Scanner(System.in);
		System.out.print("물건명 입력:");
		String name = sc.nextLine();
		System.out.print("가격 입력:");
		int price01 = sc.nextInt();
		System.out.print("갯수 입력:");
		int count = sc.nextInt();
		for(int cnt=1;cnt<=count;cnt++) {
			System.out.print(name+"\t");
			System.out.print(cnt+"\t");
			System.out.print(price01+"\t");
			System.out.print(price01*cnt+"\n");
		}
		*/
// 1~10까지 아래와 같은 형식으로 출력하세요.
// 1 + 2 +  ....9 + 10 = @@@
		int tot=0;
		for(int cnt=1;cnt<=10;cnt++) {
			System.out.print(cnt);
			tot+=cnt;
			if(cnt==10) {
				System.out.println(" = "+tot);
			}else {
				System.out.print(" + ");
			}
		}
// 1~100까지 출력시 5단위로 출력   1 2 3 4 5
//                            6 7 8 9 10
		for(int cnt=1;cnt<=100;cnt++) {
			System.out.print(cnt);
			if(cnt%5==0) {
				System.out.println();
			}else {
				System.out.print("\t");
			}
		}
		

	}

}
