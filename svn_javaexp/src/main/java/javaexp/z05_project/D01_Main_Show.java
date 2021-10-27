package javaexp.z05_project;

public class D01_Main_Show {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_MemberController c = new A01_MemberController();
		c.login(new Member("himan","7777"), new Model());
		// Member(String id, String pass, String name, String auth, String email, int point)
		c.regMember(new Member("higirl","8888","김영희","관리자",
					"call@naver.com",1000), new Model());
	
	}

}
