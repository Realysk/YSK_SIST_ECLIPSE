package javaexp.a05_object;

import javaexp.a05_object.vo.Book;
import javaexp.a05_object.vo.Person;
import javaexp.a05_object.vo.Product;
class Person02{
	
}
public class A03_Class01 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// #클래스가 객체로 만들어 지는 순간..
		// 1. main(String[] args)메서드 안에서 실행 코드를 입력했을 때,
		// 2. 객체의 선언 방식
		//   	1) 클래스명  참조변수 = new 생성자();
		//         참조변수 안에는 heap영역의 주소값으로 stack에 할당.
		//         new 생성자() heap영역에서 객체가 생성이 된다.
		// 3. 컴파일을 통해서 .class가 만들어지고,
		// 4. 실행을 통해서 객체가 메모리에 로딩되어 수행된다..
		Person p01 = new Person(); 
		// ctrl+shift+o (외부 패키지 클래스 가져오기)
		// 필드의 사용1.
		// 외부에서 할당 처리.
		// 참조변수.필드명 = 할당할데이터;
		p01.name = "홍길동";
		p01.age= 25;
		p01.loc="서울 신림동";
		
		// ex) 필드를 사용하는 것을 만들어진 객체에 데이터를 할당..
		System.out.println("Person객체의 필드 name의 값:"+p01.name);
		System.out.println("Person객체의 필드 age의 값:"+p01.age);
		System.out.println("Person객체의 필드 loc의 값:"+p01.loc);
		// 다른 주소에 클래스로 객체를 생성 주소는 p02에 주소값 할당.
		// ex) 서울에 있는 63빌딩, 제주도에 있는 63빌딩을 같은 도면으로 
		//     만든 것과 같다.
		Person p02 = new Person();
		p02.name="신길동";
		p02.age = 27;
		p02.loc="경기 수원";
		System.out.println("p02에 데이터를 할당하고 입력 확인:"+p02.name);
		System.out.println("p02에 데이터를 할당하고 입력 확인:"+p02.age);
		System.out.println("p02에 데이터를 할당하고 입력 확인:"+p02.loc);
		
		Person p03 = new Person("마길동",24,"제주도 서귀포");
		System.out.println("p03의 name:"+p03.name);
		System.out.println("p03의 age:"+p03.age);
		System.out.println("p03의 loc:"+p03.loc);
		
		//기능 메서드 호출..
		System.out.println("기능 메서드 호출");
		p01.show();
		
		p01.name="천길동";
		p01.show();
		p02.show();
		p03.show();
		
		
		//ex) Product 물건명, 가격, 갯수 필드에 데이터를 할당해서 출력하고,
		// pro01, pro02에 다른 속성을 할당하고 출력하세요..
		// ex) javaexp.a05_object.vo패키지 안에
		// Product 클래스를 선언하고, 
		//    필드(속성) 물건명(name) 가격(price) 갯수(cnt)
		//    생성자 선언  물건호출 출력!!
		//    메서드 물건의 메서드 출력!!
		// 클래스를 객체로 생성하세요..
		// ex) Product의 기능 메서드 buy()를 통해서 아래와 같은 형식으로
		//  출력하게 하세요..
		//    구매한 물품 @@@, 단가 @@@원, 구매갯수 @@, 총비용 @@@원
		//    pro01~pro03까지 출력 처리..
		Product pro01 = new Product();
		pro01.name="사과";
		pro01.price=3000;
		pro01.cnt=5;
		System.out.println("힙영역의 메모리:"+pro01);
		System.out.println("Product의 pro01:"+pro01.name);
		System.out.println("Product의 pro01:"+pro01.price);
		System.out.println("Product의 pro01:"+pro01.cnt);
		Product pro02 = new Product();
		pro02.name="오렌지";
		pro02.price=2000;
		pro02.cnt=2;
		System.out.println("힙영역의 메모리:"+pro02);
		System.out.println("Product의 pro02:"+pro02.name);
		System.out.println("Product의 pro02:"+pro02.price);
		System.out.println("Product의 pro02:"+pro02.cnt);
		// ex1) Product에 입력값이 있는 생성자를 추가하여, 초기값 처리하고,
		//   pro03을 통해 생성하고, 속성을 출력하세요..
		Product pro03 = new Product("바나나",4000,5);
		System.out.println("Product의 pro03:"+pro03.name);
		System.out.println("Product의 pro03:"+pro03.price);
		System.out.println("Product의 pro03:"+pro03.cnt);
		// # Product에서 buy()메서드 호출.
		System.out.println("# 메서드 호출 #");
		pro01.buy();
		pro02.buy();
		pro03.buy();
		
		// ex2) Book 클래스 생성, 도서명, 저자, 가격 속성 설정 생성자를
		//    통해 초기화 처리하고 필드를 출력하세요.
		Book b1 = new Book("자바의 기초","자바맨",29000);
		System.out.println("도서클래스의 b1 객체:"+b1.name);
		System.out.println("도서클래스의 b1 객체:"+b1.writer);
		System.out.println("도서클래스의 b1 객체:"+b1.price);
			
		
		
		
		
		
		

	}

}
