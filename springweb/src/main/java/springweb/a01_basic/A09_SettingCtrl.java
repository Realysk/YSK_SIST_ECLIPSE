package springweb.a01_basic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Product;

@Controller
public class A09_SettingCtrl {
	
	// http://localhost:7080/springweb/setting03.do
	
	@Autowired
	private Product prod;
	@RequestMapping("setting03.do")
	public String setting03(Model d) {
		d.addAttribute("prod", prod);
		return "a00_exp\\0927.jsp";
	}

}
