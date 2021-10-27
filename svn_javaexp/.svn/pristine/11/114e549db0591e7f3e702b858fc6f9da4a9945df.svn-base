package javaexp.a11_io;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class A15_PathCopyDelete {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String orgInfo = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z02_fileExp\\Person.java";
		String copyInfo = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp\\Person.java";
		// ex) A15_PathCopyDelete.java
//		z02_fileExp/Person.java
//		==>z01_fileExp/Person.java 복사
//		z02_fileExp/Person.java 삭제 처리..		
		
		try {
			Files.copy(Paths.get(orgInfo),
					Paths.get(copyInfo), 
					StandardCopyOption.REPLACE_EXISTING);
			System.out.println("복사 완료!!");
			Files.delete(Paths.get(orgInfo));
			System.out.println("삭제 완료!!!");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
