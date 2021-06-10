package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class A17_FileWriter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # File 쓰기
		 	1. 주요 처리 절차
		 		1) 대상 File 지정.
		 		2) System.in으로 입력 처리.
		 			InputStream => InputStreamReader => BufferedReader
		 		3) PrintWriter를 이용해서 출력 객체를 활용.
		 		4) File => FileWriter => PrintWriter
		 			입력된 내용을 PrintWriter의 out.print()를 활용해서 출력.
		 */
		
		BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("입력할 내용 : ");
		PrintWriter out = null;
		try {
//			System.out.println(buffer.readLine());
			// 1. 출력할 File 객체 생성
			String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\";
			String fname = "show.txt";
			File f = new File(path,fname);
			FileWriter writer = new FileWriter(f);
			out = new PrintWriter(writer);
			// 해당 파일에 쓰기
			out.print(buffer.readLine());
			System.out.println("출력 종료!!");
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
			out.close();
		}

	}

}
