package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Person;

public class DI11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 스프링의 컨테이너의 메모리 내용 확인..
		Resource rs = new ClassPathResource("diexp\\a11.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		// id로 해당 bean의 객체 가져온다.
		Person p01 = (Person)bean.getBean("p01");
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
		// ex) a12.xml 만들고, Product를 필드를 할당...
		// DI12.java를 통해서 호출하여 출력하세요  4조..
	}

}
