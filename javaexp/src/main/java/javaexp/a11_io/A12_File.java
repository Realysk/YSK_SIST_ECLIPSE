package javaexp.a11_io;

import java.io.File;
import java.io.IOException;

public class A12_File {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # File 입/출력
		 	1. File 클래스 (파일의 구성요소인 Directory와 File자체에 대한 처리를 하는 객체)
		 		1) 파일 시스템의 파일을 표현하는 클래스
		 			- 파일 크기, 파일 속성, 파일 이름 등의 정보 제공
		 			- 파일 생성 및 삭제 기능 제공
		 			- 디렉터리 생성, 디렉터리에 존재하는 파일 리스트 얻어내는 기능 제공
		 		2) 파일 객체 생성
		 			File = f01 = new File("경로와파일명");
		 		3) 기능 메서드
		 			.exists() : 해당 파일이 있는지 여부 : 물리적 파일
		 			.createNewFile() : 해당 경로에 물리적 파일을 생성.
		 			.mkdir() : 새로운 디렉터리를 생성.
		 			.mkdirs() : 경로상에 없는 모든 디렉터리를 생성.
		 			.delete() : 파일 또는 디렉터리 삭제.
		 			
		 			* GitHub 기준 경로
		 			C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\ReadMe.txt
		 			C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\show.txt
		 			* Workspace 기준 경로
		 			C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\ReadMe.txt
		 			C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\show.txt
		 			
		 */
		
//		String path = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp";
		String path = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp";
		String fname = "ReadMe.txt";
		
		File f01 = new File(path, fname);
		System.out.println(f01.getName());
		System.out.println(f01.exists());
		System.out.println(f01.getPath());
		System.out.println(f01.length());
		String fname2 = "GoodNews.txt";
		File f02 = new File(path, fname2);
		System.out.println(f02.exists());
		if(!f02.exists()) {
			try {
				f02.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/*
		ex) z02_fileExp 패키지 생성
			Person.java 클래스 생성
			파일 정보 출력 : 파일이 있는지/파일명/경로명/크기
			show.txt : 파일 객체를 생성을 하고 기능메서드에 실제 파일 생성
			
			// GitHub 기준 경로
		 */

//		String path2 = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\";
////		String path2 = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\";
//		String fname3 = "Person.java";
//		
//		File f03 = new File(path2, fname3);
//		System.out.println(f03.getName());
//		System.out.println(f03.exists());
//		System.out.println(f03.getPath());
//		System.out.println(f03.length());
//		String fname4 = "show.txt";
//		File f04 = new File(path2, fname4);
//		System.out.println(f04.exists());
//		try {
//			f04.createNewFile();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

}
