package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class A19_FileWriterMultiLine {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 ex) a11_io\z03_fileExp\newFile.txt에 입력한 여러 행의 문자열을 한번에 저장하세요.
		 */
		
		BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
		// buffer.readLine()
		
		System.out.print("입력할 내용 : ");
		PrintWriter out = null;
		try {
//			System.out.println(buffer.readLine());
			// 1. 출력할 File 객체 생성
			String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z03_fileExp\\";
			String fname = "newFile.txt";
			File f = new File(path,fname);
//			FileWriter writer = new FileWriter(new File(path,fname));
			out = new PrintWriter(new FileWriter(new File(path,fname)));
			// 입력된 내용을 라인별로 계속 받아서 처리할 수 있게 반복문 수행
			StringBuffer sbf = new StringBuffer();
			while(true) {
				String data = buffer.readLine();
				// 라인별로 !Q가 입력 시까지 계속 라인별 데이터를 입력
				if(data.equals("!Q")) {
					break;
				}
				// StringBuffer 줄 바꿈과 함께 누적 처리
				sbf.append(data+"\n");
			}
			// 최종적으로 출력
			// 지금까지 입력된 문자열을 파일에 쓰기 처리
			out.print(sbf.toString());
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
