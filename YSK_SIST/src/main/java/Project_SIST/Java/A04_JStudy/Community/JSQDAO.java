package Project_SIST.Java.A04_JStudy.Community;

import java.util.ArrayList;

public class JSQDAO {
	public ArrayList<JSQDTO> JSQList(JSQDTO jcq1) {
		
		ArrayList<JSQDTO> jsqlist  = new ArrayList<JSQDTO>();
		jsqlist.add(new JSQDTO(jcq1.getQuest(),jcq1.getAnswer()));
		
	    // 전체 퀴즈 정보 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에 넘겨 줄 퀴즈 정보 데이터 #\n");
		System.out.println("퀴즈 문제 : " + jcq1.getQuest() + "\n");
		System.out.println("퀴즈 정답 : " + jcq1.getAnswer() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에서 온 퀴즈 입력 정보 데이터 리스트 #\n");
//		문제 번호, 문제, 문제 정답
		jsqlist.add(new JSQDTO("이것은 컴퓨터 프로그램입니다.", "이클립스"));
		jsqlist.add(new JSQDTO("이것은 획기적인 언어입니다.", "JAVA"));
		jsqlist.add(new JSQDTO("이것은 이클립스와 비슷한 프로그램입니다.", "VSCode"));
		System.out.println("===============================================\n");
		
		return jsqlist;
	}
}