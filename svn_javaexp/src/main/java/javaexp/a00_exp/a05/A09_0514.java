package javaexp.a00_exp.a05;

import java.util.Scanner;

public class A09_0514 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*		
//	1. java프로그램을 작성한 후, 컴파일 과정과 실행과정을 
 * 		main()와의 관계 속에서 기술하세요
//	    1) 실행명령어 위치기술, 컴파일 파일 위치기술
		C:\Program Files\Java\jdk-15.0.1\bin
			java.exe
			javac.exe
		javaexp/build/classes : 옵션으로 지정 처리..
			저장하는 순간 해당 클래스의 컴파일 파일이 @@@.class로 저장된다.
			C:\javaexp\workspace\javaexp\build\classes
//	    2) A01_Start.java 기준을 main()가 있을 때와 없을 때의 차이점
 * 			공통 : 컴파일 파일까지 만들어 진다. A01_Start.class 
 * 			main() 있을 때.
 * 				실행을 할 수 있다. java A01_Start 명령을 통해서 실행을 하고,
 * 				실행 결과를 확인할 수 있다.
 *			main() 없을 때
 *				실행이 불가능하다. 외부에서 main()메서드가 있는 클래스에서만
 *				import하고 호출하여 객체 생성이 가능하다.
 * 			
//	    3) 컴파일 실행 파일 만들어 지는 과정
 			A01_Start.java를 통해서 text 작성,
 			javac A01_Start.java 명령을 통해서 compile
 				eclipse에서는 에러없이 저장시, compile된다.
 				==> A01_Start.class 파일 특정위치에 생성
 			해당 클래스내에	main()메서드를 포함시,
 			java A01_Start  명령을 통해서 실행 처리되어 main()안에서
 				선언되 내용이 처리된다.
 				
 */
//	2. 변수의 계층적(중괄호 블럭)으로 처리된다는 의미를 지역변수/전역변수와 함께 간단한 예제로 기술하세요
/*
		중괄호 블럭{}단위로 계층적으로 종속되어 변수를 사용할 수 있다는 의미이다.
		클래스{}, 생성자{}, 메서드{}, if(){}, for(){}
		상위1변수
		{
		
			하위1변수
			{
				상위1변수 사용 가능
				하위1변수 사용 가능
			}
		}
		하위1변수사용못함.
		

 */
//	3. 변수명의 선언 규칙을 클래스의 구성요소와 변수명을 나누어서 기술하세요.
//	    (클래스명/생성자명/참조변수명/메서드명)
	/*
	class Person{ // 클래스명 생성자는 대문자로 시작 선언
		private String name; // 변수명은 소문자로 시작
		Person(String name){
			// 매개변수 String name는 지역변수
			// this.name 는 필드명 변수
			// 지역변수를 전역변수에 할당 할 수 있다.
			this.name = name;
			
		}
		// 매서드명은 소문자로 시작하고, 합성어의 구분자는 대문자로 시작한다.
		//   set + name ==> setName
		public void setName(String name) {
			this.name = name;
		}
	}
	// main()
	// Person p01 = new Person();
	// 클래스명  참조변수 = new 생성자명();
	// 참조변수는 소문자로 시작하여 선언;
 * */		
//	4. 자바의 기본데이터 유형과 크기(byte)를 변수 선언과 할당과 함께 주석문으로 설명하세요.
	      // 정수형
	      byte num01 = 127;
	      // byte : 정수형, 1byte, -128~127 값을 가짐
	      char num02 = '네';
	      // char : 정수형, 2byte, 0~65535 값을 가짐, 유니코드 문자를 나타낸다. 
	      short num03 = 32767;
	      // short : 정수형, 2byte, -32768~32767
	      int num04 = 1234567;
	      // int : 정수형, 4byte, 정수형의 기본 데이터 유형
	      long num05 = 1234564654654L;
	      long num15 = 1234564654654l;
	      
	      // long : 정수형, 8byte, long 유형인것을 알리는 
	      //       대문자/소문자 L/l을 적어줘야 적용됨
	      
	      // 실수형
	      float num06 = 120.13f;
	      float num16 = 120.13F;
	      // float : 실수형, 4byte, 기본 데이터 유형이 아니라서 
	      //        대문자/소문자 F/f를 적어줘야 적용
	      double num07 = 12345.1234;
	      // double : 실수형, 8byte, 실수형의 기본 데이터 유형
	      
	      // 논리형
	      boolean num08 = false;
	      // boolean : 논리형, 1byte, true/false값만 가질 수 있다.		
//	5. 자바에서 형변환 유형을 기본유형과 상속에 의한 유형을 나누어서 예제를 통해 기술하세요.
	      System.out.println("\n# 5. 형변환 유형 - 기본 유형 #");
	      int num11 = 10;
	      double num22 = num11;
	      System.out.println("promote 결과 : " + num22);
	      
	      double num33 = 30.28;
	      int num44 = (int) num33;
	      System.out.println("casting 결과 : " + num44);
	      
	      // promote, Father 객체로 만들어진것이라서 아들의 메소드 사용 불가능
	      Father ft = new Son("홍길동"); 
//	      ft.printName(); 하위에 있는 메서드는 상위객체로 사용을 할 수 없다.
	      // Father 객체로 만들어진 것을 Son으로 만듬. 큰 -> 작은 casting이라 명시화
	      Son son = (Son) ft;
	      son.printName();	      
	      
	      
//	6. 연산자의 종류 중에서 비교연산자와 논리연산자의 차이점에 대하여 기술하세요.
/*		비교연산자 : 변수의 비교(!=,==,>=,<), equals() 기능 메서드를 통해 
 * 			boolean값을 가져오는 것을 말한다. 
 * 		논리연산자 : 비교연산자와 함께 !(반대), &&, || 두 논리값을 not,
 * 			and, or 로 연결하여 결과값을 처리하는 연산자.
 * */	      
	      
//	7. 아래와 같은 데이터를 처리할려고 한다. 비교/논리 연산자를 활용하자.
//	    놀이 공원에서 기본 요금 50000
//	    5미만 65이상 할인율 100%
//	    5~8 할인율 50%
//	    9~18 할인율 30%
//	    19~64 할인율 0%
//	    1단계) 할인율만 표시
//	    2단계) 할인율을 계산해서 typecasting하여 출력 하세요
	      Scanner sc = new Scanner(System.in);
	      System.out.println("# 놀이 공원에 오신 것을 환영합니다 #");
	      System.out.print("입장객의 나이를 입력하세요:");
	      int age = sc.nextInt();
	      int pay = 50000;
	      if(age<5 || age>=65) {
	    	  System.out.println("100% 무료입장");
	    	  pay=0;
	      }else if(age<=8) {
	    	  System.out.println("50% 할인");
	    	  pay = pay-(int)(pay*0.5);
	      }else if(age<=18) {
	    	  System.out.println("30% 할인");
	    	  pay = pay-(int)(pay*0.3);
	      }else {
	    	  System.out.println("할인 없음");
	      }
	      System.out.println("지불한 금액:"+pay+"원 입니다!");
	}
}
class Father {}

class Son extends Father {
   private String name;
   
   public Son(String name) {
      super();
      this.name = name;
   }

   void printName() {
      System.out.println("아들의 이름 : " + name);
   }
   
}

