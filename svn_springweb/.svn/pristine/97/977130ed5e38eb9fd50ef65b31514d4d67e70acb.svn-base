package diexp.di10;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Mart;

public class DI16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di10\\a16.xml");
		Mart mt = ctx1.getBean("mt", Mart.class);
		mt.show();
		Mart mt2 = ctx1.getBean("mt2", Mart.class);
		mt2.showAll();
		
		
		ctx1.close();
		// ex)  
		//   Mart와 Product를 1:다 관계로 설정하여 mt2를 만들고 출력처리하세요.
		//     호출하여 출력하세요.. 1조..


	}

}
