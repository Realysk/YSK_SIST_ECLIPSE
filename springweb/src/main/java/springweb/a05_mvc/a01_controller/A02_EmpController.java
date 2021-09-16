package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.a05_mvc.a02_service.A02_EmpService;

@Controller
public class A02_EmpController {
	// 컨테이너의 객체끼리 자동 메모리 할당으로 처리한다.
	@Autowired
	private A02_EmpService service;
	// http://localhost:7080/springweb/empList.do
	@GetMapping("empList.do")
	public String mvc01(Model d) {
		d.addAttribute("empList", service.getEmpList());
		return "WEB-INF\\views\\a05_mvc\\a02_empList.jsp";
	}
}
