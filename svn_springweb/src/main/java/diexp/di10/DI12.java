package diexp.di10;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Product;

public class DI12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 스프링의 컨테이너의 메모리 내용 확인..
		Resource rs = new ClassPathResource("diexp\\di10\\a12.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		// id로 해당 bean의 객체 가져온다.
		Product prod = (Product)bean.getBean("prod");
		System.out.println(prod.getName());
		System.out.println(prod.getPrice());
		System.out.println(prod.getCnt());

	}

}
