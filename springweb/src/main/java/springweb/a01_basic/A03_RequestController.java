package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
// springweb.a01_basic.A03_RequestController
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.z01_vo.Person;
@Controller
public class A03_RequestController {

	// http://localhost:7080/springweb/requestexp01.do?name=사과&price=3000&cnt=2
	@RequestMapping("requestexp01.do")
	public String requestexp01(
								@RequestParam(value = "name",  
									defaultValue = "입력없음",
									required = false) String name,
								@RequestParam(value = "price",
										defaultValue = "1",	
										required = true) int price, 
								@RequestParam("cnt") int cnt, 
								Model d) {
		/*
		매개변수에 대한 option 설정 
			value : 요청key에 대한 설정.
			defualtValue : default 요청 key를 설정. 
			required : 필수 여부에 대한 설정..default가 required=true이다.
				요청값이 있을 때, 해당 기능메서드를 호출이 된다.
			==> 요청값이 없더라도 호출되어 처리가 가능하게 해준다.

			
		 * */
		
		System.out.println("요청값의 이름:"+name);
		System.out.println("요청값의 가격:"+price);
		System.out.println("요청값의 갯수:"+cnt);
		d.addAttribute("greet", "안녕하세요! 요청값 연습!");
		d.addAttribute("tot", price*cnt);
		return "WEB-INF\\views\\a01_basic\\a01_request.jsp";
		// 스프링은 return을 통한 view출력과 함께 forward형식으로
		// 전달하기에 요청값과 model데이터를 전달할 수 있다.
	}
	/*
	# 스프링의 요청값 처리 형식
	1. 변수로 설정
		@RequestParam("요청key") Stirng 요청key를 할당할변수
		@RequestParam("요청key") int 요청key를 할당할변수
		매개변수로 @RequestParam을 쓰면 반드시 요청값이 해당 갯수와 동일한 type
		으로 있어야 한다. 
		
	2. 변수로 설정하되 default값 설정
		매개변수에 대한 option 설정 
			value : 요청key에 대한 설정.
			defualtValue : default 요청 key를 설정.
			required : 필수 여부에 대한 설정..
			==> 요청값이 없더라도 호출되어 처리가 가능하게 해준다.
	3. bean과 같이 객체로 요청값을 property로 가져오기..
	 * */
	// ex)
	// http://localhost:7080/springweb/requestexp02.do
	//        ?bname=자바시작&publisher=자바나라&pay=33000
	// 처리되고  화면에 출력은 도서명 : @@@ 출판사 : @@@@
	//                    도서정보 : 도서명(33000) ==> 모델 로 처리되게 하세요
	//    5조..
	// http://localhost:7080/springweb/requestexp02.do?bname=자바시작&publisher=자바나라&pay=33000
	@RequestMapping("requestexp02.do")
	public String requestexp02(@RequestParam("bname") String bname,
	                        @RequestParam("publisher") String publisher,
	                        @RequestParam("pay") int pay,
	                           Model d) {
	      System.out.println("요청값의 이름:"+bname);
	      System.out.println("요청값의 가격:"+publisher);
	      System.out.println("요청값의 갯수:"+pay);
	      d.addAttribute("bkInfo", bname+"("+pay+")");
	      return "WEB-INF\\views\\a01_basic\\a02_request.jsp";
	}
	/*
	ex) 
	http://localhost:7080/springweb/requestexp03.do?pay=5000
	==> 영화제목:없음, 관객수:1,  총비용 5000
	http://localhost:7080/springweb/requestexp03.do?name=영화1&cnt=5&pay=5000
	==> 영화제목:영화1, 관객수:5, 총비용 25000 */
	@RequestMapping("requestexp03.do" )
	public String requestexp03(
			@RequestParam(value = "name",defaultValue = "없음") String name,
			@RequestParam(value = "cnt",defaultValue = "1") int cnt,
			@RequestParam(value = "pay") int pay,
			Model d) {
			d.addAttribute("name", name);
			d.addAttribute("cnt", cnt);
			d.addAttribute("pay", pay);
			d.addAttribute("tot", cnt*pay);
		return "WEB-INF\\views\\a01_basic\\a03_request.jsp";
	}
	//hint) 화면에 param.@@@로 하지 말고, 모두 다 모델 데이터로 처리하세요 1조	
/*
	http://localhost:7080/springweb/requestexp04.do
	==> 이름:익명, 나이:0, 사는곳:입력필요
	http://localhost:7080/springweb/requestexp04.do?name=홍길동&age=25&loc=서울신림동
	==> 이름:홍길동, 나이:25, 사는곳:서울신림동
 * */	
	@RequestMapping("requestexp04.do")
	public String requestexp04(
			@RequestParam(value="name", defaultValue="익명") String name,
			@RequestParam(value="age", defaultValue="0") int age,
			@RequestParam(value="loc", defaultValue="입력필요") String loc,
			Model d
			) {
		d.addAttribute("name", name);
		d.addAttribute("age", age);
		d.addAttribute("loc", loc);
		return "a00_exp\\0906.jsp";
	}
/*
# get방식/post방식으로 요청값 받아서 처리하기.
	RequestMapping : get/post방식 둘다 처리할 수 있다. 요청값 데이터 유형이 맞을 때..
 * */	
	// 명시적으로 get방식으로 받을 때, 처리한다.
	// http://localhost:7080/springweb/requestexp05.do?name=홍길동
	@GetMapping("requestexp05.do")
	public String requestexp05(@RequestParam("name") String name) {
		return "WEB-INF\\views\\a01_basic\\a05_request.jsp";
	}
	// 명시적으로 post방식으로 받을 때, 처리한다.
	@PostMapping("requestexp06.do")
	public String requestexp06(@RequestParam("name") String name){
		return "WEB-INF\\views\\a01_basic\\a06_request.jsp";
	}
	
// ex) requestexp07.do로 get 방식으로 초기화면 	a07_request.jsp  출력한 후,) 
// a07_request.jsp에서 선택(get/post)을 post방식일 경우, a08_request.jsp로 호출되게 하세요
// 요청값은 greet로 처리.. 3조
//	http://localhost:7080/springweb/requestexp07.do
/*
	1. 요청화면 호출은 RequestMapping로는 get/post방식 둘다 처리가 가능하지만,
		메서드로 중복하여 선언이 불가능하다. 단, get/post방식을 명시적으로 했을 때만 가능하다.
 * */	
	
	@GetMapping("requestexp07.do")
	public String requestexp07(@RequestParam(value = "greet", defaultValue = "") String greet) {
		// 요청값이 있어야 호출이 되지만, defaultValue를 선언하면 가능하다..
		return "WEB-INF\\views\\a01_basic\\a07_request.jsp";
	}
	@PostMapping("requestexp07.do")
	public String requestexp08(@RequestParam(value = "greet", defaultValue = "") String greet) {
		return "WEB-INF\\views\\a01_basic\\a08_request.jsp";
	}
	
	// useBean과 같이 요청 객체를 선언해놓으면 요청값이 property와 동일하면 할당이 된다.
	//	http://localhost:7080/springweb/requestexp09.do
	@RequestMapping("requestexp09")
	public String requestexp09(Person p, Model d) {
		d.addAttribute("p01", p);
		return "WEB-INF\\views\\a01_basic\\a09_request.jsp";
	}
}
