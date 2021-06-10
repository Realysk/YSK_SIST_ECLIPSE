package javaexp.a00_exp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

abstract class Worker{
	private String kind;
	public Worker() {}
	
	public Worker(String kind) {
		super();
		this.kind = kind;
	}
	public String getKind() {
		return kind;
	}	
	// 공통 기능메서드
	public void goWork() {
		System.out.println(kind+" 출근하다");
	}
	// 추상 메서드..
	public abstract void working();
	public void goHome() {
		System.out.println(kind+" 퇴근하다");
	}

	
}
// 상속은 상위에 생성자를 선언하여야 한다.
class PoliceMan extends Worker{
	// new PoliceMan()
	// new PoliceMan("홍길동")
	public PoliceMan() {
		super("경찰관");
		// super("매개값") : 상속시, 상위의 선언된 생성자를
		// 반드시 하위에서 선언하여야 한다.
		
		// TODO Auto-generated constructor stub
	}
	public PoliceMan(String name) {
		super(name);
		// super("매개값") : 상속시, 상위의 선언된 생성자를
		// 반드시 하위에서 선언하여야 한다.
		
		// TODO Auto-generated constructor stub
	}	
	@Override
	public void working() {
		System.out.println(getKind()+" 치안을 유지하다.");
	}
}
class FireMan extends Worker{

	public FireMan() {
		super("소방관");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void working() {
		System.out.println(getKind()+ " 불을 끄다.");
	}
}
class Progammer extends Worker{
	public Progammer() {
		super("프로그래머");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void working() {
		System.out.println(getKind()+" 소프트웨어 개발을 하다.");
	}
}
class Fruit{
	private String kind;
	private String color;
	public Fruit(String kind, String color) {
		super();
		this.kind = kind;
		this.color = color;
	}
	public void show() {
		System.out.println(color+"색 "+kind);
	}
}
public class A07_0511 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		1. 추상클래스와 하위객체 배열형식을 선언하고,
//		    상위추상클래스로 Worker 공통: 출/퇴근, working()오버라이딩, 하위 PoliceMan, FireMan, Programmer
//		    로 처리하여, 배열로 처리하고,
//		    for문을 통해서 출/퇴근 working()메서드를 처리하세요.
			/*
			추상클래스 []배열 = {new 하위상속생성자(), new 하위상속생성자(),....};
			 * 
			 * */
		Worker[]arry = {new PoliceMan(),new FireMan(),new Progammer()};
		for(Worker w:arry) {
			w.goWork();
			w.working();
			w.goHome();
		}
//		2. Collection 하위의 핵심 interface의 특성을 기술하세요.
//			Set : 중복허용하지 않음, 순서확보 안됨.
//			List : 중복허용, 순서확보
//			Map : key 중복허용하지 않음, 순서확보 안됨
//		3. Set 하위 객체를 통해 항아리에 담긴 여러 색상의 과일(Fruit(종류,색상))을 담고 출력처리하세요.
		Set<String> setStr = new HashSet<String>();
		setStr.add("사과(빨강)");
		setStr.add("사과(녹색)");
		setStr.add("키위(초록)");
		setStr.add("키위(초록)");
		setStr.add("키위(초록)");
		setStr.add("파인애플(초록)");
		for(String str:setStr) {
			System.out.println(str);
		}
		
		Set<Fruit> setFru = new HashSet<Fruit>();
		setFru.add(new Fruit("사과","빨강"));
		setFru.add(new Fruit("사과","녹"));
		setFru.add(new Fruit("키위","초록"));
		setFru.add(new Fruit("키위","노랑"));
		for(Fruit f:setFru) {
			f.show();
		}

		
		
//		4. List 하위 객체로 반복문을 이용하여, 
//		    1) 선택1 학생 5명의 이름 국어,영어,수학 속성을 ArrayList<Student>객체 담아서 출력하기
		List<Student> slist = new ArrayList<Student>();
		slist.add(new Student("홍길동",70,80,90));
		slist.add(new Student("김길동",100,80,90));
		slist.add(new Student("신길동",90,85,90));
		slist.add(new Student("마길동",90,90,90));
		for(Student st:slist) {
			System.out.print(st.getName()+"\t");
			System.out.print(st.getKor()+"\t");
			System.out.print(st.getEng()+"\t");
			System.out.print(st.getMath()+"\n");
		}
//		    2) 선택2 Card의 속성(모양,번호)로 설정하여 ArrayList<Card>에 담고,
//		        A팀 : 카드 7장 임의 ♠7, ♥A, ♥J
//		        B팀 : 카드 7장 임의   출력 
		String []shapes= {"♠","♥","◆","♣"};
		String []numbs = {"A","2","3","4","5","6",
						"7","8","9","10","J","Q","K"};
		ArrayList<Card> list = new ArrayList<Card>();
		for(String s:shapes) {
			for(String n:numbs) {
				list.add(new Card(s,n));
			}
		}
		// 모양별로 번호 13만들면 총카드가 52개가 ArrayList<Card>가 만들어 진다.
		
		
		// 중복 허용 로직..
		System.out.println("# 중복 허용 처리 #");
		// 7장씩 총 14개
		for(int cnt=1;cnt<=14;cnt++) {
			// 0~52 까지 임의의 index번호를 호출..
			int ranIdx = (int)(Math.random()*list.size());
			if(cnt<=7) {
				if(cnt==1) {System.out.print("A팀:");}
				// list.get(ranIdx) : 임의의 ArrayList안에 있는 Card객체.
				// .show()
				list.get(ranIdx).show();
			}else {
				if(cnt==8) {System.out.print("\nB팀:");}
				list.get(ranIdx).show();				
			}
		}
		
		System.out.println("\n# shuffle #");
		// Collections.shuffle(리스트형객체)
		// 리스트형객체를 순서를 임의로 섞어주는 역할을 한다.
		Collections.shuffle(list);
		
		
		for(int cnt=1;cnt<=14;cnt++) {
			if(cnt<=7) {
				if(cnt==1) {System.out.print("A팀:");}
				list.get(cnt-1).show();
			}else {
				if(cnt==8) {System.out.print("\nB팀:");}
				list.get(cnt-1).show();				
			}
		}		
//		5. Map 하위의 기능 메서드를 기술하세요
/*			put("key", value객체) : key와 value값을 할당 처리..
			get(키값) : key에 해당하는 값을 가져와서 처리한다.
			
 * */		
		
//		6. InputStream 기본 형식과 메서드를 기술하세요.
/*			InputStream is = null;
 * 			is = System.in;
 * 			InputStream을 통해서 입력된 객체를 할당.
 * 			read() : 1byte의 char타입 문자를 읽는다.
 * 			new BufferedReader(new InputStreamReader(System.in));
 * 			InputStreamReader : 2byte이상 문자열을 처리
 * 			BufferedReader : line별로 입력 처리.
 * 
 * 
 * */		
//		7. char를 code값을 이용해서, 숫자+알파벳이 섞인 임시비밀번호 7자리를 만들어 출력하세요.
		String pass=""; // 48~57(10), 65~90(26), 97~122(26)
		/*
	    for(int cnt=1;cnt<200;cnt++) {
	    	System.out.println(cnt+":"+(char)cnt);
	    }
	    */
	    // # 임의의 나오는 수에 대한 코드값의 변경..
	    // 48 ~ 57 : 그대로 ===>  48 ~ 57
	    // 58 ~ 84 : +8	   ==>  65 ~ 90 
	    // 85 ~ 111 : + 12  ==> 97~122
		for(int cnt=1;cnt<=7;cnt++) {
			// 총 62가지의 경우의 수, 48부터 시작..
			int code = (int)(Math.random()*62+48);
			if(code>=85) code+=12;
			else if(code>=58) code+=8;
			pass+=(char)code;
		}
		System.out.println("\n임의 비밀번호:"+pass);
		
//		8. Scanner 객체를 이용하여 프로야구 선수(Player) 3명의 이름과
//		성적을 입력하고, 출력처리하세요.
		ArrayList<Player> plist = new ArrayList<Player>();
		Scanner sc = new Scanner(System.in);
		for(int cnt=1;cnt<=3;cnt++) {
			System.out.println("## "+cnt+"번째 선수 정보 등록 ##");
			System.out.print("이름을 입력하세요:");
			String name = sc.nextLine();
			System.out.print("성적을 입력하세요:");
			String record = sc.nextLine();
			plist.add(new Player(name,record));
		}
		System.out.println("# 입력된 데이터 #");
		for(Player p:plist) {
			p.show();
		}
		
		
	}
}
class Player{
	private String name;
	private String record;
	public Player(String name, String record) {
		super();
		this.name = name;
		this.record = record;
	}
	public void show() {
		System.out.println(name+"\t"+record);
	}
	
}


class Card{
	private String shape;
	private String number;
	public Card(String shape, String number) {
		super();
		this.shape = shape;
		this.number = number;
	}
	public void show() {
		System.out.print(shape+number+"\t");
	}
}




