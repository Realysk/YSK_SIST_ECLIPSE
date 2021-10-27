package javaexp.a10_collections;

import javaexp.z01_vo.Book;
import javaexp.z01_vo.Food;

public class A01_ArrayFor {
/*
# 배열과 foreach 구문..
1. 배열은 단위 데이터를 묶어서 모아 놓은 데이터 이다.
	int nums[] = {10,15,20};
2. 객체가 모여서, 배열을 이룰 수 있다.
	Person[] parry = {new Person(), 
					  new Person(), 
					  new Person()};
3. 상위 객체를 배열하고, 상속받은 하위 객체을
	폴리모피즘에 의해서 할당 할 수 있다.
	FlyWay[] fl = {new CountryFly(),
		new WorldFly(), new SpaceFly()};
	fl[0] == new CountryFly()
		fl[0].fly()
	fl[1] == new WorldFly()
		fl[1].fly()
	fl[2] == new SpaceFly()
		fl[2].fly()
		
4. 배열은 for문을 이용해서 for(단위객체 : 배열객체)
	로 반복문을 이용하여 효과적으로 처리할 수 있다.
5. index와 .length()를 이용하여, 다양한 배열의 
	데이터를 가져와서 활용을 할 수 있다.
		
 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int prices[] = {3000,4000,5000};
		String menus[] = {"사과","바나나","딸기"};
		// index는 0부터 시작하기 때문에 0을 초기값으로 설정.
		// index는 배열의 길이(.length)보다 작기때문에 idx<prices.length
		// 로 반복 구문에서 활용하여 데이터를 처리할 수 있다.
		for(int idx=0;idx<prices.length;idx++) {
			System.out.print(menus[idx]+"\t");
			System.out.print(prices[idx]+"\n");
		}
		// ex) 좋아하는 음식(foods)와 가격, 음식점위치를 설정해서 
		//    for문을 통해서 출력하세요.
		String []foods = {"짜장면","광어회","소고기"};
		int prices2[] = {6000,20000,30000};
		String []locs = {"동대문","노량진","마장동"};
		System.out.println("메뉴\t가격\t맛집위치");
		for(int idx=0;idx<foods.length;idx++) {
			System.out.print(foods[idx]+"\t");
			System.out.print(prices2[idx]+"\t");
			System.out.print(locs[idx]+"\n");		
		}
		// ctrl+shift+o(자동 import)
		Food[] foObjArry = {
				new Food("짜장면",6000,"동대문"),
				new Food("광어회",20000,"노량진"),
				new Food("소고기",30000,"마장동")
		};
		// forEach구문 (단위객체:객체형배열)   단위객체.속성메서드()
		for(Food f:foObjArry) {
			System.out.print(f.getName()+"\t");
			System.out.print(f.getPrice()+"\t");
			System.out.print(f.getLoc()+"\n");
		}
/*ex) Book :도서명, 가격, 저자 VO 객체를 만들고,
 *    배열로 선언한 후, forEach 구문을 이용해서 출력하세요.
 *    */		
		Book[] bArray = {
				new Book("java기초",29000,"김기초"),
				new Book("jsp중급",32000,"한중급"),
				new Book("spring고급",35000,"오특급")
		};
		for(Book bk:bArray) {
			System.out.print(bk.getTitle()+"\t");
			System.out.print(bk.getPrice()+"\t");
			System.out.print(bk.getWriter()+"\n");		
		}
		FlyWay []flyways = {new CountryFly(),
							new WorldFly(),
							new SpaceFly()};
		for(FlyWay fl:flyways) {
			fl.fly();
		}
		int ranIdx = (int)(Math.random()*flyways.length);
		System.out.println("#임의의 객체 메서드 호출#");
		flyways[ranIdx].fly();
		Weapon[] wp = {new LaserBeam(),new Rocket(),
						new DoubleAttack() };
		for(Weapon w:wp) {
			w.attack();
		}
	}
}
// ex1) 인터페이스 Weapon 선언 attack(); 추상메서드 선언.
//      LaserBeam, Rocket, DoubleAttack
//      상속하여, 다형성 배열 처리하세요.
interface Weapon{
	void attack();
}
class LaserBeam implements Weapon{
	public void attack() {
		System.out.println("레이저빔으로 공격하다!");
	}
}
class Rocket implements Weapon{
	public void attack() {
		System.out.println("로켓으로 공격하다!");
	}
}
class DoubleAttack implements Weapon{
	public void attack() {
		System.out.println("이중 무기로 공격하다!");
	}
}

// # 다형성에 의한 배열 설정.
// 상위 = 하위
// 상위배열 = {하위1, 하위2,하위}
// 상위배열[0].재정의메서드() 효과적으로 처리를 할 수 있다.
interface FlyWay{
	void fly();
}
class CountryFly implements FlyWay{
	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("우리 동네를 나르다!!");
	}
}
class WorldFly implements FlyWay{
	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("세계의 창공을 누비다!!");
	}
}
class SpaceFly implements FlyWay{
	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("우주 여행을 하다!!");
	}
}

