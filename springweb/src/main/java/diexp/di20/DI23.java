package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Computer;
import diexp.vo2.Person;

public class DI23 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a23.xml");
		Person person = ctx1.getBean("person", Person.class);
		System.out.println(person);
		person.showAutoExp();
		
		// ex) diexp.vo3 패키지 생성, Computer, Ram, Hdd, Cpu 복사하여 할당하고, Computer에 초기값을 설정하여 해당 객체를 호출하세요. (a23.xml에 패키지 선언 처리)
		Computer com = ctx1.getBean("com", Computer.class);
		System.out.println(com);
		com.showParts();
		
		ctx1.close();
		
	}

}
