package SungKeun.JSTUDY.JSC_COMMUNITY;

import SungKeun.JSTUDY.Model;

public class JSCController {

	private JSCService jscservice = new JSCService();
	
//	// 기존
//	public String JSCList2(JSCDTO jco1, Model d) {
//						
//		System.out.println("===============================================\n");
//		System.out.println("# Controller에서 받은 게시물 입력 데이터 #\n");
////		Main에서 입력받은 정보를 Controller로 불러온다.
////		게시물 번호, 제목, 작성자, 작성일, 작성 내용
//		System.out.println("게시물 번호 : " + jco1.getWriteNum() + "\n");
//		System.out.println("게시물 제목 : " + jco1.getHeadLine() + "\n");
//		System.out.println("게시물 작성자 : " + jco1.getWriter() + "\n");
//		System.out.println("게시물 작성일 : " + jco1.getWriteDate() + "\n");
//		System.out.println("게시물 작성 내용 : " + jco1.getWrite() + "\n");
//		
//		d.addAttribute("jsclist", jscservice.JSCList(jco1));
//		return "JSTUDY 커뮤니티 게시물 정보.jsp";
//	}
	
	// 자유 게시판
	public String JSCFList2(JSCDTO jcf1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 자유 게시판 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("자유 게시판 게시물 번호 : " + jcf1.getWriteNum() + "\n");
		System.out.println("자유 게시판 게시물 제목 : " + jcf1.getHeadLine() + "\n");
		System.out.println("자유 게시판 게시물 작성자 : " + jcf1.getWriter() + "\n");
		System.out.println("자유 게시판 게시물 작성일 : " + jcf1.getWriteDate() + "\n");
		System.out.println("자유 게시판 게시물 작성 내용 : " + jcf1.getWrite() + "\n");
		
		d.addAttribute("jscflist", jscservice.JSCFList(jcf1));
		return "JSTUDY 커뮤니티 자유 게시판 게시물 정보.jsp";
	}
	
	// 스터디
	public String JSCSList2(JSCDTO jcs1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 스터디 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("스터디 게시물 번호 : " + jcs1.getWriteNum() + "\n");
		System.out.println("스터디 게시물 제목 : " + jcs1.getHeadLine() + "\n");
		System.out.println("스터디 게시물 작성자 : " + jcs1.getWriter() + "\n");
		System.out.println("스터디 게시물 작성일 : " + jcs1.getWriteDate() + "\n");
		System.out.println("스터디 게시물 작성 내용 : " + jcs1.getWrite() + "\n");
		
		d.addAttribute("jscslist", jscservice.JSCSList(jcs1));
		return "JSTUDY 커뮤니티 스터디 게시물 정보.jsp";
	}
	
	// 질문 답변
	public String JSCQList2(JSCDTO jcsq1, Model d) {
						
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 질문 답변 게시물 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
//		게시물 번호, 제목, 작성자, 작성일, 작성 내용
		System.out.println("질문 답변 게시물 번호 : " + jcsq1.getWriteNum() + "\n");
		System.out.println("질문 답변 게시물 제목 : " + jcsq1.getHeadLine() + "\n");
		System.out.println("질문 답변 게시물 작성자 : " + jcsq1.getWriter() + "\n");
		System.out.println("질문 답변 게시물 작성일 : " + jcsq1.getWriteDate() + "\n");
		System.out.println("질문 답변 게시물 작성 내용 : " + jcsq1.getWrite() + "\n");
		
		d.addAttribute("jscqlist", jscservice.JSCQList(jcsq1));
		return "JSTUDY 커뮤니티 질문 답변 게시물 정보.jsp";
	}

}
