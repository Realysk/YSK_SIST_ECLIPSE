package Project_SIST.Java.A05_Picmagine.upload;

import java.util.ArrayList;

public class UPLService {
	
	UPLDAO dao = new UPLDAO();

	// 게시물 작성
	public String Uploaded(UPLDTO u) {
		dao.Uploaded(u);
		return "===== Picmagine : 게시물 등록 완료 =====";
	}
	
	// 게시물 조회 리스트
	public String uploadList(String title) {
		ArrayList<UPLDTO> ulist = dao.uploadList();
		for(UPLDTO u:ulist) {
			System.out.print(u.getTitle() + "\t");
			System.out.print(u.getContents() + "\t");
			System.out.print(u.getPic_file() + "\t");
			System.out.print(u.getTag() + "\t");
			System.out.print(u.getStoryname() + "\t");
			System.out.print(u.getStorycontents() + "\t");
			System.out.print(u.getStroytitle() + "\n");
		}
		
		return "게시물 출력 완료";
	}

}
