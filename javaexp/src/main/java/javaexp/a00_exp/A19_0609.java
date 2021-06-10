package javaexp.a00_exp;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class A19_0609 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 0609 정리문제 #
		 	1. Generic 타입에 대해 개념과 장점을 설명하세요.
				- 컴파일 단계에서 잘못된 타입이 사용될 수 있는 문제를 제거 가능하게 해준다.
		 		- 장점
		 			1) 컴파일을 하게 되면 강한 타입을 우선으로 체크가 되며 실행 시 타입 에러 방지 기능이 있다.
		 			2) 타입 변환 제거가 가능하다.
		 	
		 	2. class 클래스<타입> 선언의 의미를 기술하세요.
		 		- 클래스를 선언할 때 타입 파라미터를 사용한다.
					class 클래스명<T>
					어떤 type이 속성으로 사용할 것인지를 선언하고 해당 type으로 클래스의 속성으로 지정한다.
		 	
		 	3. generic 타입으로 WorkingGroup<T>로 설정하고 실제 속성으로 FireMan, PoliceMan등을 할당하여 실행하세요.
		 	
		 		*/
//	      			WokingGroup<FireMan> w1 = new WokingGroup<FireMan>();
//	      			w1.setT(new FireMan());
//	      			System.out.println(w1.getT());
//	      			WokingGroup<PoliceMan> w2 = new WokingGroup<PoliceMan>();
//	      			w2.setT(new PoliceMan());
//	      			System.out.println(w2.getT());
//	      			WokingGroup<Programmer> w3 = new WokingGroup<Programmer>();
//	      			w3.setT(new Programmer());
//	      			System.out.println(w3.getT());   
				/*
		 	
		 	4. 스트림은 어떤 역할을 하는지 기술하세요.
		 		- 스트림은 입력스트림과 출력스트림 2가지로 구분할 수 있다.
		 			1. 프로그램을 기준으로 특정한 입력도구나 프로그램을 통해서 해당 데이터를 입력 받게 해주는 객체가 입력스트림이다.
		 				1) 출발지 : 키보드, 파일, 프로그램
		 				2) 도착지 : 입력받은 데이터를 처리
		 				3) 입력스트림 : 출발지와 도착지 사이에 데이터를 전달해주는 객체를 말한다.
		 	
		 			2. 프로그램을 기준으로 데이터를 대상 출력 도구나 프로그램에 출력 하게 해주는 객체가 출력스트림이다.
		 				1) 출발지 : 프로그램을 통한 명령
		 				2) 도착지 : 모니터, 저장파일, 프로그램
		 				3) 출력스트림 : 출발지와 도착지 사이에 데이터 전달해주는 객체
		 	
		 	5. byte기반 스트림과 문자기반 스트림의 차이점을 기술하세요.
		 		1) 바이트 기반 스트림
		 			그림, 멀티미디어, 문자 등 모든 종류의 데이터를 받고 보내는 것이 가능한 스트림
		 			InputStream (입력) <--- XXXinputStream
		 			OutputStream (출력) <--- XXXOutputStream
		 		2) 문자 기반 스트림
		 			Reader (문자입력) <--- XXXReader
		 			Writer (문자출력) <--- XXXWriter
		 			
		 		- 바이트 기반 스트림은 다양한 종류의 데이터를 보내고 받는 것이 가능하나, 문자 기반 스트림은 오로지 문자만 보내고 받는 것이 가능하다.
		 	
		 	6. InputStream과 byte[]를 이용하여 사원번호와 이름을 등록하세요.
		 	
		 		*/
					InputStream is = System.in;
					// 1. 입력 받을 사원번호와 이름의 배열 선언
					byte [] empnoArr = new byte[10];
					byte [] enameArr = new byte[10];
					try {
						System.out.print("사원번호를 입력하세요 : ");
						is.read(empnoArr);
						System.out.print("사원명을 입력하세요 : ");
						is.read(enameArr);
						System.out.println("# 입력 데이터 #");
						System.out.println("사원번호 : " + new String(empnoArr).trim());
						System.out.print("사원명 : ");
						for(byte b:enameArr) {
							System.out.print((char)b);
						}
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						try {
							is.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				
				/*
		 	
		 	7. 2byte이상 문자를 입력받는 스트림 객체 InputStreamReader와 char[]을 이용하여 학생이름과 국어성적을 등록하세요.
		 	
		 		*/
					char[] name = new char[10];
					char[] kor = new char[10];
					InputStreamReader isr = new InputStreamReader(System.in);
					
					try {
						System.out.print("이름을 입력하세요 : ");
						isr.read(name);
						String nameS = new String(name);
						System.out.print("국어 성적을 입력하세요 : ");
						isr.read(kor);
						String korS = new String(kor);
						System.out.println("# 입력한 데이터 #");
						System.out.println("이름 : " + nameS.trim());
						System.out.println("국어 성적 : " + Integer.parseInt(korS.trim()));
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						try {
							isr.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				/*
		 	
		 */

	}

}
}
//class WorkingGroup<T>{
//	private T worker;
//
//	public T getWorker() {
//		return worker;
//	}
//	public void setWorker(T worker) {
//		this.worker = worker;
//	}
//}
//class FireMan{}
//class PoliceMan{}