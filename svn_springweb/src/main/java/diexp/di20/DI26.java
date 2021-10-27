package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo6.*;

public class DI26 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = 
				new GenericXmlApplicationContext("diexp\\di20\\a26.xml");
		// 한번에 객체로 로딩되는데, id값을 클래스명의 소문자가 id명을 default 설정이 된다..
		Note obj1 = ctx1.getBean("note", Note.class);
		// @Controller가 있는 클래스를 메모리에 로딩하여 객체를 활용할 수 있다.
		Pencil obj2 = ctx1.getBean("pencil", Pencil.class);
		obj1.setTitle("스프링 노트");
		obj2.setKind("HB연필");
		System.out.println(obj1);
		System.out.println(obj2);
		obj1.showMyNote(); // 연관관계가 설정이 되지 않음..autowiring되지 않음..
		ctx1.close();
		// ex) vo7 패키지에 Product, Mart 클래스를 선언하고, 객체를 로딩할 수 있도록 한다.
		//     a27.xml 컨테이너를 활용하세요.. 4조.. ~14:45

	}

}
