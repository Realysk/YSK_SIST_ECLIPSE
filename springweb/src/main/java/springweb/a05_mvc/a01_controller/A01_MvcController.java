package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A01_MvcService;
import springweb.z01_vo.Student;

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
	// http://localhost:7080/springweb/studFrm.do
	@RequestMapping("studFrm.do")
	public String studFrm() {
		return "WEB-INF\\views\\a05_mvc\\a06_studentAjax.jsp";
	}
	
	// http://localhost:7080/springweb/addStudentInfo.do	
	@RequestMapping("addStudentInfo.do")
	public String addStudentInfo(Student student) { 
		// 객체는 기본 type으로 모델 attribute가 설정이 된다.
		return "pageJsonReport";
	}
	
}