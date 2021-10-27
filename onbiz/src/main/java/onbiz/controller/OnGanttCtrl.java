package onbiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import onbiz.service.OnGanttService;
import onbiz.service.OnTaskService;
import onbiz.vo.OnEmp;
import onbiz.vo.OnTask_Project;

@Controller
@SessionAttributes("login")
@RequestMapping("ongantt.do")
public class OnGanttCtrl {
	@Autowired
	private OnGanttService service;
	@Autowired
	private OnTaskService taskService;
	private String sessionEmpNo; 

	@ModelAttribute("login")
	public OnEmp getOnEmp() {
		return new OnEmp();
	}	
	
	// [간트차트] 작업할당 - 초기화면
	// http://localhost:7080/onbiz/ongantt.do?method=gantt	
	// http://localhost:7080/onbiz/login.do
	@RequestMapping(params="method=gantt")
	public String ganttView(@ModelAttribute("login") OnEmp login, Model m) {
		
		System.out.println("# 사원번호 :"+login.getEmp_no());
		sessionEmpNo = login.getEmp_no();
		
		m.addAttribute("proList", service.myProList(new OnTask_Project(sessionEmpNo)));
		return "OnTask/MTA001-ganttChart2";
		
	}
	
	// [간트차트] 작업할당 - 간트차트 리스트 조회
	// http://localhost:7080/onbiz/ontask.do?method=gatlist
	@RequestMapping(params="method=gatlist")
	public String ganttList(Model m, OnTask_Project op) {
		System.out.println("===<간트차트 리스트 조회>===");
		System.out.println("pro_no 넘어오는 값 : " + op.getPro_no());
		m.addAttribute("tasks", service.ganttList(op));
		m.addAttribute("proDur", taskService.myProDuration(op.getPro_no()));
		return "pageJsonReport";
	}

	//[간트차트] 작업할당 - 멤버리스트
	@RequestMapping(params="method=userList")
	public String userList(Model m, OnTask_Project op) {
		System.out.println("===<멤버 리스트 조회>===");
		m.addAttribute("userList", service.userList(op));
		return "pageJsonReport";
	}
	
	// [간트차트] 작업할당 - 작업 등록
	@RequestMapping(params="method=insertTask")
	public String insertTask(OnTask_Project op, Model m) {
		System.out.println(op);
		service.insertTask(op);
		m.addAttribute("tasks", service.ganttList(op));
		return "pageJsonReport";
	}
	
	// [간트차트] 작업할당 - 작업 수정
	@RequestMapping(params="method=updateTask")
	public String updateTask(OnTask_Project op, Model m) {
		service.updateTask(op);
		m.addAttribute("tasks", service.ganttList(op));
		return "pageJsonReport";
	}
	
	// [간트차트] 작업할당 - 작업 삭제
	@RequestMapping(params="method=deleteTask")
	public String deleteTask(OnTask_Project op, Model m) {
		service.deleteTask(op);
		m.addAttribute("tasks", service.ganttList(op));
		return "pageJsonReport";
	}
}
