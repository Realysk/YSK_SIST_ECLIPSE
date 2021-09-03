package Project_SIST.Java.A02_Marpple.Join;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class JoinDAO {
	
	// 입력값에 의해서 처리한 ArrayList리턴해준다.
	public ArrayList<JoinDTO> joinList(JoinDTO jo){
		ArrayList<JoinDTO> jlist  = new ArrayList<JoinDTO>();
		
		jlist.add(new JoinDTO(jo.getNmkey(), jo.getID(), jo.getPW(), jo.getName()));
		
	    // 전체 회원을 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에 넘겨 줄 회원 정보 데이터 #\n");
		System.out.println("회원 번호 : " + jo.getNmkey());
		System.out.println("ID(EMAIL) : " + jo.getID());
		System.out.println("PW : " + jo.getPW());
		System.out.println("이름 : " + jo.getName() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에서 온 회원 정보 데이터 리스트 #\n");
		jlist.add(new JoinDTO("NO_004","mong@gmail.com","1111","마길동"));
		jlist.add(new JoinDTO("NO_003","yong@gmail.com","1029","유길동"));
		jlist.add(new JoinDTO("NO_002","kong@gmail.com","0604","김길동"));
		jlist.add(new JoinDTO("NO_001","chong@gmail.com","9603","최길동"));
//		System.out.println("===============================================\n");
		for(JoinDTO join:jlist) {
			System.out.print("ID(EMAIL) : " + join.getID() + "\n");
			System.out.print("PW : " + join.getPW() + "\n");
			System.out.print("이름 : " + join.getName());
			System.out.println("\n");
		}

		return jlist;
	}
}
