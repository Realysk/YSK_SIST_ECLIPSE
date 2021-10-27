package javaexp.a05_object;

public class A12_Object {
/*
# 클래스의 구성요소 통합 연습
1. 각각의 구성요소의 기능에 따른 통합 연습.
	1) 필드 : 객체의 공통 데이터 저장 처리
	2) 생성자 : 필드의 초기화 처리.
	3) 메서드 : 기능적인 처리
	
2. 연습예제
	1) 물건 클래스를 선언하되 사용되는 필드는 물건명 가격 갯수
		생성자를 통해서 초기화(물건명 가격)처리.
		기능메서드1 : 매개변수로 갯수를 처리하여, 물건명 가격 갯수를
			출력하고 총계를 리턴하게 처리..
	ex) 		
	2) 쇼핑몰 클래스를 선언하고
		- 기능 내용 : 로그인(아이디, 패스워드)
		-		    물건구매(물건명, 갯수)
		-           상품리스트보기() :쇼핑몰에 상품리스트 보기 
									ArrayList<Product>
		-           물건상세보기() : 상품중에 특정한 상품을 보기 Product
		 
 * */
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int tot = 0;
		Product01 p1 = new Product01("사과", 3000);
		tot+=p1.buy(5);
		Product01 p2 = new Product01("바나나", 4000);
		tot+=p1.buy(2);
		Product01 p3 = new Product01("딸기", 12000);
		tot+=p1.buy(3);
		System.out.println("총계:"+tot);
// ex) Schedule 필드 :계획내용,계획된시간
//       생성자를 통해서 필드값 초기화
//       메서드를 통해서 실제실행시간 execute(시간)  리턴값으로 계획 실행의 차
///    일정계획3개와 실행된 내용에 대하여 전체 계획대비 실행 차이를 출력하세요.[1조]
		int tot2 = 0;
		Schedule s1 = new Schedule("공부",60);
		tot2 += s1.gap(20);
		Schedule s2 = new Schedule("운동",80);
		tot2 += s2.gap(30);
		Schedule s3 = new Schedule("자바",90);
		tot2 += s3.gap(100);
		System.out.println("전체 일정 차이(분):"+tot2);
	}

}
class Product01{
	private String name;
	private int price;
	private int cnt;
	public Product01(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}
	public int buy(int cnt) {
		System.out.println("# 구매한 물건 정보 #");
		System.out.println("물건명:"+name);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		this.cnt = cnt;
		return price*cnt;
	}
}



class Schedule {
	String content;
	int plan;
	int execute;

	public Schedule(String content, int plan) {
		super();
		this.content = content;
		this.plan = plan;
	}

	public int gap(int execute) {
		this.execute = execute;
		System.out.println("계획내용: " + content);
		System.out.println("계획된 시간: " + plan + "분");
		System.out.println("실제실행시간: " + execute + "분");
		System.out.println("계획대비 실행차이: " + (plan - execute) + "분");

		return plan - execute;
	}

}



