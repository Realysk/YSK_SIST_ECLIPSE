package Project_SIST.Java.A05_Picmagine.join;

import java.util.ArrayList;

public class JOINService {
	
	JOINDAO jdao = new JOINDAO();
	
	// 회원 가입 완료
	public String Joined(JOINDTO j) {
		jdao.Joined(j);
		return "===== Picmagine : 회원 가입 완료 =====";
	}
	
/*
 	private String memcode; // 회원 번호
	private String name; // 이름
	private String id; // ID
	private String pw; // PW
	private String tel; // Tel
	private String email; // 이메일
 */	
	
	// 회원 정보 리스트
	public String memberList() {
		ArrayList<JOINDTO> jlist = jdao.memberList();
		for(JOINDTO j:jlist) {
			System.out.print(j.getMemcode() + "\t");
			System.out.print(j.getName() + "\t");
			System.out.print(j.getId() + "\t");
			System.out.print(j.getPw() + "\t");
			System.out.print(j.getTel() + "\t");
			System.out.print(j.getEmail() + "\t");
		}
		return "회원정보 출력 완료";
	}
}
