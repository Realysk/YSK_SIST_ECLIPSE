package diexp.di10;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.ShoppingMall;

public class DI17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di10\\a17.xml");
		ShoppingMall shmall = ctx1.getBean("shmall", ShoppingMall.class);
		ShoppingMall shmall2 = ctx1.getBean("shmall2", ShoppingMall.class);
		shmall.showMember();
		shmall2.showAllMembers();
		
		
		
		
		ctx1.close();

		

	}

}
