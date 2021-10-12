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
	public String mailForm() {
		System.out.println("======================================== [Ctrl] 메일 전송 Form 이동 ========================================");
		return "WEB-INF\\views\\a05_mvc\\a30_mail.jsp";
	}
	
	// http://localhost:7080/springweb/mailSend.do
	@RequestMapping("mailSend.do")
	public String mailSend(Mail mail, Model d) {
		service.sendMail(mail);
		d.addAttribute("result", "메일 전송 완료");
		// info 부분에 구글계정 mail_user/mail_pass 등록
		System.out.println("======================================== [Ctrl] 메일 전송 완료 ========================================");
		return "WEB-INF\\views\\a05_mvc\\a30_mail.jsp";
	}	
	
}