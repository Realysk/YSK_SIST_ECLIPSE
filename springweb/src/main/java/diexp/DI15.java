
package diexp;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import diexp.vo.Dept;
import diexp.vo.Student;

public class DI15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ex) DI15.java, a15.xml을 만들고, Student.java를 활용하여 생성자를 통해 데이터를 할당하고 출력하세요.
		
		// 스프링의 컨테이너의 메모리 내용 확인
		Resource rs = new ClassPathResource("diexp\\a15.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		// id로 해당 bean의 객체를 가져온다.
		Student stu = (Student)bean.getBean("stu");
		System.out.println("학번 : " + stu.getSno());
		System.out.println("이름 : " + stu.getName());
		System.out.println("국어점수 : " + stu.getKor());
		System.out.println("영어점수 : " + stu.getEng());
		System.out.println("수학점수 : " + stu.getMath());

	}
}