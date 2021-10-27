package javaexp.a00_exp.a05;

public class A14_0521 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 정리문제
1. static, final, static final의 각각의 차이점을 기본예제를 통해서 기술하세요.
	static : 객체 공유메모리영역 즉, 클래스 단위 멤버를 사용할 때,
			활용된다.
	final  : 필드에서는 상수선언으로 객체마다 하나의 상수를 초기 선언하면,
			변경이 불가능하다.
	static final : 클래스 단위 멤버이면서 변경이 불가능하게 처리할 때, 활용된다.
			class에서 바로 할당하는 경우가 많다.
	main()
	Bear.TOT_BREAD_CNT=30;	
	class Bear{
		private int eat_cnt;
		public static int TOT_BREAD_CNT; 
		// 이 클래스로부터 생성되는 모든 Bear 객체가 공유 메모리 영역 남은 빵의 갯수
		final String NAME;
		static final String KIND = "곰돌이클래스";
		Bear(String name){
			this.NAME = name; 
			// 객체마다 초기로 선언하여 변경이 불가능하게 할때 사용
		}
		public void eat(){
			eat_cnt++; //각 객체마다 해당 변수를 변경 처리
			TOT_BREAD_CNT--; // 객체의 공유 데이터 변경 처리.
		}
	}


2. Robot 클래스를 정의할 때,  "기계로봇", 로봇의 종류, 로봇공유전력남은량, 처리할기능을
    필드로 선언하여, 해당 내용을 활용하는 부분을 위 문제에 선언한 keyword의 기능에 
    맞게 처리하세요. (생성자, 메서드, 필드 선언을 적절하게 하세요)
*/
		Robot.REST_POWER=3000; // static 변수 객체 생성없이 사용가능
		Robot r1 = new Robot("TV");
		r1.working(100);
		r1.attack(150);
		Robot r2 = new Robot("MZ");
		r2.attack(300);
		r2.working(200);
		System.out.println(r1.getKIND()+"의 현재 상태:"
							+r1.getCurrenFunction());
		System.out.println(r2.getKIND()+"의 현재 상태:"
							+r2.getCurrenFunction());
		System.out.println("현재 남은 전력량:"+Robot.REST_POWER);
/*
3. 접근제어자의 범위를 기술하고,  클래스명 앞에 붙는 접근 제어자와 생성자 앞에 붙는
    접근제어자가 main()에서 어떻게 영향을 미치는지 예제를 통하여 기술하세요.
    접근제어자 : 
    	private : 클래스 내에서만 사용할 수 있는 범위로 지정
    		객체로 만들어질 때, 외부 클래스나 main()에서 직접적인 접근을 하지
    		못하게 선언할 때 사용한다. 
    		public getXXX(), public setXXX() 간접적으로 접근은 가능하다.
    	X(default) : 기본적으로 접근제어자가 붙어 있는 않는 멤버는 같은 패키지의 클래스들만
    		접근하여 사용할 수 있다. 
    		ex) 클래스 선언 최상단의 package javaexp.a00_exp; 동일할때.
    	protected : 상속관계에 있는 때, 외부 패키지의 있는 클래스가 접근하여
    		사용할 수 있게 선언한다.
    	public : 외부패키지에서 어떠한 클래스라도 접근하여 호출가능하게 처리하는
    	 	것을 말한다.
 * */
		// 외부 패키지에서 선언할 클래스 호출..
		// import 없이 특정한 패키지의 클래스 선언하거나
		// 현재패키지의 클래스와 같은 이름의 클래스를 호출할 때,
		// 패키지명과 함께 선언한다.
		// 1) 접근제어자 class Person{}
		javaexp.a00_exp.z01_vo.Person p1;
		// 2) 생성자 호출
		p1 = new javaexp.a00_exp.z01_vo.Person();
		
		
		
		
	}
}




class Robot{
	public static int REST_POWER;
	private final String KIND; // 각각의 로봇의 종류 변경되지 않게 처리.
	private static final String ROBOT_CLASSES="기계로봇";
	// 클래스 단위 상수 설정..
	private String currenFunction; // 각 로봇이 현재하고 있는 기능 표시
	Robot(String kind){
		this.KIND = kind;
	}
	public void working(int usingpower) {
		currenFunction= "일을 하고 있다!";
		System.out.println(ROBOT_CLASSES+"분류로 되어 있는 "+
		KIND+"로봇이 일을 한다");
		System.out.println("소모 전력:"+usingpower);
		REST_POWER-= usingpower;
		System.out.println("남은 전력:"+REST_POWER);
	}
	public void attack(int usingpower) {
		currenFunction= "공격을 하고 있다!";
		System.out.println(ROBOT_CLASSES+"분류로 되어 있는 "+
		KIND+"로봇이 공격을 한다");
		System.out.println("소모 전력:"+usingpower);
		REST_POWER-= usingpower;
		System.out.println("남은 전력:"+REST_POWER);
	}	
	public String getKIND() {
		return KIND;
	}
	public String getCurrenFunction() {
		return currenFunction;
	}	
}


