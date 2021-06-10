package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a01_Join;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;


public class z09_JoinDAO_9 {
 
    Scanner sc = new Scanner(System.in); 
    
    ArrayList<JoinDTO> members = new ArrayList<>();

	private String nmkey;
	
    // 생성자로 초기 데이터 입력
    public z09_JoinDAO_9() {
    	
        members.add(new JoinDTO("NO_001","hongd123@gmail.com","1010","홍길동"));
        members.add(new JoinDTO("NO_002","pks112@naver.com","1020","박길순"));
        members.add(new JoinDTO("NO_003","cdg5950@hanmail.net","2030","최동길"));
        members.add(new JoinDTO("NO_004","ygm4949@naver.com","5060","유김문"));
    }
 
    // 메뉴에 해당하는 작업이 실행됨
    public void run() {
        
        int key = 0;
        while ((key = menu()) != 0) {
            switch (key) {
                case 1:
                	// 로그인
                    Login(); 
                    break;
                case 2:
                	// 회원가입
                    MemberJoin(); 
                    break;
                case 3:
                	// 전체 회원 보기
                    SelectMember();
                                    	
            }
        }
    }
 
    // 전체 회원을 확인하기 위한 메소드
    private void SelectMember() {
        Iterator<JoinDTO> ite = members.iterator();
        
        while(ite.hasNext()) {
            System.out.println(ite.next() + " ");
            
        }
    }
 
    // 회원가입시 선택시 호출되는 메소드 
    private void MemberJoin() {
       
        while(true) {
        	sc.nextLine();
            
        	// 회원가입시 필요한 정보들을 메소드로 입력받음
        	String id = getStrInput(" ID(Email) : ");
        	String pw = getStrInput(" PassWord : ");
        	String pw2 = getStrInput(" Password Confirm : ");
        	String name = getStrInput(" Name : ");
        	String ok1 = getStrInput(" 이용 약관에 동의하십니까? (Y/N) : "); 
        	String ok2 = getStrInput(" 개인정보 수집 및 이용에 동의하십니까? (Y/N) : "); 
        	String ok3 = getStrInput(" 만 14세 이상입니까? (Y/N) : ");
        	String ok4 = getStrInput(" 이메일 수신에 동의겠습니다? (선택) (Y/N) : ");
            
          	// 회원가입시 ID가 중복되는지, 비밀번호 입력이 맞았는지, 약관에 동의했는지 확인 
            if(idCheck(id)) {
                System.out.println(" 중복된 ID입니다.\n");
                break;
            } else if(pw.equals(pw2) && ok1.equals("Y") && ok2.equals("Y") && ok3.equals("Y") || ok4.equals("N")) {
				members.add(new JoinDTO(nmkey, id, pw, name));
				System.out.println("이메일 수신 동의에 거부하셨습니다.\n ");
				System.out.println("\n [" + id + "]님 가입을 축하드립니다!\n ");
				break;
            } else {
				if(ok4.equals("Y")) {
					System.out.println("이메일 수신에 동의하셨습니다.\n ");
					System.out.println("\n [" + id + "]님 가입을 축하드립니다!\n ");
					break;
            	} else if(ok1.equals("N")) {
	            	System.out.println(" 이용 약관에 동의(Y)하셔야 가입이 가능합니다.\n ");
	            	break;
	            } else if(ok2.equals("N")) {
	            	System.out.println(" 개인정보 수집 및 이용 약관에 동의(Y)하셔야 가입이 가능합니다.\n ");
	            	break;
	            } else if(ok3.equals("N")) {
	            	System.out.println(" 만 14세 이상부터 가입이 가능합니다.\n ");
	            	break;
				} else {
	            	System.out.println(" 제대로 입력되지 않았습니다.\n");
	                System.out.println(" 다시 한번 확인해주십시오.\n");
	                break;
				}
            }
        }
    }
            
    // 중복된 ID인지 확인
    private boolean idCheck(String id) {
        boolean check = true;
        JoinDTO member = FindById(id);
        if(member == null)
            check = false;
        return check;
    }
 
    // 로그인할 때 사용되는 메소드, ID와 PW가 있는지 확인
    private void Login() {
        sc.nextLine();
        String id = getStrInput(" ID(Email) : ");
        String pw = getStrInput(" PassWord : ");
        
        JoinDTO member = FindById(id);
        if(member == null){
            System.out.println(" 등록되지 않은 ID입니다.\n");
        }else if(member.getPW().equals(pw)) {
            System.out.println(" [" + member.getID() + "]님께서 로그인 하셨습니다.\n");
        }else {
            System.out.println(" 비밀번호가 틀렸습니다.\n");
        }
    }
 
    // Member클래스형 메소드, ArrayList에서 ID 검색
    private JoinDTO FindById(String id) {
        for(JoinDTO m : members) {
            if(m.getID().equals(id)) {
                return m;
            }
        }
        return null;
    }

    // 프로그램을 실행시키면 나오는 메뉴화면
    private int menu() {
        System.out.println("\n ☆★ MARPPLE에 오신 것을 환영합니다! ☆★");
        return getNumInput("[1] 로그인 [2] 회원가입 [3] 전체 회원 보기 [0] 장바구니");
    }
 
    // 문자열을 입력받을 때 사용
    private String getStrInput(String msg) {
        System.out.print(msg);
        return sc.nextLine();        
    }
 
    // 정수형을 입력받을 때 사용
    private int getNumInput(String msg) {
        System.out.println(msg);
        System.out.print("# 메뉴(1~4) 중에 입력하세요 : ");
        return sc.nextInt();
    }
}