package Project_SIST.Java.A05_Picmagine.upload;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

import Project_SIST.Java.Model;


public class UPLMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UPLMain uin = new UPLMain();
//		uin.main(args);
		
		Scanner sc = new Scanner(System.in);
		UPLDTO udto = new UPLDTO();
		
		Calendar cal = Calendar.getInstance();
		DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:MI:SS"); // 작성일
						
		System.out.println("# Picmagine 게시물 업로드 #\n");
		
		System.out.print(" -> 카테고리 : ");
		String artcategory = sc.nextLine();
		udto.setArtcategory(artcategory);
		
		System.out.print(" -> 제목 : ");
		String arttitle = sc.nextLine();
		udto.setArttitle(arttitle);
		
		System.out.print(" -> 내용 : ");
		String artcontent = sc.nextLine();
		udto.setArtcontent(artcontent);
		
		System.out.print(" -> 파일 첨부 : ");
		String artimgtitle = sc.nextLine();
		udto.setArtimgtitle(artimgtitle);
		
		udto.setArtdate(dateFormat.format(cal.getTime()));
		
			
		System.out.println("# 게시물 등록이 완료되었습니다! #");
		
		UPLController uplctrl = new UPLController();
		System.out.println("\n# Program On #\n");
		System.out.println(uplctrl.Uploaded(udto, new Model())); 
	}

}
