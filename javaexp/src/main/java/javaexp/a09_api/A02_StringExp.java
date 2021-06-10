package javaexp.a09_api;

public class A02_StringExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		ex1) himan일 때, 등록된 아이디입니다. 표시
//			그 외에는 등록 가능한 아이디입니다.

		String id = args[0]; // 입력한 id
		String pass = args[1]; // 입력한 pass
		if(id.equals("himan")) {
			System.out.println("등록된 아이디입니다.");
		} else {
			System.out.println("해당 아이디로 등록 가능합니다.");
		}
		
//		ex2) args에 로그인 id와 pass를 입력하고, "himan" // "7777"일 때만 로그인 성공
//		그 외에는 로그인 실패로 출력되게 하세요.
		
		if(id.equals("himan") && pass.equals("7777")) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}

	}
}
