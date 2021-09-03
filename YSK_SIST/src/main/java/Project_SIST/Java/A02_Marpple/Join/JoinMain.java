package Project_SIST.Java.A02_Marpple.Join;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import Project_SIST.Java.A02_Marpple.Join.Model;

public class JoinMain {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("# MARRPLE 회원가입 #\n");
//		관리자용으로 입력받는 메뉴이나 이번 프로젝트에는 따로 분할하지 않음.
		System.out.println("# (관리자용) MARPPLE 회원 번호 #");
		System.out.print("\n회원 번호 (NO_005) : ");
		String nmkey = sc.nextLine();
		System.out.print("ID(EMAIL) : ");
		String id = sc.nextLine();
		System.out.print("PW : ");
		String pw = sc.nextLine();
		System.out.print("이름 : ");
		String name = sc.nextLine();
		System.out.println("\n# 회원가입 및 로그인 성공! #\n");
				
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		JoinDTO join = new JoinDTO(nmkey,id,pw,name);
		// Controller만 호출
		JoinController jctrl = new JoinController();
		System.out.println("\n# 호출된 화면 #\n");
		System.out.println(jctrl.joinList2(join, new Model()));
		
		System.out.println("\n===============================================\n");
		System.out.println("\n# MARRPLE 현재 회원 정보 #\n");
		ArrayList<JoinDTO> jlist = new ArrayList<JoinDTO>();
		System.out.println("전체 회원 정보 여부 : " + jlist.isEmpty());
//		전체 회원 정보가 있는지 여부를 판단한다.
		jlist.add(new JoinDTO("NO_004","mong@gmail.com","1111","마길동"));
		jlist.add(new JoinDTO("NO_003","yong@gmail.com","1029","유길동"));
		jlist.add(new JoinDTO("NO_002","kong@gmail.com","0604","김길동"));
		jlist.add(new JoinDTO("NO_001","chong@gmail.com","9603","최길동"));
//		전체 회원의 수를 나타낸다.
		System.out.println("전체 회원 정보 수량 : " + jlist.size());
		
//		개인 정보를 수정하는 소스이다.
		System.out.println("\n개인 정보 수정 페이지로 이동하시겠습니까? (Y/N)");

		String edit = sc.nextLine();
		if(edit.equals("Y")) {
			System.out.println("\n# MARRPLE 개인 정보 수정 #");
			Scanner sc2 = new Scanner(System.in);
			System.out.println(new JoinDTO(nmkey,id,pw,name));
			
//			이메일 변경 여부
			String editID = "Y";
			System.out.println("# 이메일을 변경하시겠습니까? (Y/N) #\n");
			editID = sc.nextLine();
			if(editID.equals("Y")) {
				System.out.println("변경할 이메일 : ");
				id = sc2.nextLine();
				jlist.set(1, join);
				System.out.println("변경된 이메일 : " + id);
				System.out.println(new JoinDTO(nmkey,id,pw,name) + "\n");
			} else {
				System.out.println("이메일 변경을 취소했습니다.\n");
			}
			
//			패스워드 변경 여부
			String editPW = "Y";
			System.out.println("# 패스워드를 변경하시겠습니까? (Y/N) #\n");
			editPW = sc.nextLine();
			if(editPW.equals("Y")) {
				System.out.println("변경할 패스워드 : ");
				pw = sc2.nextLine();
				jlist.set(2, join);
				System.out.println("변경된 패스워드 : " + pw);
				System.out.println(new JoinDTO(nmkey,id,pw,name) + "\n");
			} else {
				System.out.println("패스워드 변경을 취소했습니다.\n");
			}

//			이름 변경 여부
			String editName = "Y";
			System.out.println("# 이름을 변경하시겠습니까? (Y/N) #\n");
			editName = sc.nextLine();
			if(editName.equals("Y")) {
				System.out.println("변경할 이름 : ");
				name = sc2.nextLine();
				jlist.set(3, join);
				System.out.println("변경된 이름 : " + name);
				System.out.println(new JoinDTO(nmkey,id,pw,name) + "\n");
			} else {
				System.out.println("이름 변경을 취소했습니다.\n");
			}
			
//			성별 변경 여부
			String editGender = "Y";
			System.out.println("# 성별을 변경하시겠습니까? (Y/N) #\n");
			editGender = sc.nextLine();
			if(editGender.equals("Y")) {
				System.out.println("성별(남자/여자) : \n");
				String gender = sc2.nextLine();
				if(gender.equals("남자")) {
					System.out.println("성별 : " + gender);
				} else {
					System.out.println("성별 : 여자");
				}
				System.out.println(new JoinDTO(nmkey,id,pw,name) + "\n");
			} else {
				System.out.println("성별 변경을 취소했습니다.\n");
			}
			
//			회원 탈퇴 여부
			String remove = "Y";
			System.out.println("# 회원 탈퇴를 하시겠습니까? (Y/N) #\n");
			remove = sc2.nextLine();
			if(remove.equals("Y")) {
				System.out.println("# 정말로 회원 탈퇴를 진행하시겠습니까? (Y/N) #\n");
				remove = sc2.nextLine();
					if(remove.equals("Y")) {
						jlist.remove(new JoinDTO(nmkey,id,pw,name));
						System.out.println("회원 탈퇴가 완료 되었습니다.");
						System.out.println("그동안 MARPPLE을 이용해 주셔서 감사합니다.\n");
						JoinMain jin = new JoinMain();
						jin.main(args);
						} else {
							System.out.println("회원 탈퇴가 취소되었습니다.");
							System.out.println(new JoinDTO(nmkey,id,pw,name));
							JoinMain jin = new JoinMain();
							jin.main(args);
						}
					} else {
						System.out.println("회원 탈퇴가 취소되었습니다.");
						System.out.println(new JoinDTO(nmkey,id,pw,name));
						JoinMain jin = new JoinMain();
						jin.main(args);
					}
			
//		개인 정보 수정 취소할 때 나오는 메세지
		} else {
			System.out.println("개인 정보 수정을 취소했습니다.\n");
			System.out.println("===============================================\n");
			JoinMain jin = new JoinMain();
			jin.main(args);
		}
	}	

}