package diexp.di10;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Member;

public class DI13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 스프링의 컨테이너의 메모리 내용 확인..
		Resource rs = new ClassPathResource("diexp\\di10\\a13.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		// id로 해당 bean의 객체 가져온다.
		Member mem = (Member)bean.getBean("mem");
		System.out.println(mem.getId());
		System.out.println(mem.getPass());
		System.out.println(mem.getName());
		System.out.println(mem.getAuth());
		System.out.println(mem.getPoint());

	}

}
