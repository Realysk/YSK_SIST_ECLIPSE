package javaexp.a00_exp;

import java.util.Scanner;

public class A09_0514 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 정리 문제
		 	1. java 프로그램을 작성한 후 컴파일 과정과 실행과정을 main()와의 관계 속에서 기술하세요.
		 		1) 실행 명령어 위치, 컴파일 위치
		  			C:\Program Files\Java\jdk-15.0.2\bin, bin\javac.exe
		  		2) main()가 있을 때와 없을 때의 차이점
		  			A01_Start.java 기준으로 main()이 포함된 클래스만 java.exe를 통해 java A01_Hello 가 실행 된다.
		  		3) 컴파일 실행 파일이 만들어 지는 과정
		  
		  	2. 변수의 계층적(중괄호 블럭)으로 처리된다는 의미를 지역변수/전역변수와 함께 간단한 예제로 기술하세요.
		*/
				class Calcu {
					private int num01;
					private int num02;

					Calcu(int num03, int num04) {
						this.num01 = num03;
						this.num02 = num04;
					}
					int plus() {
						return num01 + num02;
					}
					int minus() {
						return num01 - num02;
					}
					int multi() {
						return num01 * num02;
					}
					int divide() {
						return num01 / num02;
					}
				}
		/*
		  
		  3. 변수명의 선언 규칙을 클래스의 구성요소와 변수명을 나누어서 기술하세요.
		  	(클래스명/생성자명/참조변수명/메서드명)
		  		
		  		클래스명.참조변수 = new 생성자();
		  		참조변수.필드명="할당할 데이터";
		  		
		  		ex) Person.p1 = new Person();
		  			p1.name = "홍길동";
		  
		  4. 자바의 기본데이터 유형과 크기(byte)를 변수 선언과 할당과 함께 주석문으로 설명하세요.
		  		
		  		정수형 : byte(1byte), char(2byte), short(2byte),
		  				int(4byte), long(8byte)
		  		실수형 : float(4byte), double(8byte)
		  
		  5. 자바에서 형 변환 유형을 기본 유형과 상속에 의한 유형을 나누어서 예제를 통해 기술하세요.
		  
		  	*/
//				1. 기본 유형
		  		int num01 = 25;
				int num02 = num01;
				System.out.println(num02);
				
//				2. 상속 유형
				Mother m1 = new Daughter();
//				m1.show(); (X)
				Daughter d1 = (Daughter)m1;
				d1.show();
				Object o2 = m1;
				Daughter d2 = (Daughter)o2;
				d2.show();
			/*
		  
		  6. 연산자의 종류 중에서 비교연산자와 논리연산자의 차이점에 대하여 기술하세요.
		  
		  		비교연산자 : 두개의 값을 비교하여 결과로 boolean값을 처리하는 연산자를 말한다.
		  		논리연산자 : 비교연산자의 반대 개념이다. true면 false, false면 true로 결과가 출력된다.
		  
		  7. 아래와 같은 데이터를 처리하려 한다. 비교/논리 연산자를 활용하자.
		  	놀이 공원에서 기본 요금 50,000
		  	<나이에 따른 요금 할인율>
		 	5세 미만 65세 이상 할인율 100%
		 	5세~8세 할인율 50%
		 	9세~18세 할인율 30%
		 	19세~64세 할인율 0%
		 	1단계) 할인율만 표시
		 	2단계) 할인율을 계산해서 총 비용을 typecasting하여 출력하세요.
		 	
		 	*/
				System.out.println("\n ## 연령 별 요금 할인율 ##");
	            System.out.println("\n 5~8세 : 50% \n 9~18세 : 30% \n 19~64세 : 0%");
	            Scanner sc = new Scanner(System.in);
	            System.out.println("\n 나이를 입력하세요 : ");
	            int age = sc.nextInt();
	            if(age>=5 && age<=8) {
	               System.out.println(age + " 세의 할인율은 " + "50 % 이므로 " + (50000 * 0.5) + " 원 입니다.");
	            } else if(age>=9 && age<=18) {
	               System.out.println(age + " 세의 할인율은 " + "30 % 이므로 " + (50000 * 0.7) + " 원 입니다.");
	            } else if(age>=19 && age<=64) {
	               System.out.println(age + " 세의 할인율은 " + "0 % 이므로 " + (50000 * 1.0) + " 원 입니다.");
	            } else {
	            	System.out.println(age + " 세의 할인율은 " + "100 % 이므로 " + (50000 * 0.0) + " 원 입니다.");
	            }

			/*
		 	
		 */
	}
}

class Mother {}
class Daughter extends Mother {
	void show() {
		System.out.println("딸 입니다.");
	}
}
