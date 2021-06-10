package javaexp.a10_collections;

import javaexp.z01_vo.Food;

public class A01_ArrayFor {
	/*
	 # 배열과 foreach 구문.
	 	1. 배열은 단위 데이터를 묶어서 모아 놓은 데이터이다.
	 		int nums[] = {10,15,20};
	 	2. 객체가 모여서, 배열을 이룰 수 있다.
	 		Person[] parry = {new Person(),
	 						new Person(),
	 						new Person()};
	 	3. 상위 객체를 배열하고, 상속받은 하위 객체를 폴리모피즘에 의해서 할당 할 수 있다.
	 		Flyway[] fl = {new CountryFly(),
	 			new WorldFly(), new SpaceFly()};
	 		fl[0] == new CountryFly()
	 			fl[0].fly()
	 		fl[1] == new WorldFly()
	 			fl[1].fly()
	 		fl[2] == new SpaceFly()
	 			fl[2].fly()
	 	4. 배열은 for문을 이용해서 for(단위객체 : 배열객체)
	 		로 반복문을 이용하여 효과적으로 처리할 수 있다.
	 	5. index와 .length()를 이용하여 다양한 배열의 데이터를 가져와서 활용을 할 수 있다.
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int prices[] = {3000,4000,5000};
		String menus[] = {"사과", "바나나", "딸기"};
		// index는 0부터 시작하기 때문에 0을 초기값으로 설정.
		// index는 배열의 길이(.length)보다 작기 때문에
		// idx<prices.length로 반복 구문에서 활용하여 데이터를 처리할 수 있다.
		for(int idx=0; idx<prices.length;idx++) {
			System.out.println(menus[idx] + "\t");
			System.out.println(prices[idx] + "\t");
		}
		
		// ex) 좋아하는 음식(foods)와 가격, 음식점 위치를 설정해서 반복문을 통해서 출력하세요.
		
		int prices2[] = {15000,30000,45000};
		String foods[] = {"야채곱창 2인분", "숭어회+소주", "킹크랩"};
		String places[] = {"노원", "수락산", "마포"};
		for(int idx=0; idx<prices2.length;idx++) {
			System.out.println(foods[idx] + "\t");
			System.out.println(prices2[idx] + "\t");
			System.out.println(places[idx] + "\t");
		}
		// ctrl+shift+o (자동 import)
		Food[] foObjArry = {
				new Food("야채곱창 2인분", 15000, "노원"),
				new Food("숭어회+소주", 30000, "수락산"),
				new Food("킹크랩", 45000, "마포")
		};
		// forEach 구문 (단위객체 : 객체형배열)	단위객체.속성메서드()
		for(Food f:foObjArry) {
			System.out.print(f.getName()+"\t");
			System.out.print(f.getPrice()+"\t");
			System.out.print(f.getLoc()+"\t");
		}
		/*
		 	ex) Book : 도서명, 가격, 저자 VO 객체를 만들고 배열로 선언한 후 forEach 구문을 이용해서 출력하세요.
		 */
		int prices3[] = {12345,67890,111315};
		String books[] = {"전공책", "교양책", "해결책"};
		String writer[] = {"홍길동", "청길동", "백길동"};
	
		FlyWay []flyways = {new CountryFly(), new WorldFly(), new SpaceFly()};
			for(FlyWay fl:flyways) {
				fl.fly();
			}
			int ranIdx = (int)(Math.random()*flyways.length);
			System.out.println("# 임의의 객체 메서드 호출 #");
			flyways[ranIdx].fly();
			
//			Weapon[] wp = {new LaserBeam(), new Rocket(), new DoubleAttack()};
//			for(Weapon w:wp) {
//				w.attack();
//			}
	}
}

// # 다형성에 의한 배열 설정.
// 상위 = 하위
// 상위배열 = {하위1, 하위2, 하위}
// 상위배열 [0].재정의메서드() 효과적으로 처리를 할 수 있다.
interface FlyWay {
	void fly();
}
class CountryFly implements FlyWay {
	@Override
	public void fly() {
		System.out.println("우리 동네를 날으다!!");
	}
}
class WorldFly implements FlyWay {
	@Override
	public void fly() {
		System.out.println("세계의 창공을 누비다!!");
	}
}
class SpaceFly implements FlyWay {
	@Override
	public void fly() {
		System.out.println("우주 여행을 하다!!");
	}
}

//ex1) 인터페이스 Weapon 선언 attack(); 추상메서드 선언. LaserBeam, Rocket, DoubleAttack 상속하여 다형성 배열 처리.

interface Weapon {
	void attack();
}
class LaserBeam implements Weapon {
	public void attack() {
		System.out.println("레이저빔으로 공격하다!");
	}
class Rocket implements Weapon {
	public void attack() {
		System.out.println("로켓으로 공격하다!");
	}
class DoubleAttack implements Weapon {
	public void attack() {
		System.out.println("합체 공격하다!");
	}
}
}
}