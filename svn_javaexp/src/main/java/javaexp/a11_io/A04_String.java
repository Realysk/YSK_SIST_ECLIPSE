package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class A04_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
# Stream객체를 통해서 문자열을 입력처리..
1. Stream객체는 기능적으로 추가되는 기능을 생성자를 통해서
확장된 기능을 만들어 가는 패턴으로 구성되어 있다.
 	InputStream  : char ==> char[] 
 		1byte의 문자만 처리(한글 특수 입력불가능)
 		
 	int ==> char ==> char[]	==> String
 								(객체지향프로그램)
 		
2. 기능적으로 확장된 객체는 InputStream을 상속 받은 하위객체들이다.
3. 하위 객체를 독립적으로 혼자 써서, 기능을 구현하지 못하고,
	new 최하위객체(new 하위객체(new 상위객체()))
	생성자를 통해서 상위객체를 가지고, 기능을 추가하여 처리하고 있다.
4. InputStream의 하위 객체들..
	1) InputStreamReader : 2byte이상 문자를 처리해준다.(한글입력가능)
	2) BufferedReader : 객체에서는 입력된 내용을 효율적을 사용하기 위하여
		Buffer메모리를 사용하는데, readLine() 메서드를 통해서
		문자를 하나하나 다 받아서 문자열만들어 enter키를 단위 데이터를 입력
		받아서 처리해준다.
		*/
		// System.in : 자바에서 지원하는 입력 기본 Stream 객체
		//    Console창에서 입력되는 내용을 InputStream객체에 할당한다.
		//InputStream is = System.in;
		BufferedReader buffer =
			new BufferedReader(
					new InputStreamReader( System.in ));
		System.out.println("등록할 아이디를 입력하세요!!");
		try {
			String id = buffer.readLine(); 
			// enter입력시까지 문자를 모아서 문자열을 만들어 전달.
			System.out.println("입력된 아이디는 "+id+"입니다!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				// 메모리에 Stream 객체의 자원을 해제.
				buffer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*		
				
		*/		
		
	}

}
