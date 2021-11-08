package NDC.a01_Ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A01_Main {
	
	// http://localhost:7080/NoDoubt_Company/main.do
	@RequestMapping("main.do")
	public String Main() {
		
		return "Main/Main";
		
	}

}
