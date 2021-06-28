package SungKeun.JSTUDY.JSQ_WEEKLYQUIZ;

import java.util.ArrayList;

public class JSQService {
	JSQDAO jsqdao = new JSQDAO();
	public ArrayList<JSQDTO> JSQList(JSQDTO jcoq1) {
		
		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		정답을 맞춘 문제 번호 (오답이면 0), 문제, 유저 정답, 문제 정답, 문제 초기화 주기
		System.out.println("JSQDAO에 전송 할 퀴즈 문제 번호 데이터 1 : " + jcoq1.getQuestNum() + "\n");
		System.out.println("JSQDAO에 전송 할 퀴즈 문제 데이터 2 : " + jcoq1.getQuest() + "\n");
		System.out.println("JSQDAO에 전송 할 유저 정답 데이터 3 : " + jcoq1.getUsrAns() + "\n");
		System.out.println("JSQDAO에 전송 할 문제 정답 데이터 4 : " + jcoq1.getAnswer() + "\n");
		System.out.println("JSQDAO에 전송 할 퀴즈 주기 데이터 5 : " + jcoq1.getWeekly() + "\n");
//		System.out.println("JSQDAO에서 받을 복권 입력 데이터 크기 : " + jsqdao.JSQList(jcoq1).size() + "\n");
		return jsqdao.JSQList(jcoq1);
	}

}
