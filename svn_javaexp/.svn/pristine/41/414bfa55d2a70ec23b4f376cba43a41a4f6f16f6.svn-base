package javaexp.a00_exp.a06;

import java.io.IOException;
import java.io.InputStreamReader;

public class A19_0609 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 문제
1. 제너릭 타입에 대하여 개념과 장점을 설명하세요.
   사전에 사용할 객체에 대한 타입을 외부에서 지정하여,
   다른 타입을 할당하는 것을 방지하여, 프로그램의 
   데이터 타입에 대한 확정을 하는 것을 말한다.
2. 이점
	1) 컴파일 시 강한 타입 체크 가능
		실행시 타입 에러가 나는 것 방지
		컴파일 시에 미리 타입을 강하게 체크해서 에러 사전 방지.
	2) 타입변환 제거 가능..	

2. class 클래스<타입> 선언의 의미를 기술하세요.
	어떤 type이 속성으로 사용할 것인지를 선언
	해당 T(타입)으로 클래스의 속성으로 지정 처리..
	가변적인 속성을 generic으로 <T>형식 선언하여, 여러가지 데이터
	유형의 속성을 사용할 수 있게 처리할 때, 활용한다.
	class Box<T>{
		private T t; // 해당 Type으로 된 객체를 속성으로 선언
		public T get(){ //해당 type으로 된 객체를 리턴
			return t;
		}
		public void set(T t){ // 해당 type으로 된 객체를 할당.
			this.t = t;
		}
	}
3. generic 타입으로 WorkingGroup<T>으로 설정하고,
    실제 속성으로 FireMan, PoliceMan등을 할당하여,
    실행하세요.
      WokingGroup<FireMan> w1 = new WokingGroup<FireMan>();
      w1.setT(new FireMan());
      System.out.println(w1.getT());
      WokingGroup<PoliceMan> w2 = new WokingGroup<PoliceMan>();
      w2.setT(new PoliceMan());
      System.out.println(w2.getT());
      WokingGroup<Programmer> w3 = new WokingGroup<Programmer>();
      w3.setT(new Programmer());
      System.out.println(w3.getT());    
4. 스트림은 어떤 역할을 하는지 기술하세요.
    프로그램 단위로 데이터를 입출력 처리해주는 객체를 말한다.
5. 바이트기반 스트림과 문자기반 스트림의 차이점을 기술하세요.
	1) 바이트 기반 스트림
		그림, 멀티미디어, 문자 등 모든 종류의 데이터를 받고
		보내는 것이 가능한 스트림
		InputStream (입력) <--- XXXInputStream
		OutputStream (출력) <--- XXXOutputStream
	2) 문자 기반 스트림
		문자만 받고 보낼 수 있도록 특화된 스트림
		Reader (문자입력) <-- XXXReader
		Writer (문자출력) <-- XXXWriter
6. InputStream과 byte[]을 이용하여 사원번호와 이름을 등록하세요.
		InputStream is = System.in;
		// 1 입력받을 사원번호와 이름의 배열 선언.
		byte [] empnoArr = new byte[10];
		byte [] enameArr = new byte[10];	
		try {
			System.out.print("사원번호를 입력하세요:");
			is.read(empnoArr);
			System.out.print("사원명을 입력하세요:");
			is.read(enameArr);
			System.out.println("#입력데이터#");
			System.out.println("사원번호:"+
					new String(empnoArr).trim());
			System.out.print("사원명:");
			for(byte b:enameArr) {
				System.out.print((char)b);
			}			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원해제 finally 구문에 처리..
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
7. 2byte이상 문자를 입력받는 스트림 객체 InputStreamReader와 char[]을
    이용하여, 학생이름과 국어성적을 등록 및 출력하세요.
 * */
		char[] name = new char[10];
		char[] kor = new char[10];
		InputStreamReader isr = new InputStreamReader(System.in);
		
		try {
			System.out.print("이름을 입력하세요:");
			isr.read(name);
			String nameS = new String(name);
			System.out.print("국어 성적을 입력하세요:");
			isr.read(kor);
			String korS = new String(kor);	
			System.out.println("# 입력한 데이터 #");
			System.out.println("이름:"+nameS.trim());
			System.out.println("국어:"
					+Integer.parseInt(korS.trim()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				isr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		
	}

}
class WorkingGroup<T>{
	private T worker;

	public T getWorker() {
		return worker;
	}
	public void setWorker(T worker) {
		this.worker = worker;
	}
}
class FireMan{}
class PoliceMan{}
