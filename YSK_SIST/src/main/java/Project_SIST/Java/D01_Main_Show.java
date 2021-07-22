package Project_SIST.Java;

public class D01_Main_Show {

	   public static void main(String[] args) {
	      // TODO Auto-generated method stub

	      A01_MemberController c = new A01_MemberController();
	      c.login(new Member("himan", "7777"), new Model());
	      c.regMember(new Member("hihi", "8888", "김영희", 
	            "call@naver.com","관리자",1000), new Model());
	   }
	}