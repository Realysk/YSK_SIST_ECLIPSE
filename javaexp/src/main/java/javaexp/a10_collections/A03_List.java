package javaexp.a10_collections;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javaexp.z01_vo.Food;

public class A03_List {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 컬렉션 프레임워크의 주요 인터페이스
		 	1. List : 순서를 유지하고 저장, 중복 저장 가능
		 		ArrayList, Vector, LinkedList
		 	2. Set : 순서를 유지하지 않고 저장, 중복 저장 불가능
		 		HashSet, TreeSet
		 	3. Map : 키와 값의 쌍으로 저장, 키는 중복 저장 불가능
		 		HashMap, Hashtable, TreeMap, Properties
		 		
		 # List 컬렉션
		 	1. 특징
		 		인덱스로 관리
		 		중복 객체 저장 가능
		 	2. 구현 클래스
		 		ArrayList
		 		Vector : 불확실성이 많은 쓰레드에 보다 안정적으로 데이터를 추가 삭제할 수 있다.
		 		LinkedList : 인접 참조를 링크해서 체인처럼 관리. 특정 index에서 객체를 제거하거나 추가하게 되면
		 		바로 앞뒤 링크만 변경. 번번한 객체 삭제 삽입이 일어나는 곳에서 ArrayList보다 좋은 성능을 발휘한다.
		 	3. 공통 메서드
		 		add(객체) : 맨 끝에 추가된다.
		 		add(지정index, 객체) : 지정한 index위치에 추가된다.
		 		기존 객체들을 추가 위치를 기준으로 하나씩 밀리게 된다.
		 		set(지정index, 객체) : 지정한 index에 객체를 바꾼다.
		 		contains(객체) : 해당 객체가 있는지 여부를 리턴
		 		get(위치index) : 해당 index에 객체를 가져온다.
		 		isEmpty() : 컬렉션이 비어 있는지를 확인한다. (boolean)
		 		size() : 저장되어 있는 전체 객체수를 리턴한다.
		 		clear() : 저장된 모든 객체를 삭제한다.
		 		remove(index) : 특정 위치에 있는 객체를 삭제한다.
		 		remove() : 주어진 객체를 삭제한다.
		 */
		
			List<String> list = new ArrayList<String>();
			System.out.println("isEmpty() : " + list.isEmpty());
			System.out.println("size() : " + list.size());
			list.add("사과");			
			list.add("바나나");			
			list.add("딸기");
			System.out.println("isEmpty() : " + list.isEmpty());
			System.out.println("size() : " + list.size());
			list.add(1,"오렌지");
			System.out.println(list);
			System.out.println("세 번째 : " + list.get(2));
			list.set(2, "수박");
			System.out.println(list);
			System.out.println("수박이 있는가? : " + list.contains("수박"));
			list.remove(0);
			list.remove("바나나");
			System.out.println(list);
			list.clear();
			System.out.println("isEmpty() : " + list.isEmpty());
			System.out.println("size() : " + list.size());
			
			/*
			 ex) 회원관리 ArrayList<String>
			 회원등록 2명 1번째에 추가, 2번째 회원변경, 회원탈퇴(index, 이름), 전체 탈퇴 처리.
			 회원 등록된 여부, 크기 확인
			 */
			
			List<String> jlist = new ArrayList<String>();
			jlist.add("홍길동");			
			jlist.add("유길동");			
			jlist.add("박길동");
			System.out.println("isEmpty() : " + jlist.isEmpty());
			System.out.println("size() : " + jlist.size());
			jlist.add(0, "독고길동");
			System.out.println(jlist);
			System.out.println("회원 등록 : " + jlist.get(0));
			jlist.set(0,"독고길동");
			System.out.println(jlist);
			System.out.println("회원 등록 여부 : " + jlist.contains("독고길동"));
			jlist.remove(0);
			jlist.remove("독고길동");
			System.out.println(jlist);
			jlist.clear();
			System.out.println("isEmpty() : " + jlist.isEmpty());
			System.out.println("size() : " + jlist.size());
			
			// Food(String name, int price, String loc)
			Vector<Food> f1 = new Vector<Food>();
			f1.add(new Food("짜장면",5000,"강남맛집"));
			f1.add(new Food("두부요리",7000,"콩두부맛집"));
			f1.add(new Food("한정식",15000,"개포동한정식"));
			for(Food f:f1) {
				System.out.print(f.getName() + "\t");
				System.out.print(f.getPrice() + "\t");
				System.out.print(f.getLoc() + "\n");
			}
			
			// List와 LinkedList와 추가 속도 비교
			List<String> list1 = new ArrayList<String>();
			List<String> list2 = new LinkedList<String>();
			long startTime = 0;
			long endTime = 0;
			
			// ArrayList 추가 속도
			startTime = System.nanoTime();
			for(int cnt=1; cnt<=9999; cnt++) {
				list1.add(0,String.valueOf(cnt));
			}
			endTime = System.nanoTime();
			System.out.println("ArrayList 추가 입력 시간 : " + (endTime-startTime) + "ns");
			
			// LinkedList 추가 속도
			startTime = System.nanoTime();
			for(int cnt=1; cnt<=9999; cnt++) {
				list2.add(0,String.valueOf(cnt));
			}
			endTime = System.nanoTime();
			System.out.println("LinkedList 추가 입력 시간 : " + (endTime-startTime) + "ns");
			
			
			
			
	}

}
