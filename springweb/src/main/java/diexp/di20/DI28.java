package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo8.*;
import diexp.vo9.Buyer;
import diexp.vo9.ZergUser;

public class DI28 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a28.xml");
		Product obj1 = ctx1.getBean("prod", Product.class);
		Person obj2 = ctx1.getBean("p01", Person.class);
		
		System.out.println(obj1);
		System.out.println(obj2);
		
		Buyer buyer = ctx1.getBean("buyer", Buyer.class);
		buyer.show();
		
		ZergUser user01 = ctx1.getBean("zergUser", ZergUser.class);
		user01.playGame();
		
		ctx1.close();

	}

}