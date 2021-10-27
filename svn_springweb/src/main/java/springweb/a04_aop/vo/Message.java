package springweb.a04_aop.vo;

import org.springframework.beans.factory.annotation.Autowired;
// springweb.a04_aop.vo.Message
public class Message {
	@Autowired(required = false)
	private String name;
	
	public void helloApp() {
		
		// 5초 정도 수행 처리하게끔 Thread로 처리..
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("안녕하세요!!"+name+"님!!!");
	}
	public void helloApp2() {
		
		// 5초 정도 수행 처리하게끔 Thread로 처리..
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("반갑습니다.!!"+name+"님!!!");
	}	
}
