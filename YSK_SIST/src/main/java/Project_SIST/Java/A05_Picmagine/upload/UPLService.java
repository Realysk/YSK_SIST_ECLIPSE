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
	public String uploadList(String artno) {
		ArrayList<UPLDTO> ulist = dao.uploadList();
		for(UPLDTO u:ulist) {
			System.out.print(u.getArtno() + "\t");
			System.out.print(u.getArtcategory() + "\t");
			System.out.print(u.getArtimgtitle() + "\t");
			System.out.print(u.getArttitle() + "\t");
			System.out.print(u.getArtcontent() + "\t");
			System.out.print(u.getTag() + "\t");
			System.out.print(u.getArtdate() + "\t");
			System.out.print(u.getArtpicauth() + "\n");
		}
		
		return "게시물 출력 완료";
	}

}
