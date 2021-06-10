package javaexp.a09_api;

import javaexp.z01_vo.Car;
import javaexp.z01_vo.Food;
import javaexp.z01_vo.Product;

public class A16_Class {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # Class
		 	1. 클래스와 인터페이스의 메타데이터 관리
		 		메타데이터 : 클래스의 이름, 생성자, 필드, 메서드 정보
		 	2. Class의 객체 얻기
		 		1) getClass()
		 			ex) Class clazz = obj.getClass();
		 		2) Class.forName("문자열클래스정보")
		 	3. Class를 통한 객체 생성
		 		.newInstance()
		*/
		
		// 1. 메타데이터를 가져오기 위한 처리
		Car c1 = new Car();
		Class clazz1 = c1.getClass();
		// clazz1을 통해서 Car 클래스의 메타정보를 가져온다.
		System.out.println(clazz1.getName());
		System.out.println(clazz1.getSimpleName());
		System.out.println(clazz1.getPackage().getName());
		
			
//			try {
//				Class clazz2 = Class.forName("javaexp.z01_vo.Book");
//				System.out.println(clazz2.getName());
//				System.out.println(clazz2.getSimpleName());
//				System.out.println(clazz2.getPackage().getName());
//				Book b1 = (Book) clazz2.newInstance();
//				b1.setTitle("자바기초");
//				System.out.println(b1.getTitle());
//			} catch (ClassNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (InstantiationException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IllegalAccessException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			/*
			 ex) javaexp.z01_vo.Food, javaexp.z01_vo.Product
			 	로 Class 객체 메타정보를 위한 생성 2가지 방식으로 처리하고
			 	객체 Food를 Class에 의해 생성하고 기능메서드를 활용하세요.
			 */
			
			Food f1 = new Food();
			Class clazz3 = f1.getClass();
			System.out.println(clazz3.getName());
			System.out.println(clazz3.getSimpleName());
			System.out.println(clazz3.getPackage().getName());
		
		try {
			Class clazz4 = Class.forName("javaexp.z01_vo.Product");
			System.out.println(clazz4.getName());
			System.out.println(clazz4.getSimpleName());
			System.out.println(clazz4.getPackage().getName());
			Product p1 = (Product) clazz4.newInstance();
			p1.setName("사과");
			p1.setPrice(2000);
			p1.setCnt(3);
			System.out.println(p1.getName());
			System.out.println(p1.getPrice());
			System.out.println(p1.getCnt());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
