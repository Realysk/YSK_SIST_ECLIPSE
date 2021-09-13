package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Mart;
import diexp.vo.Note;
import diexp.vo.Person;

public class DI21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a21.xml");
		Person p01 = ctx1.getBean("p01", Person.class);
		System.out.println(p01.getName() + " : " + p01.getAge() + " : " + p01.getLoc());
		Person p02 = ctx1.getBean("p02", Person.class);
		System.out.println(p02.getName() + " : " + p02.getAge() + " : " + p02.getLoc());
		Person p03 = ctx1.getBean("p03", Person.class);
		System.out.println(p03.getName() + " : " + p03.getAge() + " : " + p03.getLoc());
		Mart mt = ctx1.getBean("mt", Mart.class);
		mt.show();
		System.out.println("## Autowiring 처리 ##");
		Note note = ctx1.getBean("note", Note.class);
		note.showMyNote();
		ctx1.close();
		
		
		AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(Con20.class);
		Person p04 = ctx2.getBean("getPerson", Person.class);
		System.out.println(p04.getName());
		ctx2.close();
		
	}

}
