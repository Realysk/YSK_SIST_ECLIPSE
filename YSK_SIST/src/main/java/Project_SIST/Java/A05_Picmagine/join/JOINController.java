package Project_SIST.Java.A05_Picmagine.join;

import Project_SIST.Java.Model;

public class JOINController {
	
	JOINService serv = new JOINService();
	
	// 회원 가입 완료
	public String Joined (JOINDTO j, Model d) {
		d.addAttribute("회원가입", serv.Joined(j));
		return "joined.jsp";
	}
	
	// 로그인 완료
//	public String Logined (JOINDTO j, Model d) {
//		d.addAttribute("로그인 완료", serv.Logined(j));
//		return "logined.jsp";
//	}
	
	// ID 찾기
//	public String searchID (JOINDTO j, Model d) {
//		d.addAttribute("ID 찾기 완료", serv.schID(j));
//		return "searchID.jsp";
//	}
	
	// PW 찾기
//	public String searchPW (JOINDTO j, Model d) {
//		d.addAttribute("로그인 완료", serv.schPW(j));
//		return "searchPW.jsp";
//	}
	
}
