package springweb.a05_mvc.a02_service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import springweb.z01_vo.Mail;

@Service
public class A07_MailService {

	// 컨테이너에 등록한 클래스의 상위 객체
	@Autowired
	private JavaMailSender sender;
	
	public void sendMail(Mail mail) {
		// 1. 멀티미디어형(파일/동영상등) 메일 데이터 전송 객체 생성
		MimeMessage msg = sender.createMimeMessage();
		// 2. 제목 설정
		try {
			msg.setSubject(mail.getSubject());
			// 3. 수신자 설정
			msg.setRecipient(RecipientType.TO, new InternetAddress(mail.getReceiver()));
			System.out.println("수신자 : " + mail.getReceiver());
			System.out.println("======================================== [Serv] 수신자 입력 완료 ========================================");
			// 4. 내용 설정
			msg.setText(mail.getContent());
			System.out.println("내용 : " + mail.getContent());
			System.out.println("======================================== [Serv] 내용 입력 완료 ========================================");
			// 5. 발송 처리
			sender.send(msg);
			System.out.println("======================================== [Serv] 메일 발송 ========================================");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("메일 발송 예외 : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("기타 예외 : " + e.getMessage());
		}
	}
	
}
