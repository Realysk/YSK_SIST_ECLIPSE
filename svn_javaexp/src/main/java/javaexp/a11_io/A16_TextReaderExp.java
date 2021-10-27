package javaexp.a11_io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class A16_TextReaderExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 String path = "C:\\javaexp\\workspace\\javaexp\\src\\main\\java\\javaexp\\a11_io\\z01_fileExp";
	      String fname = "Person.java";
	      File f = new File(path,fname);
	      try {
	         FileReader fr = new FileReader(f);
	         BufferedReader bfr = new BufferedReader(fr);
	         System.out.println("#파일에서 읽어온 내용");
	         String str = null;
	         do {
	            str = bfr.readLine();
	            if(str!=null) {
	            	System.out.println(str);
	            }else {
	            	break;
	            }
	         }while(true);
	      }catch(IOException e){
	         e.printStackTrace();
	      }

	}

}
