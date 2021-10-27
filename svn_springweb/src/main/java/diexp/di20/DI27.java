package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo7.Mart;
import diexp.vo7.Product;
import diexp.vo7.exp.Bus;
//import diexp.vo7.exp.Driver;
import diexp.vo7.exp.Driver;

public class DI27 {

	public static void main(String[] args) {
		AbstractApplicationContext ctx1= 
				new GenericXmlApplicationContext("diexp\\di20\\a27.xml");
		// 한번에 객체로 로딩되는데, id값을 클래스명의 소문자가 id명을 default 설정이 된다..
		Product obj1 = ctx1.getBean("product", Product.class);
		Mart obj2 = ctx1.getBean("mart", Mart.class);
		obj1.setName("사과");
		obj1.setPrice(3000);
		obj1.setCnt(2);
		obj2.setMname("행복마트");
		obj2.show();		
		Bus bus = ctx1.getBean("bus01", Bus.class);
		Driver driver = ctx1.getBean("driver01", Driver.class);
		driver.setName("마길동");
		driver.setRole("1급 기사");
		bus.setNumber("5050");
		bus.showBusInfo();
		

		ctx1.close();

	}

}
