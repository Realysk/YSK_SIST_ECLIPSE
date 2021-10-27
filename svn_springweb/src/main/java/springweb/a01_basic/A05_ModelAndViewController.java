package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import springweb.z01_vo.Emp;
import springweb.z01_vo.Person;
import springweb.z01_vo.Product;

@Controller
public class A05_ModelAndViewController {
/*
# ModelAndView
1. 모델과 뷰를 같이 사용할 수 있는 객체를 말한다.

 * */	
	// // http://localhost:7080/springweb/modelAndView01.do	
	@RequestMapping("modelAndView01.do")
	public ModelAndView modelAttr01() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WEB-INF\\views\\a01_basic\\a12_modelAndView.jsp"); // 화면단 선언.
		mav.addObject("msg", "모델 호출!!");
		
		
		return mav;
	}	
	// ex) http://localhost:7080/springweb/modelAndView02.do
	//  를 통해서 a13_modelAndView.jsp를 처리하세요
	//  모델 데이터는 Person 객체의 이름 나이 사는 곳을 설정하세요.
	//  4조.
	@RequestMapping("modelAndView02.do")
	public ModelAndView memberReg() {
		ModelAndView mav = new ModelAndView(
				"WEB-INF\\views\\a01_basic\\a13_modelAndView.jsp");
		mav.addObject("p01", new Person("홍길동",25,"서울 방배동"));
		return mav;
	}
	
	// http://localhost:7080/springweb/callReqAndModelAndView.do
	@RequestMapping("callReqAndModelAndView.do")
	public ModelAndView call(@ModelAttribute("emp") Emp emp) {
		emp.setEname(emp.getEname()+"모델값 추가");
		ModelAndView mav = new ModelAndView(
				"WEB-INF\\views\\a01_basic\\a15_callReqAndModelAndView.jsp");
		mav.addObject("prod", new Product("사과",3000,2));
		return mav;
	}
	
}
