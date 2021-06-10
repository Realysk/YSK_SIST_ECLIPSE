package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStream;

public class A08_inputStream2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 입력스트림과 출력스트림
		 	0. 
		 	1. 프로그램을 기준으로 특정한 입력도구나 프로그램을 통해서 해당 데이터를 입력받게 해주는 객체가 입력스트림이다.
		 		1) 출발지 : 키보드, 파일, 프로그램
		 		2) 도착지 : 입력받은 데이터를 처리
		 		3) 입력스트림 : 출발지와 도착지 사이에 데이터를 전달해주는 객체를 말한다.
		 	
		 	2. 프로그램을 기준으로 데이터를 대상 출력 도구나 프로그램에 출력 하게 해주는 객체가 출력스트림이다.
		 		1) 출발지 : 프로그램을 통한 명령
		 		2) 도착지 : 모니터, 저장파일, 프로그램
		 		3) 출력스트림 : 출발지와 도착지 사이에 데이터 전달해주는 객체
		 		
		 	3. 바이트 기반 스트림과 문자 기반 스트림
		 		1) 바이트 기반 스트림
		 			그림, 멀티미디어, 문자 등 모든 종류의 데이터를 받고 보내는 것이 가능한 스트림
		 			InputStream (입력) <--- XXXinputStream
		 			OutputStream (출력) <--- XXXOutputStream
		 		2) 문자 기반 스트림
		 			Reader (문자입력) <--- XXXReader
		 			Writer (문자출력) <--- XXXWriter
		 			
		 	4. InputStream
		 		1) 바이트 기반 입력 스트림의 최상 클래스로 추상 클래스
		 		2) 상속 관계
		 			InputStream
		 			- FileInputStream
		 			- BufferedInputStream
		 			- DataInputStream
		 		3) 주요 메서드
		 			read() : byte로 입력한 문자 1자를 읽기 처리.
		 				(char) 캐스팅을 통해서 처리.
		 			read(byte[] b) : 입력한 문자열을 byte[]에 담아서 처리.
		 			read(byte[] b, int off, int len) : 입력한 문자열 byte[] 중에서 특정한 위치에 있는 부분을 추출 처리.
		 			close() : Stream을 통해 처리한 시스템 자원을 반납 하고 입력스트림을 닫는다.
		 */
		
//		1. 입력스트림 객체 System.in (자바의 기본 입력 처리) 통해서 객체 생성.
		
		InputStream is = System.in;
		
//		2. 입력 받은 문자열의 크기 지정
		
		byte[] brr = new byte[5]; // 문자를 3개 입력 받는 배열 선언.
		
//		3. read(입력 받아서 저장할 배열 선언)
		
		try {
			System.out.print("문자를 입력하세요 : ");
			// 입력 받은 문자열을 byte[] b에 할당 처리.
			int n = is.read(brr);
			System.out.println("문자 갯수 : " + n);
			System.out.println("입력된 문자!");
			for(byte b:brr) {
				// byte => char 형 변환 처리
				System.out.print((char)b);
			}
			// # String 생성자를 통해서 데이터를 처리할 수 있다.
			// 1. new String(byte[]);
			// 2. new String(char[]);
			String str1 = new String(brr);
			System.out.println("출력 : " + str1);
			
			System.out.println();
			System.out.println("출력 끝!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
