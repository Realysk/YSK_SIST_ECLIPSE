package Project_SIST.Java.A05_Picmagine.join;

import java.util.Scanner;

import Project_SIST.Java.Model;

public class JOINMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		JOINMain jin = new JOINMain();
//		jin.main(args);
		
		Scanner sc = new Scanner(System.in);
		JOINDTO jdto = new JOINDTO();
		
		String name, id, pw, tel, email;
		String auth = "회원";
		
		System.out.println("# Picmagine 회원가입 #\n");
		
		System.out.print(" -> ID : ");
		id = sc.nextLine();
		jdto.setMemid(id);
		
		System.out.print(" -> PW : ");
		pw = sc.nextLine();
		jdto.setMempw(pw);
		
		System.out.print(" -> Tel : ");
		tel = sc.nextLine();
		jdto.setMemtel(tel);
		
		System.out.print(" -> Email : ");
		email = sc.nextLine();
		jdto.setMememail(email);
		
		jdto.setMemauth(auth);
		
		System.out.println(" # " + jdto.getMemid() + " 님은 [" + jdto.getMemauth() + "] 으로 회원가입이 완료되었습니다! #\n");
		
		JOINController joinctrl = new JOINController();
		System.out.println("\n# Program On #\n");
		System.out.println(joinctrl.Joined(jdto, new Model()));
		
//		System.out.print("# 로그인을 하시겠습니까? (Y/N) : ");
//		String login = sc.nextLine();
//		
//		if(login.equals("Y")) {
//			
//			System.out.println("# Picmagine 로그인 #\n");
//			
//			System.out.print(" -> ID : ");
//			id = sc.nextLine();
//			
//			System.out.print(" -> PW : ");
//			pw = sc.nextLine();
//			
//			if(id == "" || pw == "") {
//				
//				System.out.println("ID 또는 PW를 입력하세요.");
//			
//			} else if (id != jdto.getMemid() || id != jdto.getMempw()) {
//				
//				System.out.println("ID 또는 PW가 일치하지 않습니다.");
//				
//			} else {
//				
//				System.out.println(jdto.getMemid() + "님 로그인 되었습니다!");
//				
//			}
//			
//		} else {
//			
//			System.out.println("로그인을 취소했습니다.");
//			
//			JOINController joinctrl = new JOINController();
//			System.out.println("\n# Program On #\n");
//			System.out.println(joinctrl.Joined(jdto, new Model()));
//			
//		}

	}

}
