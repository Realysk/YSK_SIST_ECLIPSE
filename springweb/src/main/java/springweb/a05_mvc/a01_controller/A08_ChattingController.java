package springweb.a05_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A08_ChattingController {

	// http://localhost:7080/springweb/chatting.do
	@RequestMapping("chatting.do")
	public String chatting() {
		return "WEB-INF\\views\\a05_mvc\\a31_chatting.jsp";
	}
	
}
