package onbiz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {

	// http://localhost:7080/onbiz/view.do
	@RequestMapping("view.do")
	public String getView() {
		return "main";
	}
}
