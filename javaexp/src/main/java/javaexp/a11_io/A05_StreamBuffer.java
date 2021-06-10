package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class A05_StreamBuffer {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*		
		ex) StreamBuffer를 이용해서
			ID :
			PW :
			입력받아서
			1단계 : 입력한 ID:@@@, PW:@@@
			2단계 .equals() 이용해서 인증여부 출력 (로그인성공 / 로그인실패)
			InputStream => InputStreamReader => BufferedReader
			생성자의 매개값으로 설정하여 추가 기능 메서드가 적용되어 처리된다.
		*/
		
		BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("등록할 아이디와 패스워드를 줄바꿈으로 입력하세요.");
		try {
			String id = buffer.readLine();
			String pw = buffer.readLine();
			System.out.println("ID : " + id);
			System.out.println("PASS : " + pw);
			if(id.equals("himan") && pw.equals("7777")) {
				System.out.println("로그인 성공");
			} else {
				System.out.println("로그인 실패");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				buffer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
