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
		
		String name;
		String id;
		String pw;
		String tel;
		String email;
		
		System.out.println("# Picmagine 회원가입 #\n");
		
		System.out.print(" -> 이름 : ");
		name = sc.nextLine();
		jdto.setName(name);
		
		System.out.print(" -> ID : ");
		id = sc.nextLine();
		jdto.setId(id);
		
		System.out.print(" -> PW : ");
		pw = sc.nextLine();
		jdto.setPw(pw);
		
		System.out.print(" -> Tel : ");
		tel = sc.nextLine();
		jdto.setTel(tel);
		
		System.out.print(" -> Email : ");
		email = sc.nextLine();
		jdto.setEmail(email);
		
		System.out.println("# 회원가입이 완료되었습니다! #\n");
		System.out.println("# 로그인을 하시겠습니까? (Y/N) : #\n");
		
		String login = sc.nextLine();
		
		if(login.equals("Y")) {
			
			System.out.println("# Picmagine 로그인 #\n");
			
			System.out.println(" -> ID : ");
			id = sc.nextLine();
			
			System.out.println(" -> PW : ");
			pw = sc.nextLine();
			
			if(id == "" || pw == "") {
				
				System.out.println("ID / PW를 입력하세요.");
			
			} else if (id != jdto.getId() || id != jdto.getPw()) {
				
				System.out.println("ID / PW가 일치하지 않습니다.");
				
			} else {
				
				System.out.println(jdto.getId() + "님 로그인 되었습니다!");
				
			}
			
		} else {
			
			System.out.println("로그인을 취소했습니다.");
			
			JOINController joinctrl = new JOINController();
			System.out.println("\n# Program On #\n");
			System.out.println(joinctrl.Joined(jdto, new Model()));
			
		}

	}

}
