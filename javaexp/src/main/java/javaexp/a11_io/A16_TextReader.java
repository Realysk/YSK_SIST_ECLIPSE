package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class A16_TextReader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 파일의 내용 읽고/쓰기
		 	1. 파일 내용 읽기 프로세스
		 		1) File 객체 생성 : 대상 객체 선언.
		 			ex) new File(경로명, 파일명)
		 		2) FileReader : 파일의 내용을 읽어오는 객체
		 			new FileReader(new File());
		 		3) BufferedReader : 입력되어 있는 내용을 라인 단위로 읽어올 때 사용되는 객체
		 			new BufferedReader(new FileReader(new File()))
		 			readLine() : 파일에 저장된 데이터를 라인 단위로 읽어 온다.
		 */
		
		String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\";
		String fname = "GoodNews.txt";
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
		
		/*
		 ex) javaexp\a11_io\z01_fileExp\Person.java
		 	 A16_TextReaderExp.java를 만들고 파일의 내용을 읽어와서 출력하세요.
		 */
		
		

	}

}
