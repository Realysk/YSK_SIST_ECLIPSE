package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Mart;
import diexp.vo.Note;

public class DI22 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a22.xml");
		Mart mt1 = ctx1.getBean("mt1", Mart.class);
		mt1.show();
	    Note note1 = ctx1.getBean("note1", Note.class);
		note1.showMyNote();		
		ctx1.close();

		

	}

}
