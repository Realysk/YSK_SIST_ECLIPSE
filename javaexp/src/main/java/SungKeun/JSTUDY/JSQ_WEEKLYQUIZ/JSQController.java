package SungKeun.JSTUDY.JSQ_WEEKLYQUIZ;

import SungKeun.JSTUDY.Model;

public class JSQController {
	
	private JSQService jsqservice = new JSQService();
	
	public String JSQList2(JSQDTO jcq1, Model d) {
				
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 복권 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		정답을 맞춘 문제 번호 (오답이면 0), 문제, 유저 정답, 문제 정답, 문제 초기화 주기
		System.out.println("퀴즈 문제 번호 : " + jcq1.getQuestNum());
		System.out.println("퀴즈 문제 : " + jcq1.getQuest());
		System.out.println("유저가 입력 한 정답 : " + jcq1.getUsrAns());
		System.out.println("퀴즈 문제 정답 : " + jcq1.getAnswer());
		System.out.println("퀴즈 문제 초기화 일시 : " + jcq1.getWeekly());
		
		d.addAttribute("jsqlist", jsqservice.JSQList(jcq1));
		return "JSTUDY WEEKLY QUIZ 정보.jsp";
	}
}
