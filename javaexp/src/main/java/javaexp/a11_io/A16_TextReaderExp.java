package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class A16_TextReaderExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 ex) javaexp\a11_io\z01_fileExp\Person.java
		 	 A16_TextReaderExp.java를 만들고 파일의 내용을 읽어와서 출력하세요.
		 */
		
		String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\";
		String fname = "Person.java";
		
		File f = new File(path, fname);
		try {
			
			FileReader fr = new FileReader(f);
			BufferedReader bfr = new BufferedReader(fr);
			System.out.println("# 파일에서 읽어 온 내용 #");
			String str = null;
			do {
				str = bfr.readLine();
				if(str != null) {
					System.out.println(str);
				} else {
					break;
				}
			} while(true);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
