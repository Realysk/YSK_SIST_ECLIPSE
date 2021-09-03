package Project_SIST.Java.A04_JStudy.Community;

import Project_SIST.Java.A04_JStudy.Model;

public class JSCController {

	private JSCService jscservice = new JSCService();
	
	// 자유 게시판
	public String JSCFList2(JSCDTO jcf1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# [Controller] : Main에서 받은 자유 게시판 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("자유 게시판 게시물 번호 : " + jcf1.getWriteNum() + "\n");
		System.out.println("자유 게시판 게시물 제목 : " + jcf1.getHeadLine() + "\n");
		System.out.println("자유 게시판 게시물 작성자 : " + jcf1.getWriter() + "\n");
		System.out.println("자유 게시판 게시물 작성일 : " + jcf1.getWriteDate() + "\n");
		System.out.println("자유 게시판 게시물 작성 내용 : " + jcf1.getWrite() + "\n");
		System.out.println("자유 게시판 게시물 댓글 : " + jcf1.getComment() + "\n");
		System.out.println("자유 게시판 게시물 좋아요 : " + jcf1.getGoodJob() + "\n");
		
		d.addAttribute("# JSTUDY 커뮤니티 - 자유 게시판 게시물 정보 호출 #", jscservice.JSCFList(jcf1));
		return "JSTUDY 커뮤니티 자유 게시판 게시물 정보.jsp";
	}
	
	// 스터디
	public String JSCSList2(JSCDTO jcs1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# [Controller] : Main에서 받은 스터디 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("스터디 게시물 번호 : " + jcs1.getWriteNum() + "\n");
		System.out.println("스터디 게시물 제목 : " + jcs1.getHeadLine() + "\n");
		System.out.println("스터디 게시물 작성자 : " + jcs1.getWriter() + "\n");
		System.out.println("스터디 게시물 작성일 : " + jcs1.getWriteDate() + "\n");
		System.out.println("스터디 게시물 작성 내용 : " + jcs1.getWrite() + "\n");
		System.out.println("스터디 게시물 댓글 : " + jcs1.getComment() + "\n");
		System.out.println("스터디 게시물 좋아요 : " + jcs1.getGoodJob() + "\n");
		
		d.addAttribute("# JSTUDY 커뮤니티 - 스터디 게시물 정보 호출 #", jscservice.JSCSList(jcs1));
		return "JSTUDY 커뮤니티 스터디 게시물 정보.jsp";
	}
	
	// 질문 답변
	public String JSCQList2(JSCDTO jcsq1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# [Controller] : Main에서 받은 질문 답변 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("질문 답변 게시판 게시물 번호 : " + jcsq1.getWriteNum() + "\n");
		System.out.println("질문 답변 게시판 게시물 제목 : " + jcsq1.getHeadLine() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성자 : " + jcsq1.getWriter() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성일 : " + jcsq1.getWriteDate() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성 내용 : " + jcsq1.getWrite() + "\n");
		System.out.println("질문 답변 게시판 게시물 댓글 : " + jcsq1.getComment() + "\n");
		System.out.println("질문 답변 게시판 게시물 좋아요 : " + jcsq1.getGoodJob() + "\n");
		
		d.addAttribute("# JSTUDY 커뮤니티 - 질문 답변 게시판 게시물 정보 호출 #", jscservice.JSCQList(jcsq1));
		return "JSTUDY 커뮤니티 질문 답변 게시물 정보.jsp";
	}

}
