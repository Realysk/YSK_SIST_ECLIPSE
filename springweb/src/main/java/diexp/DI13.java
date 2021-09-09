
package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Member;
import diexp.vo.Product;

public class DI13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ex) a12.xml 만들고 Product를 필드를 할당, DI12.java를 통해서 호출하여 출력하세요.
		
		Resource rs = new ClassPathResource("diexp\\a13.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		Member mem = (Member)bean.getBean("mem");
		System.out.println("ID : " + mem.getId());
		System.out.println("PASS : " + mem.getPass());
		System.out.println("NAME : " + mem.getName());
		System.out.println("AUTH : " + mem.getAuth());
		System.out.println("POINT : " + mem.getPoint());

	}

}
