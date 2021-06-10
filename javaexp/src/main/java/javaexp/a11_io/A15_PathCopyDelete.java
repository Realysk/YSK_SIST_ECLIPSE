package javaexp.a11_io;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class A15_PathCopyDelete {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 ex) A15)_PathCopyDelete.java
		 	 
		 	 z02_fileExp/Person.java
		  => z01_fileExp/Person.java 복사
		  	 
		  	 z02_fileExp/Person.java 삭제
		 */
		
		// 디렉터리 만들기
		String orgInfo = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\A15_PathCopyDelete.java\\z02_fileExp\\Person.java";
		String copyInfo = "C:\\Users\\ysk23\\AppData\\Roaming\\SPB_Data\\git\\YSK_SIST_ECLIPSE\\javaexp\\src\\main\\java\\javaexp\\a11_io\\A15_PathCopyDelete.java\\z01_fileExp\\Person.java";
		
		Path original = Paths.get(orgInfo);
		Path copy = Paths.get(copyInfo);
		
		try {
			Files.copy(original, copy, StandardCopyOption.REPLACE_EXISTING);
			System.out.println("복사 완료!!");
			Files.delete(Paths.get(orgInfo));
			System.out.println("삭제 완료!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
