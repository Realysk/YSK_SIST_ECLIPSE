package Project_SIST.Java.A05_Picmagine.join;

import Project_SIST.Java.Model;

public class JOINController {
	
	JOINService serv = new JOINService();
	
	// 회원가입 완료
	public String Joined (JOINDTO j, Model d) {
		d.addAttribute("회원가입 완료", serv.Joined(j));
		return "joined.jsp";
	}
}
