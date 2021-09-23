package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a05_mvc.a02_service.A03_DeptService;
import springweb.z01_vo.Dept;

@Controller
public class A03_DeptController {
	@Autowired
	private A03_DeptService service;
	// http://localhost:7080/springweb/deptList.do
	@RequestMapping("deptList.do")
	public String mvc01(Dept sch, Model d) {
		d.addAttribute("deptList", service.dlist(sch));
		return "WEB-INF\\views\\a05_mvc\\a03_deptList.jsp";
	}
/*
 	EX) 부서정보를 KEYUP으로 검색 처리. 5조
 	1) 초기화면 호출 http://localhost:7080/springweb/deptForm.do
 	   	a05_deptList.jsp
 	   	
 	   	WEB-INF\views\a05_mvc\a05_deptList.jsp
 	2) ajax 처리  http://localhost:7080/springweb/deptListAjax.do
 	3) 화면단 jquery Ajax 처리(a05_deptList.jsp)
 	  	
 * */	
	// http://localhost:7080/springweb/deptForm.do
	@RequestMapping("deptForm.do")
	public String deptForm() {
		return "WEB-INF\\views\\a05_mvc\\a05_deptList2.jsp";
	}	
	// http://localhost:7080/springweb/deptAjax.do
	@RequestMapping("deptAjax.do")
	public String deptAjax(Dept sch, Model d) {
		d.addAttribute("deptList", service.dlist(sch));
		return "pageJsonReport";
	}	
	@RequestMapping("deptInsert.do")
	public String deptInsert(Dept ins) {
		System.out.println("등록할 번호:"+ins.getDeptno());
		service.insertDept(ins);
		return "redirect:/deptList.do";
	}
	// deptUpdate.do deptDelete.do
	@RequestMapping("deptUpdate.do")
	public String deptUpdate(Dept upt) {
		System.out.println("수정할 번호:"+upt.getDeptno());
		service.updateDept(upt);
		return "redirect:/deptList.do";
	}	
	@RequestMapping("deptDelete.do")
	public String deptDelete(@RequestParam("deptno") int deptno) {
		System.out.println("삭제할 번호:"+deptno);
		service.deleteDept(deptno);;
		return "redirect:/deptList.do";
	}		
	
	
}
