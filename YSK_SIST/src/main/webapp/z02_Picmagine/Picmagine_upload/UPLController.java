package Project_SIST.Java.A05_Picmagine.upload;

import Project_SIST.Java.Model;

public class UPLController {
	
	UPLService serv = new UPLService();
	
	// 게시물 작성
	public String Uploaded (UPLDTO u, Model d) {
		d.addAttribute("게시물 업로드", serv.Uploaded(u));
		return "uploaded.jsp";
	}

}