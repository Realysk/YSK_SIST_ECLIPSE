package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

// 컨테이너에 포함 시킬 controller
// springweb.a01_basic.A01_StartCtrl

@Controller
public class A01_StartCtrl {
	
	
	// http://localhost:7080/springweb/start.do
	// 미자막 XXXMapping("url주소")
	@GetMapping("start.do")
	public String start(Model d) {
		// 모델 데이터 선언
		d.addAttribute("start", "첫번째 스프링!!");
		// view단 호출
		return "WEB-INF\\views\\a01_start.jsp"; // forward 방식 default
	}
	// ex)  A02_SecondCtrl.java   
	//    http://localhost:7080/springweb/second.do
	//       두번째 스프링!! 친숙합니까??를 출력처리
	// 		 "WEB-INF\\views\\a02_scond.jsp";  4조..
	/*
	public ModelAndView call() {
		
		return new ModelAndView();
	}
	*/
}
