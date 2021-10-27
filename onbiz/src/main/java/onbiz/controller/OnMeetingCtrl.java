package onbiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import onbiz.service.OnApprovalServ;
import onbiz.vo.OnApprovalView;

@Controller
//@RequestMapping("onmeeting.do")
public class OnMeetingCtrl {
	
	// http://localhost:7080/onbiz/onmeeting.do
	@RequestMapping("onmeeting.do")
	public String mtnList() {
		System.out.println("======================================== [Ctrl] 회의록 목록 이동 ========================================");
		return "OnBoard/mtnBoard/TM_PM_MD-001";
	}
	
}
