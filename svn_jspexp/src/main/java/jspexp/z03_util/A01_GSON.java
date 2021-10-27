package jspexp.z03_util;

import com.google.gson.Gson;

import jspexp.z02_vo.Person;
import jspexp.z02_vo.Product;

public class A01_GSON {

	public A01_GSON() {
		// TODO Auto-generated constructor stub
	}
	/*
	# Gson
	1. 객체를 json 문자열로 변환
		class Person{
			private String name;
			public void setName(String name){}
			public String getName(){}
		}
		Person p = new Perosn()
		p.setName("홍길동");
		==> {name:"홍길동"}
		gson.toJson(객체참조) ==> 객체를 json으로 변환 매서드
	2. json 문자열을 객체로 변환
		gson.fromJson("json문자열", 변환객체.class) ==> json문자열을 해당형식과 동일한 객체로
			변환처리..
	 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p01 = new Person("홍길동",25,"서울");
		Gson gson = new Gson();
		// 1. 객체를 json문자열로 변환 처리..
		String json = gson.toJson(p01);
		System.out.println("json문자열 데이터:"+json);
		// 2. json문자열을 Person 객체로 변환 처리..
		//    "는 \"가 자동으로 붙여서 처리된다.
		String json2 = "{\"name\":\"마길동\",\"age\":29,\"loc\":\"제주도\"}";
		Person p02 = gson.fromJson(json2, Person.class);
		System.out.println(p02.getName());
		System.out.println(p02.getAge());
		System.out.println(p02.getLoc());
/*  ex) Product 클래스를 객체로 할당한 후, json문자열로 출력하고,
 * 		json문자열 데이터를 Product 객체로 생성해서 출력하세요.. 4조...
 */		
		Product prd01 = new Product("사과",3000,2);
		String json3 = gson.toJson(prd01);
		System.out.println("물건 json 데이터 :"+json3);
		String json4 = "{\"name\":\"오렌지\",\"price\":2000,\"cnt\":3}";
		Product prd02 = gson.fromJson(json4, Product.class);
		System.out.println(prd02.getName());
		System.out.println(prd02.getPrice());
		System.out.println(prd02.getCnt());
		
		
		
		
	}

}
