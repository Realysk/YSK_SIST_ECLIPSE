package javaexp.a14_generic;

import javaexp.z01_vo.Product;

public class A02_ObjectProp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 객체 유형의 속성 설정과
generic에 의한 속성 설정
 * */
//		1. 속성을 Object로 선언하면 모든 객체를 할당할 수 있다.
		Box1 b1 = new Box1();
		b1.setObj("안녕");
		// Object로 속성을 선언했기때문에 typecasting 필요하다.
		String ret = (String)b1.getObj();
		System.out.println("box1에 있는 데이터:"+ret);
//ex2) Box2로 속성(이름,Object), 
//		show() @@에는 객체 @@이 들어가 있다. [3조]
		Box2 b2 = new Box2("잡동사니");
		b2.setObj("사과(문자열)");
		b2.show();
		// 해당 type에 설정하여야 사용이 가능하다.
		String ret2 = (String)b2.getObj();
		System.out.println("리턴한 객체:"+ret2);
		b2.setObj(new Product("바나나",3000,2));
		b2.show();
		Product prod = (Product)b2.getObj();
		System.out.println("#리턴한 객체#");
		System.out.println(prod.getName());
		System.out.println(prod.getPrice());
		System.out.println(prod.getCnt());
		
	}
}
class Box1{
	private Object obj;
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
}
class Box2{
	private String name;
	private Object obj;
	public Box2(String name) {
		super();
		this.name = name;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public void show() {
		// @@에는 객체 @@이 들어가 있다.
		System.out.println(name+" box에는");
		if(obj!=null) {
			System.out.println("객체가 있음:"+obj);
		}else {
			System.out.println("객체 없음.");
		}
	}
}

