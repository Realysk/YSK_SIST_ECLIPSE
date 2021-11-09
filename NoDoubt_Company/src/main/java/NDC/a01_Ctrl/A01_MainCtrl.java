package NDC.a01_Ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import NDC.a02_Serv.A01_MainServ;

@Controller
@RequestMapping("main.do")
public class A01_MainCtrl {
	
	@Autowired
	private A01_MainServ service;
	
	// http://localhost:7080/NoDoubt_Company/main.do
	public String Main(Model d) {
		
		d.addAttribute("mainMsg", service.Main());
		
		System.out.println("출력 : " + service.Main());
		
		return "Main/index";
	}
}
