package Project_SIST.Java.A05_Picmagine.upload;

import java.util.Scanner;

import Project_SIST.Java.Model;


public class UPLMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UPLMain uin = new UPLMain();
//		uin.main(args);
		
		Scanner sc = new Scanner(System.in);
		UPLDTO upldto = new UPLDTO();
		
		System.out.println("# Picmagine 게시물 업로드 #\n");
		
		System.out.print(" -> 제목 : ");
		String title = sc.nextLine();
		upldto.setTitle(title);
		
		System.out.print(" -> 내용 : ");
		String contents = sc.nextLine();
		upldto.setContents(contents);
		
		System.out.print(" -> 파일 첨부 : ");
		String pic_file = sc.nextLine();
		upldto.setPic_file(pic_file);
		
		System.out.print(" -> 태그 : ");
		String tag = sc.nextLine();
		upldto.setTag(tag);
		
		System.out.print("# 스토리를 추가 하시겠습니까? (Y/N) : ");
		String story = sc.nextLine();
		
		if(story.equals("Y")) {
			
			System.out.println("# Picmagine 게시물 업로드 : 스토리 추가 #\n");
			
			System.out.print(" -> 스토리 제목 : ");
			String storyName = sc.nextLine();
			upldto.setStoryname(storyName);
			
			System.out.print(" -> 스토리 설명 : ");
			String storyContents = sc.nextLine();
			upldto.setStorycontents(storyContents);
			
			System.out.print(" -> 스토리 주제 : ");
			String storyTitle = sc.nextLine();
			upldto.setStroytitle(storyTitle);
			
			System.out.print("# 게시물 등록을 완료하시겠습니까? (Y/N) : ");
			String upChk = sc.nextLine();
			
			if(upChk.equals("Y")) {
				
				System.out.println("# 게시물 등록이 완료되었습니다! #");
				
				UPLController uplctrl = new UPLController();
				System.out.println("\n# Program On #\n");
				System.out.println(uplctrl.Uploaded(upldto, new Model()));
				
			} else {
				
				System.out.println("\n 등록이 취소되었습니다. 메인으로 이동합니다.");
				uin.main(args);
				
			}
			
		} else {
			
			System.out.println("# 게시물 등록이 완료되었습니다! #");
			
			UPLController uplctrl = new UPLController();
			System.out.println("\n# Program On #\n");
			System.out.println(uplctrl.Uploaded(upldto, new Model())); 
		}

	}

}
