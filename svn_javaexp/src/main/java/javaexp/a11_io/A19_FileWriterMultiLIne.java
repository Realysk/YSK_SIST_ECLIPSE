package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class A19_FileWriterMultiLIne {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
// ex) a11_io\z03_fileExp\newFile.txt
//		에 입력한 여러 행의 문자열을 한번에 저장처리
//		하세요. 
		BufferedReader buffer = new BufferedReader(
				new InputStreamReader(System.in));
		System.out.println("파일에 입력할 내용:");
		PrintWriter out=null;
		try {
			String path="C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z03_fileExp";
			String fname="newFile.txt";
			out =  new PrintWriter(
					new FileWriter( new File(path,fname)));
			StringBuffer sbf = new StringBuffer();
			while(true) {
				String data = buffer.readLine();
				if(data.equals("!Q")) {
					break;
				}
				// StringBuffer 줄바꿈과 함께 누적처리
				sbf.append(data+"\n");
			}
			// 최종적으로 출력처리..
			out.print(sbf.toString());
			System.out.println("출력 종료!!");
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
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
