package springweb.a05_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A06_CalendarController {
	
	// http://localhost:7080/springweb/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a05_mvc\\a20_calendar.jsp";
	}

}
