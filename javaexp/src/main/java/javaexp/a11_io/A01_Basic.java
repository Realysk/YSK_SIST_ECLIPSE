package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStream;

public class A01_Basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 	# 데이터의 전송을 처리하는 Stream
		 		1. 자바에서는 Stream이라는 api 객체를 통해서 데이터를 입력하거나 출력을 하는 등 처리를 하고 있다.
		 			파일의 데이터를 입출력 / 파일 자체를 전송
		 		2. System.out.println() 기본적인 자바의 OutputStream을 통해서 console 화면에 출력되게 한다.
		 		3. 입력 처리를 하는 InputStream!!!
		 			데이터 처리 -- 정수형 ==> char ==> 문자열 ==> 객체(파일)
		 			1) 주요메서드
		 				read() : 문자(char) ==> code값으로 연결되어 있어서 저장되는 것은 정수형이라고 할 수 있다.
		 							이것을 char로 코드값과 연결되어 있는 문자로 표현하여 처리한다.
		 */
			int codeVale = 65;
			char char01 = (char)codeVale;
			System.out.println("65 유니코드 값 : " + char01);
			for(int num = 1; num <= 256; num++) {
				System.out.println(num + ":" + (char)num);
			}
			
			// 자동 비밀번호 생성 65~90 임의의 대문자4
			String pass = "";
			for(int cnt = 1; cnt <= 8; cnt++) {
				int code = (int)(Math.random() * 26 + 65);
				pass += (char)code;
			}
			System.out.println("생성된 임시 비밀번호 : " + pass);
			
			char c01 = 'A'; // char는 ''로 한 자만 입력할 수 있다.
			// char가 보여서 된 배열이 String(문자열) 타입으로 객체로 만들어진다.
			System.out.println("문자 : " + c01);
			System.out.println("코드값 : " + (int)c01);
			// import 단축키 : ctrl + shift + o
			InputStream is = null;
			
			System.out.println("데이터를 입력하세요(문자 한 자)!!");
			// console 창에서 입력받을 수 있는 객체는 System.in
			is = System.in;
			
			// 입력된 글자 한 자를 읽어와서 데이터를 할당하고 할당된 내용을 출력
			// IO(input output) 데이터의 입출력이 일어나는 경우에는 자바에서는 필수 예외처리를 하고 있다.
			// 이 때, 반드시 예외처리를 해줘야 컴파일이 가능하다.
			try {
				
				int num = is.read();
				System.out.println("입력된 코드 번호 : " + num);
				System.out.println("입력된 문자 : " + (char)num);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				// 예외 유무 상관 없이 처리해야 할 내용.
				// Stream 자원을 해제.
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}

}
