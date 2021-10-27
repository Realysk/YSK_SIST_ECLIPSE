package springweb.a04_aop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import springweb.a04_aop.vo.Message;

public class A01_AOP {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// xml 파일을 읽어 들여 스프링 컨테이너를 생성.
		AbstractApplicationContext ctx = 
				new ClassPathXmlApplicationContext("springweb\\a04_aop\\a01_AOP.xml");
		// JVM 종료될 때, ApplicationContext를 종료하는 작업
		ctx.registerShutdownHook();
		// 특정한 bean 클래스 호출..
		Message msg = (Message)ctx.getBean("proxy");
		msg.helloApp();
		msg.helloApp2();
		
		// 어플리케이션 종료시 컨테이너에 존재하는 모든 빈 종료 처리.
		ctx.close();
		
	}

}




