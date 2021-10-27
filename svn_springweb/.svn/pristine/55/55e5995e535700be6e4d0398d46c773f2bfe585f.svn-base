package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo4.Person;
import diexp.vo4.Product;

public class DI24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a24.xml");
		// 한번에 객체로 로딩되는데, id값을 클래스명의 소문자가 id명을 default 설정이 된다..
		Person obj1 = ctx1.getBean("person", Person.class);
		Product obj2 = ctx1.getBean("product", Product.class);
		System.out.println(obj1);
		System.out.println(obj2);
		obj1.setName("홍길동");
		obj2.setName("사과");
		System.out.println("이름:"+obj1.getName());
		System.out.println("물건명:"+obj2.getName());
		ctx1.close();

	}

}
