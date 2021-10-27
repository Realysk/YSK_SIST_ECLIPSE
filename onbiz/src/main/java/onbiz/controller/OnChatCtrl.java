package onbiz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import onbiz.vo.OnEmp;

@Controller
@SessionAttributes("login")
public class OnChatCtrl {
	
	// 로그인값 호출
	@ModelAttribute("login")
	public OnEmp getOnEmp() {
		return new OnEmp();
	}		
	
	// http://localhost:7080/onbiz/onchatting.do
	@RequestMapping("onchatting.do")
	public String onchatting(@ModelAttribute("login") OnEmp login) {
		return "OnBoard/Chat/TM_PM_CH-001";
	}
	
}
