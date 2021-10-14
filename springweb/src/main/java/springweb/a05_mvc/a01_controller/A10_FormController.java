package springweb.a05_mvc.a01_controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.z04_vo.FormCommand;
import springweb.a05_mvc.z04_vo.Code;

@Controller
@RequestMapping("/form.do")
public class A10_FormController {

	@ModelAttribute("formCommand")
	public FormCommand createCommand() {
		return new FormCommand();
	}
	// http://localhost:7080/springweb/form.do
	@GetMapping
	public String form(Model model,FormCommand formCmd) {
		// select 선택 옵션을 선언할 수 있게 처리
		formCmd.setLoginType(new String[]{"기업회원","일반회원"});
		//formCmd.setLoginType("기업회원");
		List<String> loginTypes = new ArrayList<String>();
		loginTypes.add("일반회원");
		loginTypes.add("기업회원");
		loginTypes.add("헤드헌터회원");
		model.addAttribute("loginTypes", loginTypes);
		
		List<Code> jobCodes = Arrays.asList(
				new Code("01", "프로그래머"),
				new Code("02", "디자이너"));
		model.addAttribute("jobCodes", jobCodes);
		
		model.addAttribute("favoriteOsNames", new String[] {"Window 8", "Window 10", "Mac OS", "Linux"});
		model.addAttribute("favoriteOsCodes", Arrays.asList(
				new Code("01", "Window 8"),
				new Code("02", "Window 10"),
				new Code("03", "Mac OS"),
				new Code("04", "Linux")
				));
		
		return "WEB-INF\\views\\a05_mvc\\a11_form.jsp";
	}
	@PostMapping
	public String form2(Model model,FormCommand formCmd) {
		List<String> loginTypes = new ArrayList<String>();
		loginTypes.add("일반회원");
		loginTypes.add("기업회원");
		loginTypes.add("헤드헌터회원");
		model.addAttribute("loginTypes", loginTypes);
		
		List<Code> jobCodes = Arrays.asList(
				new Code("01", "프로그래머"),
				new Code("02", "디자이너"));
		model.addAttribute("jobCodes", jobCodes);
		
		model.addAttribute("favoriteOsNames", new String[] {"윈도우8", "윈도우10", "맥OS"});
		model.addAttribute("favoriteOsCodes", Arrays.asList(
				new Code("01", "윈도우8"),
				new Code("02", "윈도우10")));
		return "WEB-INF\\views\\a05_mvc\\a11_form.jsp";
	}	
}
