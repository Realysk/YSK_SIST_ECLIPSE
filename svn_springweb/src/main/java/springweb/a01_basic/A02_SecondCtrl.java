package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

// 컨테이너에 포함 시킬 controller
// springweb.a01_basic.A01_StartCtrl

@Controller
public class A02_SecondCtrl {
	// http://localhost:7080/springweb/second.do
	@GetMapping("second.do")
	public String start(Model d) {
		// 모델 데이터 선언
		d.addAttribute("second", "두번째 스프링!! 친숙합니까??");
		// view단 호출
		return "WEB-INF\\views\\a02_second.jsp";
	}
	// ex)  A02_SecondCtrl.java   
	//    http://localhost:7080/springweb/second.do
	//       두번째 스프링!! 친숙합니까??를 출력처리
	// 		 "WEB-INF\\views\\a02_scond.jsp";  4조..
	
}
