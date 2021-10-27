package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStream;

public class A09_InputStreamExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InputStream is = System.in;

		byte[] irr = new byte[8];
		byte[] prr = new byte[8];
		try {
			System.out.print("아이디를 입력하세요:");
			is.read(irr);
			System.out.print("패스워드를 입력하세요:");
			is.read(prr);
			System.out.println("입력된 id:");	
			for(byte b:irr ) {
				System.out.print((char)b);
			}
			System.out.println();
			System.out.println("입력된 password:");	
			for(byte b:prr ) {
				System.out.print((char)b);
			}
			System.out.println();
			System.out.println("# 입/출력 끝 #");
			is.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
