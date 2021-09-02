package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A02_SecondCtrl {
	// http://localhost:7080/springweb/second.do
	@GetMapping("second.do")
	public String second(Model d) {
		d.addAttribute("second", "두번째 스프링!! 친숙합니까??");
		return "WEB-INF\\views\\a02_scond.jsp";
	}

}
