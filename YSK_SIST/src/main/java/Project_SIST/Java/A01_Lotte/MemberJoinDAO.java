package Project_SIST.Java.A01_Lotte;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;


public class MemberJoinDAO {
 
    Scanner sc = new Scanner(System.in); 
    ArrayList<Member> members = new ArrayList<>();
    
    
    // 생성자로 초기 데이터 입력
    public MemberJoinDAO() {
    	
        members.add(new Member("hong1", "1111", "홍길동", "010-7777-8888", 
        		"ssangyong@naver.com", "서울 특별시", "02-555-4468"));
        members.add(new Member("kong2", "2222", "김길동", "010-4855-1234", 
        		"kong2@gmail.com", "부산 광역시", "031-346-4642"));
        members.add(
        		new Member("cong3", "3333", "최길동", "010-1578-9710", 
        		"cong3@hanmail.net", "서울 특별시 강남구", "02-348-4632"));
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
        Iterator<Member> ite = members.iterator();
        
        while(ite.hasNext()) {
            System.out.println(ite.next() + " ");
        }
        
    }
 
    // 회원가입시 선택시 호출되는 메소드 
    private void MemberJoin() {
       
        while(true) {
        	sc.nextLine();
            
        	// 회원가입시 필요한 정보들을 메소드로 입력받음
        	String id = getStrInput(" ID : ");
        	String pw = getStrInput(" PassWord : ");
        	String pw2 = getStrInput(" Password Confirm : ");
        	String name = getStrInput(" Name : ");
        	String hp = getStrInput(" H.P : ");
        	String email = getStrInput(" Email : ");
        	String address = getStrInput(" Address : ");
        	String tel = getStrInput(" Tel : ");
        	String ok = getStrInput(" 회원가입 약관에 동의하십니까? (Y/N) : "); 
            
          	// 회원가입시 ID가 중복되는지, 비밀번호 입력이 맞았는지, 약관에 동의했는지 확인 
            if(idCheck(id)) {
                System.out.println(" 중복된 ID입니다.\n");
                break;
            } else if(pw.equals(pw2) && ok.equals("Y")) {
                members.add(new Member(id, pw, name, hp, email, address, tel));
                System.out.println("\n [" + id + "]님 가입을 축하드립니다!\n");
                break;
            } else if(ok.equals("N")) {
            	System.out.println(" 회원가입 약관에 동의(Y)하셔야 가입이 가능합니다.\n");
            	break;
            } else {
            	System.out.println(" 제대로 입력되지 않았습니다.\n");
                System.out.println(" 다시 한번 확인해주십시오.\n");
                break;
            }  
        }
    }
 
    // 중복된 ID인지 확인
    private boolean idCheck(String id) {
        boolean check = true;
        Member member = FindById(id);
        if(member == null)
            check = false;
        return check;
    }
 
    // 로그인할 때 사용되는 메소드, ID와 PW가 있는지 확인
    private void Login() {
        sc.nextLine();
        String id = getStrInput(" ID : ");
        String pw = getStrInput(" PassWord : ");
        
        Member member = FindById(id);
        if(member == null){
            System.out.println(" 등록되지 않은 ID입니다.\n");
        }else if(member.getPW().equals(pw)) {
            System.out.println(" [" + member.getID() + "]님께서 로그인 하셨습니다.\n");
        }else {
            System.out.println(" 비밀번호가 틀렸습니다.\n");
        }
    }
 
    // Member클래스형 메소드, ArrayList에서 ID 검색
    private Member FindById(String id) {
        for(Member m : members) {
            if(m.getID().equals(id)) {
                return m;
            }
        }
        return null;
    }

    // 프로그램을 실행시키면 나오는 메뉴화면
    private int menu() {
        System.out.println("\n## WELCOME TO LOTTE WORLD TOWER ##");
        return getNumInput("[1]로그인 [2]회원가입 [3]전체 회원 보기 [0]종료");
    }
 
    // 문자열을 입력받을 때 사용
    private String getStrInput(String msg) {
        System.out.print(msg);
        return sc.nextLine();        
    }
 
    // 정수형을 입력받을 때 사용
    private int getNumInput(String msg) {
        System.out.println(msg);
        System.out.print("## 메뉴(1~4) 중에 입력하세요 : ");
        return sc.nextInt();
    }
}