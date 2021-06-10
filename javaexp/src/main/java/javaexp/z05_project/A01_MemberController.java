package javaexp.z05_project;

public class A01_MemberController {
	
	// DAO 호출
	private C01_MemberDao dao = new C01_MemberDao();
	// 중재역할
	
	// ID:[		]
	// PASS:[	]
	// [로그인]
	// 화면단에서 받은 데이터 매개변수(Member m)로 받고
	// 다시 화면에 넘겨 준 데이터 Model d로 선언하여 처리한다.
	// 기능메서드선언(입력데이터처리,모델객체)
	public String login(Member m, Model d) {
		// ID/PASS가 담긴 Member를 받는다.
		// 넘겨온 ID/PASS를 DAO를 처리해서 최종 결과를 model로 화면에 넘겨준다.
		d.addAttribute("로그인 결과", dao.login(m));
		System.out.println("모델 결과 값 : " + dao.login(m));
		
		return "호출할 화면";
	}
	
	/*
	 
 	회원가입
 	id:[	]
 	pass:[		]
 	name:[		]
 	email:[		]
 	auth:[		]
 	point:[		]
 	[회원가입]
	 
	 */

	public String regMember(Member insert, Model d) {
		// 회원 가입시 입력한 데이터 : insert에 담겨있음.
		// dao.호출을 통해서 데이터 입력.
		System.out.println("## controller 처리 ##");
		// model을 통해서 화면에 출력할 회원가입성공/실패 결정
		d.addAttribute("result",dao.insert(insert));
		System.out.println("최종 결과 : " + dao.insert(insert));
	
		return "화면 호출";
	}
}

