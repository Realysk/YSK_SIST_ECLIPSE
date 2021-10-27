package javaexp.a14_generic;

import java.util.ArrayList;
import java.util.List;

import javaexp.z01_vo.Product;
import javaexp.z01_vo.Student;

public class A01_basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 제네릭 타입
1. 컴파일 단계에서 잘못된 타입 사용될 수 있는 문제 제거 가능하게 해준다.
   사전에 사용할 객체에 대한 타입을 외부에서 지정하여,
   다른 타입을 할당하는 것을 방지하여, 프로그램의 
   데이터 타입에 대한 확정을 하는 것을 말한다.
   ex) ArrayList<Person> plist;
   		 Person데이터 유형할 할당 가능
   	   Vehicle<Car> v1 = new Vehicle<Car>(); 
   		 Car유형만 할당 가능
       class Vehicle<T>{
       	  private T t;
       	  ...
       }
2. 이점
	1) 컴파일 시 강한 타입 체크 가능
		실행시 타입 에러가 나는 것 방지
		컴파일 시에 미리 타입을 강하게 체크해서 에러 사전 방지.
	2) 타입변환 제거 가능..	
 * */
		// default로 모든 객체를 할당할 수 있다.
		List list = new ArrayList();
		list.add(new Product("사과",3000,2));
		list.add(new Product("바나나",4000,3));
		list.add(new Product("딸기",12000,5));
		// 반드시 typecasting이 필요하다.
		Product p01 = (Product)list.get(0);
		List<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2));
		plist.add(new Product("바나나",4000,3));
		plist.add(new Product("딸기",12000,5));
		// generic으로 사전에 입력할 객체 type을 선언했기때문에
		// 형변환 없이 사용가능하다.
		Product p02 = plist.get(0);
//  ex1) Student(이름, 국어, 영어, 수학)을 List<Student>
//		형태로 generic으로 선언하고, 할당되어 이름 이름 국어,영어,수학
//		점수를 출력하세요..  [2조]
		List<Student> slist = new ArrayList<Student>();
		slist.add(new Student("홍길동",70,94,100));
		slist.add(new Student("김길동",89,90,78));
		slist.add(new Student("박길동",55,78,19));
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		for(Student s:slist) {
			s.show2();
		}
		
		
		
		
		
	}

}
