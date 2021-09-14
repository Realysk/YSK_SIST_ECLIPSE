package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Person;
import springweb.z01_vo.Product;


@Controller
public class A04_ModelController {
/*
	1. ModelAttribute
	 	1) 요청값과 모델데이터를 동시에 처리해준다.
	 	2) 컨트롤단에서 사용하는 공통 모델 데이터를 처리한다.
 */
	
	// http://localhost:7080/springweb/modelAttr01.do
	
	@RequestMapping("modelAttr01.do")
	public String modelAttr01(@ModelAttribute("p01") Person p) {
		return "WEB-INF\\views\\a01_basic\\a10_model.jsp";
	}
	
	// modelAttr02.do 물건 정보를 요청해서 모델명 prod로 처리하게 하세요

	// http://localhost:7080/springweb/modelAttr02.do
	
	@RequestMapping("modelAttr02.do")
	public String modelAttr02(@ModelAttribute("prod") Product prod) {
		return "WEB-INF\\views\\a01_basic\\a11_model.jsp";
	}
}