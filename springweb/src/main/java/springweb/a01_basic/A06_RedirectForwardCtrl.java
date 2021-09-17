package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springweb.z01_vo.Person;

@Controller
public class A06_RedirectForwardCtrl {
/*
# Redirect/Forward
	1. Controller의 요청처리가 끝난 후, 다시 특정한 Controller의 요청 URL을 호출하는 경우에 사용되는데, redirect를 요청값 없이 controller의 다른 url을 호출,
		forward는 요청값과 함께 controller의 다른 url을 호출할 때 사용된다.
		ex) 등록화면 처리 후, 조회페이지로 가는 처리를 할 때
			수정 처리 후, 상세화면으로 가는 처리를 할 때
*/	
	// http://localhost:7080/springweb/list.do	
	@RequestMapping("list.do")
	public String list(@RequestParam(value="sch", defaultValue="") String sch) {
		System.out.println("요청값 : " + sch);
		System.out.println("리스트 화면 호출");
		return "WEB-INF\\views\\a01_basic\\a14_list.jsp";
	}
	
	@RequestMapping("insert.do")
	public String insert() {
		// 등록 후, 리스트 url 호출
		System.out.println("등록 처리(redirect)");
		return "redirect:/list.do";
	}
	
	@RequestMapping("insert2.do")
	public String insert2() {
		// 등록 후, 리스트 url 호출
		System.out.println("등록 처리(forward)");
		return "forward:/list.do";
	}
	
	
	
	/*
	  memberList.do(회원리스트 - 메인화면), memberRegister.do(회원정보 등록), memberDetail.do(회원정보 상세), memberDelete.do(회원정보 삭제)
	  	회원리스트 화면 => 등록 처리 (memberRegister.do) = (forward) => 회원 상세화면 호출 (memberDetail.do)
	  	회원 상세화면 호출 (memberDetail.do) => 삭제처리 (memberDelete.do) = (redirect) => 회원리스트 화면
	 */
	
	// http://localhost:7080/springweb/memberList1.do	
	@RequestMapping("memberList1.do")
	public String memberList(@RequestParam(value="id", defaultValue="") String id) {
		System.out.println("요청값 : " + id);
		System.out.println("회원 리스트 화면 호출");
		return "WEB-INF\\views\\a01_basic\\a16_memberlist.jsp";
	}
	
	@RequestMapping("memberDetail1.do")
	public String memberDetail(@RequestParam(value="id", defaultValue="") String id) {
		System.out.println("상세조회 ID : " + id);
		System.out.println("회원 상세 화면 호출");
		return "WEB-INF\\views\\a01_basic\\a17_memberDetail.jsp";
	}
	
	@RequestMapping("memberRegister1.do")
	public String memberRegister(@RequestParam(value="id", defaultValue="") String id) {
		System.out.println("등록할 ID : " + id);
		System.out.println("등록 처리 (forward)");
		return "forward:/memberDetail.do";
	}
	
	@RequestMapping("memberDelete1.do")
	public String memberDelete(@RequestParam(value="id", defaultValue="") String id) {
		System.out.println("삭제할 ID : " + id);
		System.out.println("삭제 처리 (redirect)");
		return "redirect:/memberList.do";
	}
	
}