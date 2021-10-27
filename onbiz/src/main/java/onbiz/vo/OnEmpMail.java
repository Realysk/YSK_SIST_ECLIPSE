package onbiz.vo;

public class OnEmpMail {
	private String receiver;
	private String subject;
	private String content;
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public OnEmpMail(String receiver, String subject, String content) {
		super();
		this.receiver = receiver;
		this.subject = subject;
		this.content = content;
	}
}
