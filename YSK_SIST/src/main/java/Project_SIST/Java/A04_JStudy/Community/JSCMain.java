package Project_SIST.Java.A04_JStudy.Community;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

import Project_SIST.Java.A04_JStudy.Model;
import Project_SIST.Java.A04_JStudy.Community.JSQController;
import Project_SIST.Java.A04_JStudy.Community.JSQDTO;

public class JSCMain {
	
	static JSCDTO jscf = new JSCDTO(); // 자유 게시판 게시물 정보에 대한 객체를 전역 변수로 선언
	static JSCDTO jscs = new JSCDTO(); // 스터디 게시물 정보에 대한 객체를 전역 변수로 선언
	static JSCDTO jscq = new JSCDTO(); // 질문 답변 게시물 정보에 대한 객체를 전역 변수로 선언
	
	static JSQDTO jq = new JSQDTO(); // 퀴즈 문제에 대한 객체를 전역 변수로 선언
	static JSQDTO ja = new JSQDTO(); // 퀴즈 정답에 대한 객체를 전역 변수로 선언
	
	static ArrayList<JSCDTO> jscflist = new ArrayList<JSCDTO>();
	static ArrayList<JSCDTO> jscslist = new ArrayList<JSCDTO>();
	static ArrayList<JSCDTO> jscqlist = new ArrayList<JSCDTO>();
	
	public static void main(String[] args) {
		
		JSCMain cin = new JSCMain();
//		cin.main(args); // 처음으로 이동
		Scanner sc = new Scanner(System.in);
		
		String writer; // 작성자
		String headLine; // 게시물 제목
		String write; // 게시물 작성 내용
		Calendar cal = Calendar.getInstance();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); // 작성일
//		System.out.println("프로그램 구동 시간 : " + dateFormat.format(cal.getTime()));
		String comtChk; // 댓글 등록 여부
		String comment; // 댓글
		String goodChk; // 게시물 좋아요 여부
		String goodJob = "★"; // 게시물 좋아요
		
		String quest; // 문제
		String usrAns; // 유저 정답
		String answer; // 정답
		
		String admin; // 관리자 ID
		String adminPw; // 관리자 PW
		
		// JSTUDY 커뮤니티 - 메인 메뉴
		System.out.println("\n===============================================");
        System.out.println("\n## JSTUDY 커뮤니티 ## \n");
        String mainMenu; // 커뮤니티 - 메인 메뉴 선택
        System.out.println("[1] 자유 게시판 [2] 스터디 [3] 질문 답변 [4] QUIZ [0] 커뮤니티 \n");
        System.out.print(" -> [메인] 메뉴를 선택하세요 : ");
        mainMenu = sc.nextLine();
        
        if(mainMenu.equals("1")) {
        	while(true) {
                // JSTUDY 커뮤니티 - 자유 게시판 메뉴
            	System.out.println("\n===============================================");
                System.out.println("\n## JSTUDY 커뮤니티 - 자유 게시판 ## \n");
                String freeMenu; // 커뮤니티 - 자유 게시판 메뉴 선택
                System.out.println("[1] 게시물 확인 [2] 게시물 글쓰기 [0] 커뮤니티 \n");
                System.out.print(" -> [자유 게시판] 메뉴를 선택하세요 : ");
                freeMenu = sc.nextLine();
                
                if(freeMenu.equals("1")) {
                    // JSTUDY 커뮤니티 - 자유 게시판 메뉴 -> 게시물 확인
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [자유 게시판] -> 게시물 확인 ## \n");
            		System.out.println("전체 게시물 정보 수량 : " + jscflist.size()); // 전체 게시물 정보 수
            		
                } else if(freeMenu.equals("2")) {
            		// JSTUDY 커뮤니티 - 자유 게시판 메뉴 -> 게시물 글쓰기
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [자유 게시판] -> 게시물 글쓰기 ## \n");
            		int freewriteNum = 1;
            		jscf.setWriteNum(freewriteNum); // 자유 게시판 게시물 번호 저장
            		System.out.print(" 작성자 : ");
            		writer = sc.nextLine();
            		jscf.setWriter(writer); // 자유 게시판 게시물 작성자 저장
            		System.out.print(" 제목 : ");
            		headLine = sc.nextLine();
            		jscf.setHeadLine(headLine); // 자유 게시판 게시물 제목 저장
            		System.out.print(" 내용 : ");
            		write = sc.nextLine();
            		jscf.setWrite(write); // 자유 게시판 게시물 내용 저장
            		jscf.setWriteDate(dateFormat.format(cal.getTime())); // 자유 게시판 게시물 작성일 저장
            		System.out.println(" * 해당 게시물이 등록되었습니다! * \n");
            		System.out.println("# JSTUDY 커뮤니티 [자유 게시판] -> 게시물 등록 완료!");
            		 // 자유 게시판 게시물 번호
            		System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
            		
            		// 댓글 등록
            		System.out.print("\n -> 댓글을 등록 하시겠습니까? (Y/N) : ");
            		comtChk = sc.nextLine();
            		if(comtChk.equals("Y")) {
            			// 댓글 입력
            			System.out.print(" -> 댓글 : ");
                		comment = sc.nextLine();
                		System.out.println(" # 댓글이 등록 되었습니다!\n");
                		System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
                		System.out.println("\n | 댓글 : " + comment + " | \n");
                		jscf.setComment(comment); // 자유 게시판 게시물 댓글 저장
                		
                		// 댓글을 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscf.setGoodJob(goodJob); // 자유 게시판 게시물 좋아요 저장
                    		// 자유 게시판
                    		JSCDTO jcof1 = new JSCDTO(jscf.getWriteNum(), jscf.getHeadLine(), jscf.getWriter(), jscf.getWriteDate(), jscf.getWrite(), jscf.getComment(), jscf.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscfctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscfctrl.JSCFList2(jcof1, new Model()));                   		
                		} else {
                			// 댓글을 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		jscf.setComment(comment); // 자유 게시판 게시물 댓글 저장
                    		// 자유 게시판
                    		JSCDTO jcof1 = new JSCDTO(jscf.getWriteNum(), jscf.getHeadLine(), jscf.getWriter(), jscf.getWriteDate(), jscf.getWrite(), jscf.getComment(), jscf.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscfctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscfctrl.JSCFList2(jcof1, new Model()));               			
                		}

            		} else {
            			// 댓글을 안 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscf.setGoodJob(goodJob); // 자유 게시판 게시물 좋아요 저장
                    		
                    		// 자유 게시판
                    		JSCDTO jcof1 = new JSCDTO(jscf.getWriteNum(), jscf.getHeadLine(), jscf.getWriter(), jscf.getWriteDate(), jscf.getWrite(), jscf.getComment(), jscf.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscfctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscfctrl.JSCFList2(jcof1, new Model()));   
                		} else {
                			// 댓글을 안 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscf.getWriteNum() + " | 작성자 : " + jscf.getWriter() + " | 제목 : " + jscf.getHeadLine() + " | 작성일 : " + jscf.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscf.getWrite() + " ] ");
                    		// 자유 게시판
                			JSCDTO jcof1 = new JSCDTO(jscf.getWriteNum(), jscf.getHeadLine(), jscf.getWriter(), jscf.getWriteDate(), jscf.getWrite(), jscf.getComment(), jscf.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscfctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscfctrl.JSCFList2(jcof1, new Model()));                			
                		}

            		}
            		
                } else if(freeMenu.equals("0")) {
                	
                	System.out.println("\n커뮤니티 메인으로 이동합니다.");
                	cin.main(args);
                	
                } else {
                	
                	System.out.println("\n잘못 입력 하셨습니다, 처음으로 이동합니다.");
                	cin.main(args);
                	
                }        		
        	}
            
        } else if(mainMenu.equals("2")) {
        	while(true) {
                // JSTUDY 커뮤니티 - 스터디 메뉴
            	System.out.println("\n===============================================");
                System.out.println("\n## JSTUDY 커뮤니티 - 스터디 ## \n");
                String studyMenu; // 커뮤니티 - 스터디 메뉴 선택
                System.out.println("[1] 게시물 확인 [2] 게시물 글쓰기 [0] 커뮤니티 \n");
                System.out.print(" -> [스터디] 메뉴를 선택하세요 : ");
                studyMenu = sc.nextLine();
                
                if(studyMenu.equals("1")) {
                    // JSTUDY 커뮤니티 - 스터디 메뉴 -> 게시물 확인
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [스터디] -> 게시물 확인 ## \n");
            		System.out.println("전체 게시물 정보 수량 : " + jscslist.size()); // 전체 게시물 정보 수
                } else if(studyMenu.equals("2")) {
            		// JSTUDY 커뮤니티 - 스터디 메뉴 -> 게시물 글쓰기
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [스터디] -> 게시물 글쓰기 ## \n");
            		int studywriteNum = 1;
            		jscs.setWriteNum(studywriteNum++); // 스터디 게시물 번호 저장
            		System.out.print(" 작성자 : ");
            		writer = sc.nextLine();
            		jscs.setWriter(writer); // 스터디 게시물 작성자 저장
            		System.out.print(" 제목 : ");
            		headLine = sc.nextLine();
            		jscs.setHeadLine(headLine); // 스터디 게시물 제목 저장
            		System.out.print(" 내용 : ");
            		write = sc.nextLine();
            		jscs.setWrite(write); // 스터디 게시물 내용 저장
            		jscs.setWriteDate(dateFormat.format(cal.getTime())); // 스터디 게시물 작성일 저장
            		System.out.println(" * 해당 게시물이 등록되었습니다! * \n");
            		System.out.println("# JSTUDY 커뮤니티 [스터디] -> 게시물 등록 완료!");
            		System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");
            		
            		// 댓글 등록
            		System.out.print("\n -> 댓글을 등록 하시겠습니까? (Y/N) : ");
            		comtChk = sc.nextLine();
            		if(comtChk.equals("Y")) {
            			// 댓글 입력
            			System.out.print(" -> 댓글 : ");
                		comment = sc.nextLine();
                		System.out.println(" # 댓글이 등록 되었습니다!\n");
                		System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");
                		System.out.println("\n | 댓글 : " + comment + " | \n");
                		jscs.setComment(comment); // 스터디 게시물 댓글 저장
                		
                		// 댓글을 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscs.setGoodJob(goodJob); // 스터디 게시물 좋아요 저장
                    		
                    		// 스터디
                    		JSCDTO jcos1 = new JSCDTO(jscs.getWriteNum(), jscs.getHeadLine(), jscs.getWriter(), 
                    				jscs.getWriteDate(), jscs.getWrite(), jscs.getComment(), jscs.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscsctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscsctrl.JSCSList2(jcos1, new Model()));
                    		
                		} else {
                			// 댓글을 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		jscs.setComment(comment); // 스터디 게시물 댓글 저장
                    		
                    		// 스터디
                    		JSCDTO jcos1 = new JSCDTO(jscs.getWriteNum(), jscs.getHeadLine(), jscs.getWriter(), jscs.getWriteDate(), jscs.getWrite(), jscs.getComment(), jscs.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscsctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscsctrl.JSCSList2(jcos1, new Model()));
                    		
                		}

            		} else {
            			// 댓글을 안 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscs.setGoodJob(goodJob); // 스터디 게시물 좋아요 저장
                    		
                    		// 스터디
                    		JSCDTO jcos1 = new JSCDTO(jscs.getWriteNum(), jscs.getHeadLine(), jscs.getWriter(), jscs.getWriteDate(), jscs.getWrite(), jscs.getComment(), jscs.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscsctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscsctrl.JSCSList2(jcos1, new Model()));
                    		
                		} else {
                			// 댓글을 안 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscs.getWriteNum() + " | 작성자 : " + jscs.getWriter() + " | 제목 : " + jscs.getHeadLine() + " | 작성일 : " + jscs.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscs.getWrite() + " ] ");

                			// 스터디
                			JSCDTO jcos1 = new JSCDTO(jscs.getWriteNum(), jscs.getHeadLine(), jscs.getWriter(), jscs.getWriteDate(), jscs.getWrite(), jscs.getComment(), jscs.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscsctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscsctrl.JSCSList2(jcos1, new Model()));
                    		
                		}

            		}
            		
            	} else if(studyMenu.equals("0")) {
            		
            		System.out.println("\n커뮤니티 메인으로 이동합니다.");
                	cin.main(args);
                	
                } else {
                	
                	System.out.println("\n잘못 입력 하셨습니다, 처음으로 이동합니다.");
                	cin.main(args);
                	
                }        		
        	}
                        
        } else if(mainMenu.equals("3")) {
        	while(true) {
                // JSTUDY 커뮤니티 - 질문 답변 게시판 메뉴
            	System.out.println("\n===============================================");
                System.out.println("\n## JSTUDY 커뮤니티 - 질문 답변 게시판 ## \n");
                String qnaMenu; // 커뮤니티 - 질문 답변 메뉴 선택
                System.out.println("[1] 게시물 확인 [2] 게시물 글쓰기 [0] 커뮤니티 \n");
                System.out.print(" -> [질문 답변] 메뉴를 선택하세요 : ");
                qnaMenu = sc.nextLine();
                
                if(qnaMenu.equals("1")) {
                    // JSTUDY 커뮤니티 - 질문 답변 메뉴 -> 게시물 확인
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [질문 답변] -> 게시물 확인 ## \n");
            		System.out.println("전체 게시물 정보 수량 : " + jscqlist.size()); // 전체 게시물 정보 수
                } else if(qnaMenu.equals("2")) {
            		// JSTUDY 커뮤니티 - 질문 답변 메뉴 -> 게시물 글쓰기
                	System.out.println("\n===============================================");
            		int qnawriteNum = 1;
            		jscq.setWriteNum(qnawriteNum++); // 질문 답변 게시판 게시물 번호 저장
            		System.out.println("## JSTUDY 커뮤니티 [질문 답변] -> 게시물 글쓰기 ## \n");
            		System.out.print(" 작성자 : ");
            		writer = sc.nextLine();
            		jscq.setWriter(writer); // 질문 답변 게시판 게시물 작성자 저장
            		System.out.print(" 제목 : ");
            		headLine = sc.nextLine();
            		jscq.setHeadLine(headLine); // 질문 답변 게시판 게시물 제목 저장
            		System.out.print(" 내용 : ");
            		write = sc.nextLine();
            		jscq.setWrite(write); // 질문 답변 게시판 게시물 내용 저장
            		jscq.setWriteDate(dateFormat.format(cal.getTime())); // 질문 답변 게시판 게시물 작성일 저장
            		System.out.println(" * 해당 게시물이 등록되었습니다! * \n");
            		System.out.println("# JSTUDY 커뮤니티 [질문 답변] -> 게시물 등록 완료!");

            		System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
            		
            		// 댓글 등록
            		System.out.print("\n -> 댓글을 등록 하시겠습니까? (Y/N) : ");
            		comtChk = sc.nextLine();
            		if(comtChk.equals("Y")) {
            			// 댓글 입력
            			System.out.print(" -> 댓글 : ");
                		comment = sc.nextLine();
                		System.out.println(" # 댓글이 등록 되었습니다!\n");
                		System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
                		System.out.println("\n | 댓글 : " + comment + " | \n");
                		jscq.setComment(comment); // 질문 답변 게시판 게시물 댓글 저장
                		
                		// 댓글을 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscq.setGoodJob(goodJob); // 질문 답변 게시판 게시물 좋아요 저장
                    		
                    		// 질문 답변 게시판
                    		JSCDTO jcoq1 = new JSCDTO(jscq.getWriteNum(), jscq.getHeadLine(), jscq.getWriter(), jscq.getWriteDate(), jscq.getWrite(), jscq.getComment(), jscq.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscqctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscqctrl.JSCQList2(jcoq1, new Model()));
                    		
                		} else {
                			// 댓글을 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
                    		System.out.println("\n | 댓글 : " + comment + " | \n");
                    		jscq.setComment(comment); // 질문 답변 게시판 게시물 댓글 저장
                    		
                    		// 질문 답변 게시판
                    		JSCDTO jcoq1 = new JSCDTO(jscq.getWriteNum(), jscq.getHeadLine(), jscq.getWriter(), jscq.getWriteDate(), 
                    				jscq.getWrite(), jscq.getComment(), jscq.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscqctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscqctrl.JSCQList2(jcoq1, new Model()));
                    		
                		}

            		} else {
            			// 댓글을 안 달았을 경우
                		// 게시물 좋아요 O
                		System.out.print("\n -> 게시물에 '좋아요(★)'를 추가 하시겠습니까? (Y/N) : ");
                		goodChk = sc.nextLine();
                		if(goodChk.equals("Y")) {
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 했습니다!\n");
                			System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
                    		System.out.println("\n | 좋아요 " + goodJob + "! | ");
                    		jscq.setGoodJob(goodJob); // 질문 답변 게시판 게시물 좋아요 저장
                    		
                    		// 질문 답변 게시판
                    		JSCDTO jcoq1 = new JSCDTO(jscq.getWriteNum(), jscq.getHeadLine(), jscq.getWriter(), jscq.getWriteDate(), jscq.getWrite(), jscq.getComment(), jscq.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscqctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscqctrl.JSCQList2(jcoq1, new Model()));
                    		
                		} else {
                			// 댓글을 안 달았을 경우
                			// 게시물 좋아요 X
                			System.out.println(" # 게시물에 '좋아요(★)'를 추가 하지 않으셨습니다.\n");
                			System.out.println(" | No." + jscq.getWriteNum() + " | 작성자 : " + jscq.getWriter() + " | 제목 : " + jscq.getHeadLine() + " | 작성일 : " + jscq.getWriteDate() + "\n [ 작성 내용 ] \n" + " [ " + jscq.getWrite() + " ] ");
                    		
                    		// 질문 답변 게시판
                			JSCDTO jcoq1 = new JSCDTO(jscq.getWriteNum(), jscq.getHeadLine(), jscq.getWriter(), jscq.getWriteDate(), jscq.getWrite(), jscq.getComment(), jscq.getGoodJob());
                    		// Controller만 호출.
                    		JSCController jscqctrl = new JSCController();
                    		System.out.println("\n# Program On #\n");
                    		System.out.println(jscqctrl.JSCQList2(jcoq1, new Model()));
                    		
                		}

            		}          		

            	} else if(qnaMenu.equals("0")) {
            		
                	System.out.println("\n커뮤니티 메인으로 이동합니다.");
                	cin.main(args);
                	
                } else {
                	
                	System.out.println("\n잘못 입력 하셨습니다, 처음으로 이동합니다.");
                	cin.main(args);
                	
                }      		
        	}

        } else if(mainMenu.equals("4")) {
        	while(true) {
        		// JSTUDY 커뮤니티 - JSTUDY Quiz
        		System.out.println("\n===============================================");
                System.out.println("\n## JSTUDY 커뮤니티 - QUIZ ## \n");
                String quizMenu; // 커뮤니티 - Weekly Quiz 메뉴 선택
                System.out.println("[1] 관리자 모드 [2] QUIZ 시작 [0] 커뮤니티 \n");
                System.out.print(" -> [JSTUDY Quiz] 메뉴를 선택하세요 : ");
                quizMenu = sc.nextLine();
               
                if(quizMenu.equals("1")) {
            		// JSTUDY 커뮤니티 - Quiz 메뉴 -> (관리자) 문제 및 정답 설정
                	System.out.println("\n===============================================");
                	System.out.println("\n## JSTUDY 커뮤니티 [JSTUDY Quiz] -> 관리자 모드 ## \n");
                	System.out.println("## JSTUDY 커뮤니티 [JSTUDY Quiz] : 관리자 정보를 입력하세요. ## \n");
                	
                	// 관리자 로그인
                	System.out.print("Admin : ");
                	admin = sc.nextLine();
                	System.out.print("AdminPw : ");
                	adminPw = sc.nextLine();
                	
                	if(admin.equals("ysk2388") && adminPw.equals("7777")) {
                		// 관리자 정보가 일치할 때
                		System.out.println(" -> [ " + admin + " ] 님 로그인 되었습니다.\n");
                		
                		// 문제 설정
                		System.out.println("## 설정 할 문제를 입력하세요. ## \n");
            			System.out.print(" -> 설정 할 문제 : ");
            			quest = sc.nextLine();
            			System.out.println("\n## 설정 된 문제 정보 ## \n");
                		System.out.print(" -> 입력 된 문제 : " + quest + "\n");
                		jq.setQuest(quest);

                		// 정답 설정
                		System.out.println("\n## 설정 할 정답을 입력하세요. ## \n");
                		System.out.print(" -> 설정 할 정답 : ");
                		answer = sc.nextLine();
                		System.out.println("\n## 설정 된 정답 정보 ## \n");
                		System.out.print(" -> 입력 된 정답 : " + answer + "\n");
                		ja.setAnswer(answer);
                		
                		// 종합 = 문제 + 정답
                		System.out.println("\n## 설정 된 퀴즈 정보 ## \n");
//                		jsqlist.add(new JSQDTO(jq.getQuest(), ja.getAnswer()));
                		System.out.print(" | 문제 | " + jq.getQuest() + "\t");
        				System.out.print(" | 정답 | " + ja.getAnswer() + "\n");
                		System.out.println("\n");
                		
                	} else {
                		// 관리자 정보가 일치하지 않을 때
                		System.out.println(" -> 관리자 정보가 일치하지 않습니다.\n");
                	}
            		
                } else if(quizMenu.equals("2")) {
                    // JSTUDY 커뮤니티 - JSTUDY Quiz 메뉴 -> QUIZ 시작
                	System.out.println("\n===============================================");
            		System.out.println("## JSTUDY 커뮤니티 [JSTUDY Quiz] 에 오신 것을 환영 합니다! ## \n");
            		
            		// 문제 출제
            		System.out.println("## 해당 문제를 보고 답을 입력하세요. ## \n");
            		System.out.println(" -> 문제 : " + jq.getQuest());
            		
            		// 정답 입력
             		System.out.print("\n -> 답안 : ");
        			usrAns = sc.nextLine();
        			System.out.println("\n## 유저가 입력 한 답안 정보 ## \n");
            		System.out.print(" -> 유저 답안 : " + usrAns + "\n");
            		
            		// 정답 판단
                	if(usrAns.equals(ja.getAnswer())) {
                		System.out.println("\n 정답은 [" + ja.getAnswer() + "] 입니다!");
                		System.out.println("\n -> 결과 : 정답!");
                	} else {
                		System.out.println("\n 정답은 [" + ja.getAnswer() + "] 입니다!");
                		System.out.println("\n -> 결과 : 오답");
                	}
                	
                	// 프로그램 구동
                	JSQDTO jcq1 = new JSQDTO(jq.getQuest(), ja.getAnswer());
            		// Controller만 호출.
            		JSQController jsqctrl = new JSQController();
            		System.out.println("\n# Program On #\n");
            		System.out.println(jsqctrl.JSQList2(jcq1, new Model()));
        	
                } else if(quizMenu.equals("0")) {
                	
                	System.out.println("\n커뮤니티 메인으로 이동합니다.");
                	cin.main(args);
                	
                } else {
                	
                	System.out.println("\n잘못 입력 하셨습니다, 처음으로 이동합니다.");
                	cin.main(args);
                	
                } 
        	}
      	
        } else if(mainMenu.equals("0")) {
        	// JSTUDY 커뮤니티 - 메인 메뉴 복귀
        	System.out.println("\n메인 메뉴로 이동합니다.");
        	cin.main(args);
        	
        } else {
        	System.out.println("\n잘못 입력 하셨습니다, 처음으로 이동합니다.");
        	cin.main(args);
        	
        }
        		
		cin.main(args);

	}
}