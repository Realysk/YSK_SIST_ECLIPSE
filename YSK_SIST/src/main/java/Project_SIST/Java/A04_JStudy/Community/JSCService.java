package Project_SIST.Java.A04_JStudy.Community;

import java.util.ArrayList;

public class JSCService {

	// 자유 게시판
	JSCDAO jscfdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCFList(JSCDTO jcof1) {
		
		System.out.println("===============================================\n");
		System.out.println("# [Service] : DAO로 넘길 데이터 확인 #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 번호 데이터 1 : " + jcof1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 제목 데이터 2 : " + jcof1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성자 데이터 3 : " + jcof1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성일 데이터 4 : " + jcof1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 작성 내용 데이터 5 : " + jcof1.getWrite() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 댓글 데이터 6 : " + jcof1.getComment() + "\n");
		System.out.println("JSCDAO에 전송 할 자유 게시판 게시물 좋아요 데이터 7 : " + jcof1.getGoodJob() + "\n");
		System.out.println("JSCDAO에서 받을 자유 게시판 게시물 입력 데이터 크기 : " + jscfdao.JSCFList(jcof1).size() + "\n");
		return jscfdao.JSCFList(jcof1);
	}
	
	// 스터디
	JSCDAO jscsdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCSList(JSCDTO jcos1) {
		
		System.out.println("===============================================\n");
		System.out.println("# [Service] : DAO로 넘길 데이터 확인 #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("JSCDAO에 전송 할 스터디 게시물 번호 데이터 1 : " + jcos1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 제목 데이터 2 : " + jcos1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성자 데이터 3 : " + jcos1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성일 데이터 4 : " + jcos1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 작성 내용 데이터 5 : " + jcos1.getWrite() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 댓글 데이터 6 : " + jcos1.getComment() + "\n");
		System.out.println("JSCDAO에 전송 할 스터디 게시물 좋아요 데이터 7 : " + jcos1.getGoodJob() + "\n");
		System.out.println("JSCDAO에서 받을 스터디 입력 데이터 크기 : " + jscsdao.JSCSList(jcos1).size() + "\n");
		return jscsdao.JSCSList(jcos1);
	}

	// 질문 답변
	JSCDAO jscqdao = new JSCDAO();
	public ArrayList<JSCDTO> JSCQList(JSCDTO jcoq1) {
		
		System.out.println("===============================================\n");
		System.out.println("# [Service] : DAO로 넘길 데이터 확인 #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 번호 데이터 1 : " + jcoq1.getWriteNum() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 제목 데이터 2 : " + jcoq1.getHeadLine() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 작성자 데이터 3 : " + jcoq1.getWriter() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 작성일 데이터 4 : " + jcoq1.getWriteDate() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 작성 내용 데이터 5 : " + jcoq1.getWrite() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 댓글 데이터 6 : " + jcoq1.getComment() + "\n");
		System.out.println("JSCDAO에 전송 할 질문 답변 게시판 게시물 좋아요 데이터 7 : " + jcoq1.getGoodJob() + "\n");
		System.out.println("JSCDAO에서 받을 질문 답변 입력 데이터 크기 : " + jscqdao.JSCQList(jcoq1).size() + "\n");
		return jscqdao.JSCQList(jcoq1);
	}

}
