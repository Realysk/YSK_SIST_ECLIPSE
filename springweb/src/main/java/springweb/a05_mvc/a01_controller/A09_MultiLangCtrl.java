package springweb.a05_mvc.a01_controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class A09_MultiLangCtrl {
	// http://localhost:7080/springweb/multi.do
	
	// 컨테이너에 선언된 객체..
	@Autowired(required = false)
	private LocaleResolver localResolver;
	
	
	@RequestMapping("/multi.do")
	public String multi() {
		return "WEB-INF\\views\\a05_mvc\\a32_multiLanguage.jsp";
	}
	@RequestMapping("/choiceLan.do")
	public String choice(@RequestParam("lang") String lang,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		// 해당되는 선택 언어가 message폴드 하위에 있는 다국어 선택 파일을 
		// 지정해서, 해당 위치/시간에 해당하는 언어가 나오게 된다.
		Locale locale = new Locale(lang);
		localResolver.setLocale(request,response, locale);
		return "WEB-INF\\views\\a05_mvc\\a32_multiLanguage.jsp";
	}	
	// http://localhost:7080/springweb/multi2.do
	@RequestMapping("/multi2.do")
	public String multi2(@RequestParam(value="lang",
							defaultValue = "ko") String lang,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		Locale locale = new Locale(lang);
		localResolver.setLocale(request,response, locale);
		return "WEB-INF\\views\\a05_mvc\\a32_multiLanguage.jsp";
	}	
}
