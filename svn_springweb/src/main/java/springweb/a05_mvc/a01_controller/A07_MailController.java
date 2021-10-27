package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A07_MailService;
import springweb.z01_vo.Mail;

@Controller
public class A07_MailController {
	
	@Autowired
	private A07_MailService service;
	// http://localhost:7080/springweb/mailForm.do

	@RequestMapping("mailForm.do")
	public String mailForm(){
		
		return "WEB-INF\\views\\a05_mvc\\a30_mail.jsp";
	}
	// mailSend.do
	@RequestMapping("mailSend.do")
	public String mailSend(Mail mail, Model d){
		// info 부분에 구글계정 mail_user/mail_pass
		d.addAttribute("result", service.sendMail(mail));
		return "WEB-INF\\views\\a05_mvc\\a30_mail.jsp";
	}	
}
