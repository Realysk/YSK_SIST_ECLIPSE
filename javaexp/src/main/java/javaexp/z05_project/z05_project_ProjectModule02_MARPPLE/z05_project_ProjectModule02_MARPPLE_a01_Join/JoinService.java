package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a01_Join;

import java.util.ArrayList;
import java.util.Scanner;

public class JoinService {
	JoinDAO jdao = new JoinDAO();
	public ArrayList<JoinDTO> joinList(JoinDTO jo) {

		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
		System.out.println("JoinDAO에 전송 할 회원 정보 데이터 1 (회원번호) : " + jo.getNmkey());
		System.out.println("JoinDAO에 전송 할 회원 정보 데이터 2 (ID) : " + jo.getID());
		System.out.println("JoinDAO에 전송 할 회원 정보 데이터 3 (PW) : " + jo.getPW());
		System.out.println("JoinDAO에 전송 할 회원 정보 데이터 4 (이름) : " + jo.getName() + "\n");
//		System.out.println("JoinDAO에서 받을 회원 정보 데이터 크기 : " + jdao.joinList(jo).size() + "\n");
		return jdao.joinList(jo);

	}
}