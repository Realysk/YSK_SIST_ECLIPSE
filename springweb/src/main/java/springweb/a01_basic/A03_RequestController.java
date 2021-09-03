package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// springweb.a01_basic.A03_RequestController

@Controller
public class A03_RequestController {

	// http://localhost:7080/springweb/requestexp01.do?name=사과&price=3000&cnt=2
	@RequestMapping("requestexp01.do")
	public String requestexp01(
								@RequestParam(value = "name", defaultValue = "입력없음", required = false) String name, 
								@RequestParam(value = "price", required = true) int price, 
								@RequestParam("cnt") int cnt, Model d) {
		
		/*
		 매개변수에 대한 option 설정
			 value : 요청key에 대한 설정
			 defaultValue : default 요청key를 설정
			 required : 필수 여부에 대한 설정
			=> 요청값이 없더라도 호출되어 처리가 가능하게 해준다.
		 */
		
		System.out.println("요청값의 이름 : " + name);
		System.out.println("요청값의 가격 : " + price);
		System.out.println("요청값의 수량 : " + cnt);
		d.addAttribute("greet", "안녕하세요! 요청값 연습!");
		d.addAttribute("tot", price*cnt);
		return "WEB-INF\\views\\a01_basic\\a01_request.jsp";
		// 스프링은 return을 통한 view 출력과 함께 forward 형식으로 전달하기에 요청값과 model 데이터를 전달할 수 있다.
	}
	
	/*
	 # 스프링의 요청값 처리 방식
	 	1. 변수로 설정
	 		@RequestParam("요청key") String 요청key를 할당할 변수
	 		@RequestParam("요청key") int 요청key를 할당할 변수
	 		매개변수로 @RequestParam을 쓰면 반드시 요청값이 해당 갯수와 동일한 type으로 있어야 한다.
	 		
	 	2. 변수로 설정하되 default값 설정
			 매개변수에 대한 option 설정
				 value : 요청key에 대한 설정
				 defaultValue : default 요청key를 설정
				 required : 필수 여부에 대한 설정
				=> 요청값이 없더라도 호출되어 처리가 가능하게 해준다.	 	
	 	
	 	3. bean과 같이 객체로 요청값을 property로 가져오기
	 */
	
	/*
	 	ex) http://localhost:7080/springweb/requestexp02.do?bname=자바시작&publisher=자바나라&pay=33000
	 	처리되고 화면에 출력은 
	 		도서명 : @@@ 
	 		출판사 : @@@@ 
	 		도서정보 : 도서명(33000) => Model로 처리되게 하세요.
	 */
	@RequestMapping("requestexp02.do")
	public String requestexp02(@RequestParam("bname") String bname, @RequestParam("publisher") String publisher, @RequestParam("pay") int pay, Model d) {
		System.out.println("도서명 : " + bname);
		System.out.println("출판사 : " + publisher);
		System.out.println("도서정보 : " + bname + " (" + pay + ")");
		d.addAttribute("bkinfo", bname +" (" + pay + ")");
		return "WEB-INF\\views\\a01_basic\\a02_request.jsp";
	}
	
	/*
	 	ex) http://localhost:7080/springweb/requestexp03.do?pay=5000
			=> 영화제목:없음, 관객수:1, 총비용 50000가 출력
			http://localhost:7080/springweb/requestexp03.do?name=영화1&cnt=5&pay=5000
			=> 영화제목:영화1, 관객수:5, 총비용 50000가 출력
		기본 주소로 아래로 입력이 된 내용을 출력이 되고 총계가 출력이 되고 위 주소로 입력이 되더라도 영화제목없음, 관객수1로 총비용 @@@가 출력되게 하세요.
		hint) 화면에 param.@@@로 하지 말고 모두 다 모델 데이터로 처리하세요.
	 */
	@RequestMapping("requestexp03.do")
	public String requestexp03(
								@RequestParam(value = "name", defaultValue = "없음") String name,
								@RequestParam(value = "cnt", defaultValue = "1") int cnt,
								@RequestParam(value = "pay") int pay, Model d) {
		d.addAttribute("name", name);
		d.addAttribute("cnt", cnt);
		d.addAttribute("pay", pay);
		d.addAttribute("tot", pay*cnt);
		
		return "WEB-INF\\views\\a01_basic\\a03_request.jsp";
		
	}
	
	

}
