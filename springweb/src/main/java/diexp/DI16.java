package diexp;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Mart;
import diexp.vo.Person;

public class DI16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\a16.xml");
		Mart mt = ctx1.getBean("mt", Mart.class);
		mt.show();
		ctx1.close();
		// ex) DI17.java, a17.xml 만들고 ShoppingMall.java, Member.java 1:1 연관관계 설정 후 호출하여 출력하세요.
		
		AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(Con10.class);
		Person p01 = ctx2.getBean("getPerson", Person.class);
		System.out.println("이름 : " + p01.getName());
		ctx2.close();
		
	}

}
