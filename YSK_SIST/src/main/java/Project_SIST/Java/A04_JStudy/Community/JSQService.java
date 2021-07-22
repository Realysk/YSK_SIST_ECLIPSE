package Project_SIST.Java.A04_JStudy.Community;

import java.util.ArrayList;

public class JSQService {
	
	JSQDAO jsqdao = new JSQDAO();
	
	public ArrayList<JSQDTO> JSQList(JSQDTO jcq1) {
		
		System.out.println("===============================================\n");
		System.out.println("# [Service] : DAO로 넘길 데이터 확인 #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
		System.out.println("JSQDAO에 전송 할 퀴즈 문제 데이터 1 : " + jcq1.getQuest() + "\n");
		System.out.println("JSQDAO에 전송 할 퀴즈 정답 데이터 2 : " + jcq1.getAnswer() + "\n");
		System.out.println("JSQDAO에서 받을 퀴즈 정보 입력 데이터 크기 : " + jsqdao.JSQList(jcq1).size() + "\n");
		return jsqdao.JSQList(jcq1);
	}
}
