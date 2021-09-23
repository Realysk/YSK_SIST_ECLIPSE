package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Person;
import springweb.z01_vo.Product;

@Controller
public class A07_ViewResolverexpCtrl {
	
	// http://localhost:7080/springweb/jspCall.do	
	@RequestMapping("jspCall.do")
	public String list() {
		System.out.println("기본 JSP 호출");
		return "WEB-INF\\views\\a01_basic\\a18_call.jsp";
	}
	
	// http://localhost:7080/springweb/jsonCall.do
	@RequestMapping("jsonCall.do")
	public String jsonCall(Model d) {
		System.out.println("기본 pageJsonReport 호출");
		d.addAttribute("p01", new Person("홍길동", 25, "서울"));
		return "pageJsonReport";
	}
	
	// ex) Product 객체를 활용하여 사과 3000 2 Json View로 화면에 출력하게 하세요.
	// http://localhost:7080/springweb/jsonCall2.do
	@RequestMapping("jsonCall2.do")
	public String jsonCall2(Model d) {
		System.out.println("물건 정보 호출");
		d.addAttribute("prod", new Product("사과", 3000, 2));
		return "pageJsonReport";
	}	
}