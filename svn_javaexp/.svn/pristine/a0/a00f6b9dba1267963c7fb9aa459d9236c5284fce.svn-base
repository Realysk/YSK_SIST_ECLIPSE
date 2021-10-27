package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStreamReader;

public class A10_Reader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 문자에 대한 처리를 해주는 Reader/Writer객체
1. 2byte이상의 문자에 대한 처리는 해주는 Stream객체.
 
 * */
		InputStreamReader reader = new InputStreamReader(System.in);
		char[] chArr = new char[10];
		try {
			System.out.print("이름을 입력하세요:");
			reader.read(chArr);
			System.out.println("#입력된 이름#");
			for(char c:chArr) {
				System.out.print(c);
			}
			System.out.println("출력 끝");
			// Stream 자원의 해제
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 예외가 발생하거나 발생하지 않거나 상관없이 자원해제 처리
			try {
				reader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
