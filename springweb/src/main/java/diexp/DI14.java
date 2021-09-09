
package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Dept;

public class DI14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Resource rs = new ClassPathResource("diexp\\a14.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		Dept dept = (Dept)bean.getBean("dept");
		System.out.println("부서번호 : " + dept.getDeptno());
		System.out.println("부서명 : " + dept.getDname());
		System.out.println("부서지역 : " + dept.getLoc());

	}
}