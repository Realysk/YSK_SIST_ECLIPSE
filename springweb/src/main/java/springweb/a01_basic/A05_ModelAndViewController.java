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
	
	// http://localhost:7080/springweb/memberReg.do
	@RequestMapping("memberReg4.do")
	public String memberReg(@ModelAttribute("mem") Member m) {
		return "WEB-INF\\views\\a01_basic\\a11_modelAttr.jsp";
	}
	
}