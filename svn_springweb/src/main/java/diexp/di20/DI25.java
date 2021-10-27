package diexp.di20;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo5.Emp;
import diexp.vo5.Dept;

public class DI25 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = 
				new GenericXmlApplicationContext("diexp\\di20\\a25.xml");
		// 한번에 객체로 로딩되는데, id값을 클래스명의 소문자가 id명을 default 설정이 된다..
		Emp obj1 = ctx1.getBean("emp", Emp.class);
		// @Component("d01")로 각 객체의 id값을 찾아서 처리할 수 있다..
		Dept obj2 = ctx1.getBean("d01", Dept.class);
		
		// ex) vo5패키지 기준으로 a25.xml에서 컨포넌트 스캔을 처리하여 객체를 로딩하고, 데이터를 할당하여
		// 출력하세요   2, 3조
		obj1.setEname("홍길동");
		obj2.setDname("인사");
		System.out.println(obj1.getEname());
		System.out.println(obj2.getDname());
		ctx1.close();

	}

}
