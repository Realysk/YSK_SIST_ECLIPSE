package javaexp.a04_condition;

import java.util.Scanner;

public class A02_DoubleIF {
	
	/*
	 # 계층적 조건문의 처리
	 	1. 조건문은 해당 조건을 기준으로 다시 조건문을 사용할 수 있다. ==> 중첩 if문이라고 한다.
	 	2. 기본 형식
	 		if(조건1) {
     
                 if(조건2) { 
                    조건1이고 조건2일 때 처리할 구문 
                 } else {
                    조건1이고 조건2가 아닐 때 처리할 구문 
                 } else {
                 }
              } else {
           }
	 # 중첩 조건문 / 반복문의 혼합 처리
	 	1. 기본 형식
	 	for() {
	 		if()
	 	}
	 	if() {
	 		while(){}
	 	}
	 	while(true) {
	 		if(){}
	 	}
	 	for() {
	 		for() {
	 		
	 		}
	 	}
	 	
	 	2. 이중 반복문/중첩반복문을 통해
	 		1) 최대값
	 		2) 최소값
	 		3) 정렬 처리
	 		=> 알고리즘 연습
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String ckMale = "Y";
		// boolean isMale = false; // 남자인지 여부
		boolean isMale = ckMale.equals("Y"); // 남자인지 여부
		int age = 25;
		
		if(isMale) {
			if(age>=20) {
				System.out.println("신사입니다.");
			} else {
				System.out.println("소년입니다.");
			}
		} else {
			if(age>=20) {
				System.out.println("숙녀입니다.");
			} else {
				System.out.println("소녀입니다.");
			}
		}
		
		/*
		 ex1) ID와 PW를 Scanner로 입력받되, ID check를 먼저하고 PW check하여 (himan/7777) 총 4가지 경우를 출력하세요.
		 	1. 인증 완료
		 	2. PW를 확인하세요.
		 	3. ID를 확인하세요.
		 	4. ID, PW 둘 다 틀렸습니다.
		 .equals() (둘 다도 가능) PW만 숫자로 입력받았을 때
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("ID 입력 : ");
		String id = sc.nextLine();
		System.out.println("PW 입력 : ");
		int pw = sc.nextInt();
		
		if(id.equals("himan")) {
			if(pw==7777) {
				System.out.println("인증 완료");
			} else {
				System.out.println("PW를 확인하세요.");
			}
		} else {
			if(pw==7777) {
				System.out.println("ID를 확인하세요.");
			} else {
				System.out.println("ID, PW 둘 다 틀렸습니다.");
			}
		}
	}
}
