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
	
}