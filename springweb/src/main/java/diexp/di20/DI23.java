package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Person;

public class DI23 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a23.xml");
		Person person = ctx1.getBean("person", Person.class);
		System.out.println(person);
		ctx1.close();
		
		
		AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(Con20.class);
		Person p01 = ctx2.getBean("getPerson", Person.class);
		System.out.println(p01.getName());
		ctx2.close();
		
		

	}

}
