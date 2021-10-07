package springweb.a05_mvc.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springweb.a05_mvc.a02_service.A05_CalendarService;
import springweb.z01_vo.Calendar;

@Controller
public class A06_CalendarController {
	@Autowired
	private A05_CalendarService service;
	// http://localhost:7080/springweb/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a05_mvc\\a20_calendar.jsp";
	}

	// calendarInsert.do
	
	
}
