package onbiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onbiz.service.OnEmpMailServ;
import onbiz.vo.OnEmpMail;

@Controller
public class OnEmpMailCtrl {
	 @Autowired
	   private OnEmpMailServ service;
	   
	   
	   // http://localhost:7080/onbiz/mailForm.do

	   @RequestMapping("mailForm.do")
	   public String mailForm(){
	      
	      return "OnEmp/HR_EMP_02";
	   } 
	   
	   
	   // http://localhost:7080/onbiz/mailSend.do
	   @RequestMapping("mailSend.do")
	   public String mailSend(OnEmpMail mail, Model d){
	      // info 부분에 구글계정 mail_user/mail_pass
	      d.addAttribute("result",service.sendMail(mail));
	      return "OnEmp/HR_EMP_02"; 
	   }   
 // 컨트롤러의 result랑 메일 보내는 화면 나누기. 발송을 누르면 호출하는 형식으로 변경, 내용물 LUX의 카드형태로 변경하기
}
