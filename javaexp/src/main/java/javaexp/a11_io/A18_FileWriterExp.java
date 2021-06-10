package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class A18_FileWriterExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 ex) C:\Users\ysk23\AppData\Roaming\SPB_Data\git\YSK_SIST_ECLIPSE\javaexp\src\main\java\javaexp\a11_io\z02_fileExp\memberinfo.txt
		 	 console에 입력한 내용을 쓰기 처리하세요.
		 	 
		 	 # console에서 라인별로 입력하는 내용
		 	 	BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
				// buffer.readLine()
				System.out.print("입력할 내용 : ");
			
			 # File에 데이터를 쓰는 내용
			 	String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\";
			 	String fname = "memberinfo.txt";
			 	File f = new File(path,fname);
			 	out = new PrintWriter(new FileWriter(new File(path,fname)));
			 	
			 # console에 입력 된 내용을 파일에 쓰기
			 	out.print(buffer.readLine())
			 	
			 # 라인별로 입력한 내용을 출력.
			 	1. StringBuffer를 문자열을 누적 처리할 수 있게 처리
			 	2. while()문을 통해서 문자열을 라인별로 입력 가능하게 하고
			 		- 반복문을 벗어날 조건을 특정한 문자로 지정.
			 			if(data.equals("!Q") {
			 				break;
			 			}
			 		- 그 외에는 계속 문자열 StringBuffer의 append()와 \n 를 통해서 누적 처리.
			 	3. 반복문을 벗어나서 지금까지 입력 한 StringBuffer에 담긴 문자열 out.print(sbf.toString());으로 파일에 쓰기 처리
		 */
		
		BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
		// buffer.readLine()
		
		System.out.print("입력할 내용 : ");
		PrintWriter out = null;
		try {
//			System.out.println(buffer.readLine());
			// 1. 출력할 File 객체 생성
			String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\";
			String fname = "memberinfo.txt";
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
				sbf.append(data+"\n");
			}
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
