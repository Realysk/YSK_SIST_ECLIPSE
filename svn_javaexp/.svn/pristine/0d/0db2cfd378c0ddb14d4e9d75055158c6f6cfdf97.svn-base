package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStreamReader;

public class A11_Reader2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InputStreamReader reader = new InputStreamReader(System.in);
		char[] nArr = new char[10];
		char[] pArr = new char[10];
		char[] cArr = new char[10];
		try {
			System.out.print("물건이름을 입력하세요:");
			reader.read(nArr);
			System.out.print("가격을 입력하세요:");
			reader.read(pArr);
			System.out.print("갯수를 입력하세요:");
			reader.read(cArr);
			// new String(char[]) ==> 문자열String 타입으로 변환
			String pname = new String(nArr);
			// .trim() : 입력되지 않는 공백문자를 제거처리..
			System.out.println("물건명:"+pname.trim());
			String prS = new String(pArr);
			// 입력한 char[]을 String으로 변환 
			// 공백을 제거 .trim()
			// Integer.parseInt("숫자형문자열")을 통해 숫자로 변환.
			int price = Integer.parseInt(prS.trim());
			System.out.println("가격:"+price);
			String cnS = new String(cArr);
			int cnt = Integer.parseInt(cnS.trim());
			System.out.println("갯수:"+cnt);
			System.out.println("총계:"+price*cnt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				reader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
