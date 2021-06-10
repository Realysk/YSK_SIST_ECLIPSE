package javaexp.a10_collections;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javaexp.a05_object.vo.Product;
import javaexp.z01_vo.Food;

public class A02_Basic {
	/*
	 # 배열객체의 한계와 collection 객체
		1. 배열은 한번 크기가 설정이 되어 만들어지면 배열의 크기를 동적으로 변경이 불가능하다.
		새로운 메모리로 배열을 다시 만들어야 하는 단점을 가지고 있다.
		2. java에서는 이러한 배열형에 대한 동적인 구조를 처리하기 위해 3가지 형태의 기본적인 데이터 처리 구조를 만들어 사용한다.
		3. Collection 객체 3가지
			1) Set 인터페이스 하위 객체
				순서가 확보되지 못하고 중복을 허용하지 못한다.
			2) List 인터페이스 하위 객체
				순서를 index에 의해 확보가 되고 다양한 기능메서드를 통해서 데이터를 처리하고 있다.
				add(추가)
				add(index, 추가) : 특정 위치 이후에 추가
				set(index, 변경) : 특정 위치에 변경
				get(index) : 특정 위치에 데이터 가져오기
				remove(index) : 특정 위치에 데이터 삭제
				size() : 해당 list 객체의 크기
			3) Map 인터페이스 하위 객체
				key, value 형식의 데이터를 할당하여 중복되지 않는 key를 기준으로 데이터를 처리할 수 있다.
				put("key", value 객체); // key, value값 할당.
				keySet() : Set 객체로 전체 중복되지 않는 key를 가져올 수 있다.
				get(키 값) : map 객체에 포함된 key에 해당하는 값을 가져올 수 있다.
	*/

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set set = new HashSet();
		set.add("사과");
		set.add("바나나");
		set.add("바나나");
		set.add("바나나");
		set.add("오렌지");
		set.add("오렌지");
		set.add("수박");
		System.out.println("set 구조 확인 : " + set);
		
		List lst = new ArrayList();
		lst.add("오렌지");
		lst.add("오렌지");
		lst.add("바나나");
		lst.add("수박");
		lst.add("수박");
		lst.add("키위");
		// 중복 허용, 순서 확보
		System.out.println("list 구조 확인 : " + lst);
		
		// ex1) 좋아하는 음료를 List 객체로 입력하여 구조를 확인하세요.
		
		List lst2 = new ArrayList();
		lst2.add("콜라");
		lst2.add("사이다");
		lst2.add("사이다");
		lst2.add("블랙보리");
		lst2.add("블랙보리");
		lst2.add("콜라");
		lst2.add("블랙보리");
		lst2.add("까나리");
		System.out.println("음료 list 구조 확인 : " + lst2);
		
		// ex2) 음료 list 내용을 3번째 위치에 추가, 첫번째 위치의 음료 삭제, 4번째 위치에 음료 수정해서 전체 데이터 리스트를 출력 처리하세요.
		
		lst2.add(2,"포도주스");
		lst2.remove(0);
		lst2.set(3, "커피");
		for(int idx = 0; idx < lst2.size(); idx++) {
			System.out.println(idx+1+":"+lst2.get(idx));
		}
		
		// .size()를 통해서 크기 설정
		// lst.set(위치,변경할데이터)
		lst.set(0, "망고");
		// lst.remove (삭제할 인덱스)
		lst.remove(lst.size()-1); // 크기-1 마지막데이터
		// lst.add(위치, 특정위치에 추가)
		lst.add(1,"사과");
		for(int idx = 0;idx<lst.size(); idx++) {
			// get()을 통해서 단위 데이터를 가져올 수 있다.
			System.out.println(idx + 1 + ":" + lst.get(idx));
		}
		
		// 객체 단위로 데이터 추가 변경
		// ArrayList로 generic으로 Product 객체만 할당할 수 있다.
		// List 객체 선언.
		List<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2));
		plist.add(new Product("바나나",4000,5));
		plist.add(new Product("오렌지",2000,5));
		plist.add(new Product("수박",13000,3));
		plist.add(new Product("키위",800,13));
		plist.set(0, new Product("참외",2000,5));
		// remove(), add(위치, 객체생성);
//		for(Product p:plist) {
//			//p.buy();
//			System.out.println(p.getName()+"\t");
//			System.out.println(p.getPrice()+"\t");
//			System.out.println(p.getCnt()+"\t");
//		}
		
		// ex) Food 객체를 ArrayList를 객체 3개를 생성하여 담고 해당 내용을 출력 처리하세요.
		// List<Food> : 리스트 객체에 기본 데이터 유형인 Object에서 특정한 데이터 유형 Food만
		// 구성요소로 들어 올 수 있게 하여 반복문에서 typecasting 없이 바로 객체를 사용할 수 있게 한다.
		
		List<Food> flist = new ArrayList<Food>();
		flist.add(new Food("짜장면", 4000, "신림동짜장"));
		flist.add(new Food("냉면", 7000, "육쌈냉면"));
		flist.add(new Food("김치찌개", 5000, "선릉찌개"));
		for(Food f: flist) {
			System.out.print(f.getName()+"\t");
			System.out.print(f.getPrice()+"\t");
			System.out.println(f.getLoc()+"\t");
		}
		
		// Map <key유형, value유형>
		Map<String,String> map = new Hashtable<String, String>();
		map.put("name", "홍길동");
		map.put("age", "25");
		map.put("loc", "서울신림동");
		System.out.println("Map의 name값 : " + map.get("name"));
		System.out.println("Map의 age값 : " + map.get("age"));
		System.out.println("Map의 loc값 : " + map.get("loc"));
		
		// ex) 물건명, 가격, 갯수를 key로 하고 해당 값을 value로 하여 할당 후 출력 처리하세요.
		Map<String,String> map2 = new Hashtable<String, String>();
		map2.put("name", "전공책");
		map2.put("price", "26000");
		map2.put("cnt", "5");
		System.out.println("물건의 이름 : " + map2.get("name"));
		System.out.println("map2의 가격 : " + map2.get("price"));
		System.out.println("Map2의 갯수 : " + map2.get("cnt"));
	}
}
