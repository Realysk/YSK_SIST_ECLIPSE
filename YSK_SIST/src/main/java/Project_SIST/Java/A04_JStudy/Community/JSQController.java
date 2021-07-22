package Project_SIST.Java.A04_JStudy.Community;

import Project_SIST.Java.A04_JStudy.Model;

public class JSQController {
	
	private JSQService jsqservice = new JSQService();
	
	public String JSQList2(JSQDTO jcq1, Model d) {
				
		System.out.println("===============================================\n");
		System.out.println("# [Controller] : Main에서 받은 퀴즈 문제 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("퀴즈 문제 : " + jcq1.getQuest());
		System.out.println("퀴즈 정답 : " + jcq1.getAnswer());
		
		d.addAttribute("JSTUDY 커뮤니티 - QUIZ 문제 호출", jsqservice.JSQList(jcq1));
		
		return "JSTUDY QUIZ 정보.jsp";
	}
}
