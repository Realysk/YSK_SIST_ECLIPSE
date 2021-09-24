package springweb.a01_basic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.z01_vo.Person;

@Controller
public class A08_SettingCtrl {
	
	// 환경 설정으로 설정된 내용 처리
	@Value("${upload1}")
	private String upload1;
	
	// http://localhost:7080/springweb/setting01.do
	@GetMapping("setting01.do")
	public String start(Model d) {
		// 모델 데이터 선언
		d.addAttribute("upload1", upload1);
		// view단 호출
		return "WEB-INF\\views\\a01_basic\\a19_setting.jsp"; // forward 방식 default
	}
	
	// ex) info 파일에 name, age, loc를 설정한 후 화면에 a20_setting.jsp에 출력하세요.
	
	@Value("${name}")
	private String name;
	@Value("${age}")
	private int age;
	@Value("${loc}")
	private String loc;
	// 컨테이너에 있는 객체를 autowiring 처리하여 사용
	@Autowired
	private Person person;
	// http://localhost:7080/springweb/setting02.do
	@GetMapping("setting02.do")
	public String start2(Model d) {
		// 모델 데이터 선언
		d.addAttribute("p01", new Person(name, age, loc));
		d.addAttribute("p02", person);
		// view단 호출
		return "WEB-INF\\views\\a01_basic\\a20_setting.jsp"; // forward 방식 default
	}
	
}