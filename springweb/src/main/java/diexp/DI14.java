package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Dept;

public class DI14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 스프링의 컨테이너의 메모리 내용 확인..
		Resource rs = new ClassPathResource("diexp\\a14.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		// id로 해당 bean의 객체 가져온다.
		Dept dept = (Dept)bean.getBean("dept");
		System.out.println(dept.getDeptno());
		System.out.println(dept.getDname());
		System.out.println(dept.getLoc());
	
// ex) DI15.java, a15.xml을 만들고,  Student.java를 활용하여 생성자를 통해 데이터를 할당하고
//     출력하세요. 4조
	}

}
