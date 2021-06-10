package javaexp.a11_io;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class A13_Path {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # Path 클래스
		 	1. NIO 패키지에서 지원하는 클래스로 보다 효과적으로 파일을 관리하는 클래스이다.
		 	2. 주요 기능 메서드
		 		1) Paths.get("경로및파일명") : 해당 객체 생성
		 		2) getFileName() : 파일 관련 정보
		 		3) getParent() : 상위 관련 정보
		 		
		 		* GitHub 기준 경로
		 		C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\ReadMe.txt
		 		C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\show.txt
		 		
		 		* Workspace 기준 경로
		 		C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\ReadMe.txt
		 		C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\show.txt
		 		
		 */
		
//		Path path = Paths.get("C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\ReadMe.txt");
		Path path = Paths.get("C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\ReadMe.txt");
		System.out.println("getFileName : " + path.getFileName());
		System.out.println("getParent : " + path.getParent());
		System.out.println("getRoot : " + path.getRoot());
		System.out.println("isAbsolute : " + path.isAbsolute());
		
		// 파일 존재 여부
		boolean exist = Files.exists(path);
		System.out.println("파일 존재 여부 : " + exist);
		
		// 파일의 특정 확인
		// read(읽기), write(쓰기), exe(실행가능)
		System.out.println("읽기 : " + Files.isReadable(path));
		System.out.println("쓰기 : " + Files.isWritable(path));
		System.out.println("실행 : " + Files.isExecutable(path));
		
		// 디렉터리 만들기
//		String newPath = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z03_fileExp";
		String newPath = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z03_fileExp";
		Path newDir = Paths.get(newPath);
		
		try {
			Path mkPath = Files.createDirectories(newDir);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일 만들기
		Path newFile = Paths.get(newPath + "\\newFile.txt");
		try {
			Files.createFile(newFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 ex) Path 객체를 활용해서 z04_fileExp ~ z09_fileExp 폴더를 생성하고 각각의 폴더에 a1.txt ~ a10.txt 파일을 생성하세요.
		 */
		for(int fold=4; fold<=9; fold++) {
			// 디렉터리 만들기
			String newPath2 = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z0" + fold + "_fileExp";
//			String newPath2 = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z0" + fold + "_fileExp";
			Path newDir2 = Paths.get(newPath2);
			
			try {
				Path mkPath2 = Files.createDirectories(newDir2);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for(int file=1; file<=10; file++) {
				// 파일 만들기
				Path newFile2 = Paths.get(newPath2 + "\\a" + file + ".txt");
				try {
					Files.createFile(newFile2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}

}
