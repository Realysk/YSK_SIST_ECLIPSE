package jspexp.z03_util;

import com.google.gson.Gson;

import jspexp.z02_vo.Person;
import jspexp.z02_vo.Product;

public class A01_GSON {
	
	public A01_GSON() {
		// TODO Auto-generated method stub
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Person p01 = new Person("홍길동", 25, "서울");
		Gson gson = new Gson();
		// 1. 객체를 JSON 문자열로 변환 처리
		String json = gson.toJson(p01);
		System.out.println("JSON 문자열 데이터 : " + json);
		// 2. JSON 문자열을 Person 객체로 변환 처리
		//		"는 \"가 자동으로 붙어서 저리된다.
		String json2 = "{\"name\":\"마길동\",\"age\":29,\"loc\":\"제주도\"}";
		Person p02 = gson.fromJson(json2, Person.class);
		System.out.println(p02.getName());
		System.out.println(p02.getAge());
		System.out.println(p02.getLoc());
		
		// ex) Product 클래스를 객체로 할당한 후 JSON 문자열로 출력하고 JSON 문자열 데이터를 Product 객체로 생성해서 출력하세요.

		Product prod = new Product("사과", 3000, 2);
		Gson gson2 = new Gson();
		String prodJson = gson.toJson(prod);
		System.out.println("물건 정보 : " + prodJson);
		String prodJson2 = "{\"name\":\"수박\",\"price\":6000,\"cnt\":1}";
		Product prod2 = gson.fromJson(prodJson2, Product.class);
		System.out.println(prod2.getName());
		System.out.println(prod2.getPrice());
		System.out.println(prod2.getCnt());
		
	}

}
