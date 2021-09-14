package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo7.Mart;
import diexp.vo7.Product;

public class DI27 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ex) vo7 패키지에 Product, Mart 클래스를 선언학 개체를 로딩할 수 있도록 한다. a27.xml 컨테이너를 활용하세요.
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a27.xml");
		Product obj1 = ctx1.getBean("product", Product.class);
		Mart obj2 = ctx1.getBean("mart", Mart.class);
		
		obj1.setName("사과");
		obj1.setPrice(3000);;
		obj1.setCnt(0);
		obj2.setMname("행복마트");
		obj2.show();
		ctx1.close();

	}

}