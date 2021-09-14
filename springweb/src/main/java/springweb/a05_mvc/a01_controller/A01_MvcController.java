package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.a05_mvc.a02_service.A01_MvcService;

@Controller
public class A01_MvcController {
	// 컨테이너의 객체끼리 자동 메모리 할당으로 처리한다.
	@Autowired
	private A01_MvcService service;
	// http://localhost:7080/springweb/mvc01.do
	@GetMapping("mvc01.do")
	public String mvc01(Model d) {
		d.addAttribute("serviceMsg", service.call());
		return "WEB-INF\\views\\a05_mvc\\a01_mvc.jsp";
	}
}