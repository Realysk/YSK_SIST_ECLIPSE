package javaexp.a10_collections;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javaexp.z01_vo.Product;

public class A05_Map {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		# Map 인터페이스 하위 객체
			1. key, value 형식의 구조를 가진 collection 객체
				key : 식별자
				value : 객체
				put(K,V) : 형식으로 저장
				keySet() : 저장되어 있는 key들은 Set형식으로 리턴
				get(K) : 결과로 Value값을 가져오는 처리
			2. key값은 중복을 허용하지 않음.
			3. value는 단일 데이터, 객체/배열도 할당이 가능하다.
		*/
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		// Map<String, Integer> : key는 문자열, value는 Integer Wrapper를 선언하여 처리.
		// put(key, value값 설정) : value값은 Wrapper이기에 기본유형으로 boxing 처리 가능
		map.put("김길동",80);
		map.put("신길동",89);
		map.put("신길동",92);
		map.put("오길동",85);
		map.put("김길동",87);
		System.out.println("map의 크기 : " + map.size());
		// Map의 key 가져오기 : map.keySet()
		Set<String> keySet = map.keySet();
		for(String key:keySet) {
			// 맵객체.get("키") : value를 가져오기
			// 할당 된 최종 값을 가져온다.
			System.out.println(key + " : " + map.get(key));
		}
		
//		ex) 물건명과 가격을 key/value 형식으로 설정하고 중복처리도 한 후 반복문을 통해 최종 결과 값을 출력하세요.
		
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("사과", 3000);
		map2.put("사과", 3000);
		map2.put("사과", 3000);
		map2.put("사과", 3000);
		map2.put("사과", 3000);
		map2.put("사과", 3000);
		System.out.println("\n각종 과일의 수량 : " + map2.size() + " 개");
		Set<String> keySet2 = map2.keySet();
		for(String key2:keySet2) {
			System.out.println("product size : " + map2.get(key2));
		}
		// Map<정수형 Wrapper, 객체>
		// 정수형 Wrapper를 활용하여 boxing, unboxing 처리하여 번소 순서로 데이터가 자동 저장.
		// 최종 값을 기준으로 value객체를 저장하여 중복을 허용하지 않는다.
		Map<Integer, Product> pMap = new HashMap<Integer, Product>();
		// autoboxing 처리로 key 값은 기본 정수가 Integer 할당 처리.
		pMap.put(1000, new Product("사과",3000,2));
		pMap.put(1001, new Product("바나나",3000,2));
		pMap.put(1002, new Product("오렌지",3000,2));
		pMap.put(1003, new Product("수박",3000,2));
		pMap.put(1002, new Product("오렌지",3000,2));
		Set<Integer> proKey = pMap.keySet();
		// unboxing 처리
		
		for(int code:proKey) {
			// int 정수 타입 변수 = new Integer("입력값");
			System.out.print(code + "\t");
			// key 값 기준으로 연결되어 있는 value 객체를 가져오고 있다.
			Product p = pMap.get(code);
			System.out.print(p.getName() + "\t");
			System.out.print(p.getPrice() + "\t");
			System.out.println(p.getName());
		}

	}

}
