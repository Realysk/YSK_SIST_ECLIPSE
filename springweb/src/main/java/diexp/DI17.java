package diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Mart;
import diexp.vo.ShoppingMall;

public class DI17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// ex) DI17.java, a17.xml 만들고 ShoppingMall.java, Member.java 1:1 연관관계 설정 후 호출하여 출력하세요.
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("diexp\\a17.xml");
		ShoppingMall mall = ctx.getBean("mall", ShoppingMall.class);
		mall.show();
		ctx.close();
		
	}

}
