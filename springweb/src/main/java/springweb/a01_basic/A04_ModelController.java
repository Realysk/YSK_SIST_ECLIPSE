package springweb.a01_basic;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import diexp.vo.Dept;
import springweb.z01_vo.Member;
import springweb.z01_vo.Person;
import springweb.z01_vo.Product;

@Controller
public class A04_ModelController {
/*
1. ModelAttribute
	1) 요청값과 모델데이터를 동시에 처리해준다.
	2) 컨트롤단에서 사용하는 공통 모델 데이터를 처리한다.
 * */	
	@ModelAttribute("dlist")
	public ArrayList<Dept> dlist(){ // ~12:07
		ArrayList<Dept> list = new ArrayList<Dept>();
		list.add(new Dept(10,"회계","강남"));
		list.add(new Dept(20,"인사","명동"));
		list.add(new Dept(30,"재무","역삼"));
		
		return list;
	}
	// // http://localhost:7080/springweb/modelAttr01.do	
	@RequestMapping("modelAttr01.do")
	public String modelAttr01(@ModelAttribute("p01") Person  p) {

		return "WEB-INF\\views\\a01_basic\\a10_model.jsp";
	}
	
	// modelAttr02.do 물건 정보를 요청해서 모델명 prod로 처리하게 하세요
	// http://localhost:7080/springweb/modelAttr02.do
	@RequestMapping("modelAttr02.do")
	public String modelAttr02(@ModelAttribute("prod") Product prod) {
		return "WEB-INF\\views\\a01_basic\\a11_model.jsp";
	}	
	
	// http://localhost:7080/springweb/memberReg.do
	@RequestMapping("memberReg.do")
	public String memberReg(@ModelAttribute("mem") Member m) {
		return "WEB-INF\\views\\a01_basic\\a11_modelAttr.jsp";
	}
	
	// ex) Member (id / pass) 입력된 ArrayList를 모델 어트리뷰트(3명)를 선언하고, 각 화면에서 select를 이용해서 출력하세요.
	
	@ModelAttribute("mlist")
	public List<Member> mlist() {
		List<Member> list = Arrays.asList(
							new Member("himan", "7777", "홍길동"),
							new Member("higirl", "8888", null),
							new Member("goodMan", "5555", "마길동")			
						);
		return list;
	}
}
