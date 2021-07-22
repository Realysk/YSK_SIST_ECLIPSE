package Project_SIST.Java.A04_JStudy.Community;

import java.util.ArrayList;

public class JSCDAO {
	
	// 자유 게시판
	public ArrayList<JSCDTO> JSCFList(JSCDTO jcof1) {
		ArrayList<JSCDTO> jscflist = new ArrayList<JSCDTO>();
		
//		jscflist.add(new JSCDTO(jcof1.getWriteNum(), jcof1.getHeadLine(), jcof1.getWriter(), jcof1.getWriteDate(), jcof1.getWrite(), jcof1.getComment(), jcof1.getGoodJob()));
		
	    // 전체 게시물 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에 넘겨 줄 자유 게시판 게시물 정보 데이터 #\n");
		System.out.println("자유 게시판 게시물 번호 : " + jcof1.getWriteNum() + "\n");
		System.out.println("자유 게시판 게시물 제목 : " + jcof1.getHeadLine() + "\n");
		System.out.println("자유 게시판 게시물 작성자 : " + jcof1.getWriter() + "\n");
		System.out.println("자유 게시판 게시물 작성일 : " + jcof1.getWriteDate() + "\n");
		System.out.println("자유 게시판 게시물 작성 내용 : " + jcof1.getWrite() + "\n");
		System.out.println("자유 게시판 게시물 댓글 : " + jcof1.getComment() + "\n");
		System.out.println("자유 게시판 게시물 좋아요 : " + jcof1.getGoodJob() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에서 온 자유 게시판 게시물 정보 데이터 리스트 #\n");
		jscflist.add(new JSCDTO(jcof1.getWriteNum(), jcof1.getHeadLine(), jcof1.getWriter(), jcof1.getWriteDate(), jcof1.getWrite(), jcof1.getComment(), jcof1.getGoodJob()));
//		jscflist.add(new JSCDTO(6, "반갑습니다!", "홍시", "2021/06/26 22:08:22" ,"홈페이지 제작 처음입니다!", "반갑습니다~", " "));
//		jscflist.add(new JSCDTO(5, "너무 좋은 사이트네요ㅎㅎ", "himan","2021/06/26 19:12:36", "저는 현직 개발자입니다!", "잘 부탁드려요!", " "));
//		jscflist.add(new JSCDTO(4, "ㅎㅇ", "cool","2021/06/26 19:08:17", "ㅎㅇㅎㅇ", "ㅎㅇ", " "));
//		jscflist.add(new JSCDTO(3, "여기는 뭐하는 곳이죠??", "byeman","2021/06/25 23:46:11", "처음이라 잘 부탁드려요..ㅎㅎㅎ", "저도 처음이에요ㅋㅋ", "★"));
//		jscflist.add(new JSCDTO(2, "오 드디어 오픈이네요!", "강남살아요","2021/06/25 20:18:02", "배우러 왔습니다!", "저두요!", "★"));
//		jscflist.add(new JSCDTO(1, "안녕하세요!", "홍길동","2021/06/25 17:11:53", "잘 부탁드려요~", "안녕하세요~", "★"));
		System.out.println("===============================================\n");
		return jscflist;
	}
	
	// 스터디
	public ArrayList<JSCDTO> JSCSList(JSCDTO jcos1) {
		ArrayList<JSCDTO> jscslist = new ArrayList<JSCDTO>();		
		
//		jscslist.add(new JSCDTO(jcos1.getWriteNum(), jcos1.getHeadLine(), jcos1.getWriter(), jcos1.getWriteDate(), jcos1.getWrite(), jcos1.getComment(), jcos1.getGoodJob()));
		
	    // 전체 게시물 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에 넘겨 줄 스터디 게시물 정보 데이터 #\n");
		System.out.println("스터디 게시물 번호 : " + jcos1.getWriteNum() + "\n");
		System.out.println("스터디 게시물 제목 : " + jcos1.getHeadLine() + "\n");
		System.out.println("스터디 게시물 작성자 : " + jcos1.getWriter() + "\n");
		System.out.println("스터디 게시물 작성일 : " + jcos1.getWriteDate() + "\n");
		System.out.println("스터디 게시물 작성 내용 : " + jcos1.getWrite() + "\n");
		System.out.println("스터디 게시물 댓글 : " + jcos1.getComment() + "\n");
		System.out.println("스터디 게시물 좋아요 : " + jcos1.getGoodJob() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에서 온 스터디 게시물 정보 데이터 리스트 #\n");
		jscslist.add(new JSCDTO(jcos1.getWriteNum(), jcos1.getHeadLine(), jcos1.getWriter(), jcos1.getWriteDate(), jcos1.getWrite(), jcos1.getComment(), jcos1.getGoodJob()));
//		jscslist.add(new JSCDTO(3, "HTML 대망의 첫 강의", "hihihi","2021/06/26 14:46:12", "파고들면 쉽습니다!", "감사합니다.", "★"));
//		jscslist.add(new JSCDTO(2, "오라클 설정방법", "DB를누벼라","2021/06/26 09:22:12", "깔끔하게 정리해봤습니다.", " ", "★★"));
//		jscslist.add(new JSCDTO(1, "JAVA 첫 시작! 1강입니다.", "자바를잡으러","2021/06/25 20:12:55", "첫 강의영상입니다! 도움이 되셨으면 좋겠네요~", " ", "★"));
		System.out.println("===============================================\n");
		
		return jscslist;
	}
	
	// 질문 답변
	public ArrayList<JSCDTO> JSCQList(JSCDTO jcoq1) {
		ArrayList<JSCDTO> jscqlist = new ArrayList<JSCDTO>();
				
//		jscqlist.add(new JSCDTO(jcoq1.getWriteNum(), jcoq1.getHeadLine(), jcoq1.getWriter(), jcoq1.getWriteDate(), jcoq1.getWrite(), jcoq1.getComment(), jcoq1.getGoodJob()));
		
	    // 전체 게시물 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에 넘겨 줄 질문 답변 게시물 정보 데이터 #\n");
		System.out.println("질문 답변 게시판 게시물 번호 : " + jcoq1.getWriteNum() + "\n");
		System.out.println("질문 답변 게시판 게시물 제목 : " + jcoq1.getHeadLine() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성자 : " + jcoq1.getWriter() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성일 : " + jcoq1.getWriteDate() + "\n");
		System.out.println("질문 답변 게시판 게시물 작성 내용 : " + jcoq1.getWrite() + "\n");
		System.out.println("질문 답변 게시판 게시물 댓글 : " + jcoq1.getComment() + "\n");
		System.out.println("질문 답변 게시판 게시물 좋아요 : " + jcoq1.getGoodJob() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# [DAO] : DB 서버에서 온 질문 답변 게시물 정보 데이터 리스트 #\n");
		// 게시물 번호, 제목, 작성자, 작성일, 작성 내용
		jscqlist.add(new JSCDTO(jcoq1.getWriteNum(), jcoq1.getHeadLine(), jcoq1.getWriter(), jcoq1.getWriteDate(), jcoq1.getWrite(), jcoq1.getComment(), jcoq1.getGoodJob()));
//		jscqlist.add(new JSCDTO(3, "DB 질문이요", "byeman","2021/06/26 23:55:55", "이클립스랑 오라클 연결 어떻게 해요?", "구글링하세요", " "));
//		jscqlist.add(new JSCDTO(2, "자바 관련 질문입니다.", "어려운취준생","2021/06/25 18:08:45", "C언어랑 연관있나요?", "네 있어요!", "★★★"));
//		jscqlist.add(new JSCDTO(1, "뭐하는 사이트에요?", "여긴어디지","2021/06/25 12:16:25", "사이트 주제를 모르겠어요..", "학습 사이트요", "★★"));
		System.out.println("===============================================\n");
		
		return jscqlist;
	}
}
