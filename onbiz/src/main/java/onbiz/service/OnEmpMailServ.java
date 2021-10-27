package onbiz.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import onbiz.vo.OnEmpMail;

@Service
public class OnEmpMailServ {
	@Autowired
	private JavaMailSender sender;

	public String sendMail(OnEmpMail mail) {
		String result = "발송 성공";
		// 1. 멀티미디어형(파일/동영상등) 메일데이터 전송 객체 생성.
		MimeMessage msg = sender.createMimeMessage();
		System.out.println("##메일 발송##");
		System.out.println(mail.getSubject());
		System.out.println(mail.getReceiver());
		System.out.println(mail.getContent());
		System.out.println("##메일 발송##");
		
		
		// 2. 제목설정.
		try {
			msg.setSubject(mail.getSubject());
			// 3. 수신자 설정
			msg.setRecipient(RecipientType.TO, new InternetAddress(mail.getReceiver()));
			// 4. 내용 설정.
			msg.setText(mail.getContent());

			// 5. 발송 처리.
			sender.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("메일 발송 예외:" + e.getMessage());
			result = "메일 발송 예외:" + e.getMessage();
		} catch (Exception e) {
			System.out.println("기타 예외:" + e.getMessage());
			result = "기타 예외:" + e.getMessage();
		}

		return result;

	}

}
