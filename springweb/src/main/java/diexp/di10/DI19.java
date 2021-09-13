package diexp.di10;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo.Bus;
import diexp.vo.FruitShop;
import diexp.vo.Monitor;
import diexp.vo.Person;
import diexp.vo.Sensor;

public class DI19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di10\\a19.xml");
		Sensor obj2 = ctx1.getBean("sensor1", Sensor.class);
		System.out.println(obj2); // 참조변수만 호출하면  toString()으로 정의된 내용 호출 처리..
		// ex) FruitShop : Set<String> 판매하는 과일들, Properties 과일/가격 설정된 내용, show() 해당정보 출력
		//     5조 
		FruitShop fruitshop1 = ctx1.getBean("fruitshop1", FruitShop.class);
		fruitshop1.show();
		
		
		Monitor m1 = ctx1.getBean("monitor",Monitor.class);
		System.out.println(m1);
		
		Bus bus = ctx1.getBean("bus",Bus.class);
		System.out.println(bus);
		ctx1.close();
		
		AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(Con19.class);
		Bus bus2 = ctx2.getBean("getBus", Bus.class);
		System.out.println(bus2);
		ctx2.close();
		
	}

}
