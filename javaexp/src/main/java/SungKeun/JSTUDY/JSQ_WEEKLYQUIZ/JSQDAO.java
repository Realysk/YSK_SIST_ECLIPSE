package SungKeun.JSTUDY.JSQ_WEEKLYQUIZ;

import java.util.ArrayList;

public class JSQDAO {
	public ArrayList<JSQDTO> JSQList(JSQDTO jcoq1) {
		
		ArrayList<JSQDTO> jsqlist  = new ArrayList<JSQDTO>();
		jsqlist.add(new JSQDTO(jcoq1.getQuestNum(), jcoq1.getQuest(), jcoq1.getUsrAns(), jcoq1.getAnswer(), jcoq1.getWeekly()));
		
	    // 전체 복권 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에 넘겨 줄 퀴즈 정보 데이터 #\n");
		System.out.println("퀴즈 문제 번호 : " + jcoq1.getQuestNum() + "\n");
		System.out.println("퀴즈 문제 : " + jcoq1.getQuest() + "\n");
		System.out.println("유저가 입력 한 정답 : " + jcoq1.getUsrAns() + "\n");
		System.out.println("퀴즈 문제 정답 : " + jcoq1.getAnswer() + "\n");
		System.out.println("퀴즈 문제 초기화 일시 : " + jcoq1.getWeekly() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에서 온 퀴즈 입력 정보 데이터 리스트 #\n");
//		정답을 맞춘 문제 번호 (오답이면 0), 문제, 유저 정답, 문제 정답, 문제 초기화 주기
		jsqlist.add(new JSQDTO(0, "이것은 컴퓨터 프로그램입니다.", "윈도우클리너", "이클립스", 20210709));
		jsqlist.add(new JSQDTO(3, "이것은 획기적인 언어입니다.", "JAVA", "JAVA(자바)", 20210702));
		jsqlist.add(new JSQDTO(8, "이것은 이클립스와 비슷한 프로그램입니다.", "C++", "비주얼스튜디오코드(VSC)", 20210625));
		System.out.println("===============================================\n");
		
		return jsqlist;
	}
}
