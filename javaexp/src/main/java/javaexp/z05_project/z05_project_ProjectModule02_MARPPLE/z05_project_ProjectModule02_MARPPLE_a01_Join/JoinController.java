package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a01_Join;

import javaexp.z05_project.z05_project_ProjectModule00_sample.Model;

public class JoinController {
	
	private JoinService service = new JoinService();
	
	public String joinList2(JoinDTO j, Model d) {
				
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 회원 정보 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("회원 번호 : " + j.getNmkey());
		System.out.println("ID(EMAIL) : " + j.getID());
		System.out.println("PW : " + j.getPW());
		System.out.println("이름 : " + j.getName() + "\n");

		// view단에 넘겨 줄 데이터 key, object
		d.addAttribute("jlist", service.joinList(j));
		// 화면단에 대한 호출
		return "회원가입_정보.jsp";
	}

}
