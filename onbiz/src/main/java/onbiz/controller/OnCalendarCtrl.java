package onbiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import onbiz.service.OnCalendarService;
import onbiz.vo.OnCalendar;
import onbiz.vo.OnEmp;

@Controller
@SessionAttributes("login")
@RequestMapping("oncal.do")
public class OnCalendarCtrl {
	
	@Autowired
	OnCalendarService service;
	private String sessionEmpNo; 

	// [일정관리] 일정조회 - 초기화면
	// http://localhost:7080/onbiz/oncal.do?method=calview
	@RequestMapping(params="method=calview")
	public String CalView() {
		return "OnCalendar/CAL001-calendar";
	}
	
	// [일정관리] 일정조회 - 리스트조회
	// http://localhost:7080/onbiz/oncal.do?method=calList
	@RequestMapping(params="method=calList")
	public String myCalList(@ModelAttribute("login") OnEmp login, Model m) {
		System.out.println("===<일정관리 초기화면>===");
		System.out.println("# 사원번호 :"+login.getEmp_no());
		sessionEmpNo = login.getEmp_no();
		m.addAttribute("myCalList", service.mycalList(sessionEmpNo));
		return "pageJsonReport";
	}
	
	// [일정관리] 일정등록
	@RequestMapping(params="method=calins")
	public String calInsert(OnCalendar oncal, Model m) {
		oncal.setEmp_no(sessionEmpNo);
		service.calInsert(oncal);
		m.addAttribute("myCalList", service.mycalList(sessionEmpNo));
		return "pageJsonReport";
	};
	
	// [일정관리] 일정수정
	@RequestMapping(params="method=calupt")
	public String calUpdate(OnCalendar oncal, Model m) {
		oncal.setEmp_no(sessionEmpNo);
		service.calUpdate(oncal);
		m.addAttribute("myCalList", service.mycalList(sessionEmpNo));
		return "pageJsonReport";
	};
	
	// [일정관리] 일정삭제
	@RequestMapping(params="method=caldel")
	public String calDelete(OnCalendar oncal, Model m) {
		oncal.setEmp_no(sessionEmpNo);
		service.calDelete(oncal);
		m.addAttribute("myCalList", service.mycalList(sessionEmpNo));
		return "pageJsonReport";
	};
	
	
}
