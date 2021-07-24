package Project_SIST.Java.A05_Picmagine.join;

import java.util.ArrayList;

import Project_SIST.Java.Model;

public class JOINService {
	
	JOINDAO jdao = new JOINDAO();
	
	// 회원 가입 완료
	public String Joined(JOINDTO j) {
		jdao.Joined(j);
		return "===== Picmagine : 회원 가입 완료 =====";
	}
	
	// 회원 정보 리스트
	public String memberList() {
		ArrayList<JOINDTO> jlist = jdao.memberList();
		for(JOINDTO j:jlist) {
			System.out.print(j.getMemcode() + "\t");
			System.out.print(j.getName() + "\t");
			System.out.print(j.getId() + "\t");
			System.out.print(j.getPw() + "\t");
			System.out.print(j.getTel() + "\t");
			System.out.print(j.getEmail() + "\n");
		}
		return "회원 정보 출력 완료";
	}
	
	// 회원 정보 검색
}
