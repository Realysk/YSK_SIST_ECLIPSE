package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo6.Note;
import diexp.vo6.Pencil;

public class DI26 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a26.xml");
		Note obj1 = ctx1.getBean("note", Note.class);
		// @Component("d01")로 각 객체의 id값을 찾아서 처리할 수 있다.
		Pencil obj2 = ctx1.getBean("pencil", Pencil.class);
		
		System.out.println(obj1);
		System.out.println(obj2);
		
		// ex) vo7 패키지에 Product, Mart 클래스를 선언학 개체를 로딩할 수 있도록 한다. a27.xml 컨테이너를 활용하세요.
		
		ctx1.close();

	}

}