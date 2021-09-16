package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A03_DeptService;
import springweb.z01_vo.Dept;

@Controller
public class A03_DeptController {
	@Autowired
	private A03_DeptService service;
	// http://localhost:7080/springweb/deptList.do
	@RequestMapping("deptList.do")
	public String mvc01(Dept sch, Model d) {
		d.addAttribute("deptList", service.dlist());
		return "WEB-INF\\views\\a05_mvc\\a03_deptList.jsp";
	}
}