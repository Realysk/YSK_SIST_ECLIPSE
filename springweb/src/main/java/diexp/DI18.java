package diexp;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Computer;
import diexp.vo.Note;

public class DI18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\a18.xml");
		Note nt01 = ctx1.getBean("note", Note.class);
		nt01.showMyNote();
		//System.out.println(obj2);
		Computer com = ctx1.getBean("com", Computer.class);
		com.showParts();
		
		
		
		ctx1.close();
		AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(Con18.class);
		Note nt02 = ctx2.getBean("getNote", Note.class);
		nt02.showMyNote();
		ctx2.close();
		
		

	}

}
