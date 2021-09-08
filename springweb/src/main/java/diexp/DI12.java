
package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Person;
import diexp.vo.Product;

public class DI12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ex) a12.xml 만들고 Product를 필드를 할당, DI12.java를 통해서 호출하여 출력하세요.
		
		Resource rs = new ClassPathResource("diexp\\a12.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		Product prod = (Product)bean.getBean("prod");
		System.out.println("물건명 : " + prod.getName());
		System.out.println("가격 : " + prod.getPrice());
		System.out.println("수량 : " + prod.getCnt());

	}

}
