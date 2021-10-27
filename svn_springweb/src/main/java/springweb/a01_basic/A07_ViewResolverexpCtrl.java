package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import diexp.vo.Person;
import springweb.z01_vo.Product;

@Controller
public class A07_ViewResolverexpCtrl {

	// http://localhost:7080/springweb/jspCall.do	
	@RequestMapping("jspCall.do")
	public String list() {
		System.out.println("기본 jsp호출");
		return "WEB-INF\\views\\a01_basic\\a18_call.jsp";
	}
	// http://localhost:7080/springweb/jsonCall.do
	@RequestMapping("jsonCall.do")
	public String jsonCall(Model d) {
		System.out.println("기본 pageJsonReport호출");
		d.addAttribute("p01", new Person("홍길동",25,"서울"));
		return "pageJsonReport"; // 컨테이너에 지정한 뷰를 이용하여,
		// 뷰를 처리할 때 사용된다. 
	}	
	// ex) http://localhost:7080/springweb/jsonCall2.do
	//      Product 객체를 활용하여 사과 3000 2 json뷰로 
	//      화면에 출력하게 하세요..  4조
	@RequestMapping("jsonCall2.do")
	public String jsonCall2(Model d) {
		d.addAttribute("prod", new Product("사과",3000,2));
		return "pageJsonReport";
	}
	
	
}
