package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import springweb.z01_vo.Member;
import springweb.z01_vo.Person;

@Controller
public class A05_ModelAndViewController {
/*
# ModelAndView
	1. 모델과 뷰를 같이 사용할 수 있는 객체를 말한다.
*/	
	// // http://localhost:7080/springweb/ModelAndView01.do	
	@RequestMapping("ModelAndView01.do")
	public ModelAndView modelAttr01() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WEB-INF\\views\\a01_basic\\a12_modelAndView.jsp"); // 화면단 선언
		mav.addObject("msg", "모델 호출");
		return mav;
	}
	
	
	// ex) http://localhost:7080/springweb/ModelAndView02.do 를 통해서 a13_ModelAndView.jsp를 처리하세요. 모델 데이터는 Person 객체의 이름 나이 거주지를 설정하세요.
	@RequestMapping("ModelAndView02.do")
	public ModelAndView modelAttr02() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WEB-INF\\views\\a01_basic\\a13_ModelAndView.jsp");
		mav.addObject("p01", new Person("홍길동", 25, "서울 방배동"));
		return mav;
	}
	
}