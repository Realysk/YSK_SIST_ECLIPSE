package SungKeun.JSTUDY.JSC_COMMUNITY;

import java.util.ArrayList;

public class JSCService {
	
//	// 기존
//	JSCDAO jscdao = new JSCDAO();
//	public ArrayList<JSCDTO> JSCList(JSCDTO jcoo1) {
//		
//		System.out.println("===============================================\n");
//		System.out.println("# Service #\n");
////		DAO로 데이터를 넘기기 위한 확인 과정
////		게시물 번호, 제목, 작성자, 작성일, 작성 내용
//		System.out.println("JSCDAO에 전송 할 게시물 번호 데이터 1 : " + jcoo1.getWriteNum() + "\n");
//		System.out.println("JSCDAO에 전송 할 게시물 제목 데이터 2 : " + jcoo1.getHeadLine() + "\n");
//		System.out.println("JSCDAO에 전송 할 게시물 작성자 데이터 3 : " + jcoo1.getWriter() + "\n");
//		System.out.println("JSCDAO에 전송 할 게시물 작성일 데이터 4 : " + jcoo1.getWriteDate() + "\n");
//		System.out.println("JSCDAO에 전송 할 게시물 작성 내용 데이터 5 : " + jcoo1.getWrite() + "\n");
////		System.out.println("JSCDAO에서 받을 게시물 입력 데이터 크기 : " + jscdao.JSCFList(jcof1).size() + "\n");
//		return jscdao.JSCList(jcoo1);
//	}

	// 자유 게시판
	JSCDAO jscfdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCFList(JSCDTO jcof1) {
		
		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 번호 데이터 1 : " + jcof1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 제목 데이터 2 : " + jcof1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성자 데이터 3 : " + jcof1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성일 데이터 4 : " + jcof1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성 내용 데이터 5 : " + jcof1.getWrite() + "\n");
		System.out.println("JSCDAO에서 받을 자유 게시판 게시물 입력 데이터 크기 : " + jscfdao.JSCFList(jcof1).size() + "\n");
		return jscfdao.JSCFList(jcof1);
	}
	
	// 스터디
	JSCDAO jscsdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCSList(JSCDTO jcos1) {
		
		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("JSCDAO에 전송 할 스터디 게시물 번호 데이터 1 : " + jcos1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 제목 데이터 2 : " + jcos1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성자 데이터 3 : " + jcos1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성일 데이터 4 : " + jcos1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성 내용 데이터 5 : " + jcos1.getWrite() + "\n");
		System.out.println("JSCDAO에서 받을 스터디 입력 데이터 크기 : " + jscsdao.JSCSList(jcos1).size() + "\n");
		return jscsdao.JSCSList(jcos1);
	}

	// 질문 답변
	JSCDAO jscqdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCQList(JSCDTO jcoq1) {
		
		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("JSCDAO에 전송 할 질문 답변 게시물 번호 데이터 1 : " + jcoq1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시물 제목 데이터 2 : " + jcoq1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시물 작성자 데이터 3 : " + jcoq1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시물 작성일 데이터 4 : " + jcoq1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시물 작성 내용 데이터 5 : " + jcoq1.getWrite() + "\n");
		System.out.println("JSCDAO에서 받을 질문 답변 입력 데이터 크기 : " + jscqdao.JSCQList(jcoq1).size() + "\n");
		return jscqdao.JSCQList(jcoq1);
	}

}
