package javaexp.a00_exp;

import java.util.ArrayList;

public class A13_0520 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
1. 클래스의 구성요소의 특징과 활용에 대하여 기술하세요.
	class Product{
		private String name; // 필드
		private int cnt; // 필드
		Product(String name){ // 생성자로 주로 필드를 초기화
			this.name = name;
			// 객체가 생성될 때, 바로 초기화가 필요할 필드인지?
			// 메서드를 통해서 변경하는 부분인지 판단..
			// cf) 구매하는 경우에는 cnt를 기능메서드로 처리
			//     입고하는 경우 물건명과 입고의 갯수를 같이 
			 ///    담아서 처리해야 한다.
		}
		// 기능 메서드 처리 : 입력값? 
		//  	처리할 내용(저장, 누적, 조건/반복처리)
		//      리턴할 데이터 여부 판단.
		public void buy(int cnt){
			this.cnt = cnt;
			
		}
		
		
	
	}
2. 가계부의 입출입 내역을 클래스로 만들고, 입출입 내역과 잔액을 출력하세요
    Record (날짜, 내용, 구분, 금액)
       메서드 : write(구분,금액)  구분으로 수입이면 금액을 +값으로
        지출이면 금액을 -리턴하여 처리하세요.
    위 입출입내역 Record를 3개 정도 만들고 현 잔액을 출력하세요.   
*/
		Record r1 = new Record();
		Record r2 = new Record();
		Record r3 = new Record();
		int tot = 0;
		tot+=r1.write("5/01", "이월금", true, 300000);
		tot+=r2.write("5/25", "차비", false, 5000);
		tot+=r3.write("5/25", "식비", false, 10000);
		System.out.println("현잔액:"+tot);		
		System.out.println("# 하나의 객체로 기능 메서드 처리 #");
		tot=0;
		Record r4 = new Record();
		// 기능 메서드를 처리한 경우에 각각의 데이터를 변경할 수 있기 때문에
		// 하나의 객체로 사용이 가능하다.
		tot+=r4.write("5/26", "이월금", true, 100000);
		tot+=r4.write("5/27", "차비", false, 5000);
		tot+=r4.write("5/28", "식비", false, 10000);
		System.out.println("현잔액:"+tot);		
		
/*		
3. Visitor(방문객의 이름, 나이)이  Museum(박물관)에 방문한 내용을 
    1:1관계로 처리 하세요.
*/
		Museum m01 = new Museum("유럽 고대 명화전");
		m01.showVisitor();
		m01.setVisitor(new Visitor("홍길동", 25));
		m01.showVisitor();
		
/*		
4. BookStore에 서점명 구매도서(Book)을 1:다관계로 구매와 구매내역을
처리하는 프로그램을 만드세요.
*/
		// (String title, int price, String writer, int cnt) 
		BookStore b1 = new BookStore("교보문구");
		b1.showBuyList();
		b1.buyBook(new Book01("자바기초",28000,"자바맨",2));
		b1.buyBook(new Book01("JSP",32000,"웹의신",3));
		b1.buyBook(new Book01("스프링완성",35000,"프레임맨",3));
		b1.showBuyList();
		
/*
5. Computer(회사명, 기타 객체, add(부품), showInf())객체 안에, 
    Cpu(제조사,사양), Ram(제조사,사양), Hdd(제조사, 사양)을 할당하여
    showInfo()로 해당 컴퓨터의 부품내역을 출력하세요.
    *1단계) Computer 하위에 선언..
    2단계) ArrayList에 할당해서 처리.
    *3단계) 다형성설정 클래스 구성 ArrayList<PartComp>
 * */
		Computer c1 = new Computer("맥PC");
		//c1.showInfo();
		c1.addCpu(new Cpu("MS","3.6GHz"));
		c1.addRam(new Ram("삼성","16G"));
		c1.addHdd(new Hdd("삼성","500G"));
		c1.showInfo();
		System.out.println("## 3단계 다형성 부품 처리 ##");
		Computer2 c2 = new Computer2("삼성PC");
		c2.showPartList();
		c2.addPartComp(new Cpu2("MS","i7 3.3GHz"));
		//c2.addPartComp(new Cpu2("MS","i5 3.0GHz"));
		c2.addPartComp(new Ram2("하이닉스","8G"));
		c2.addPartComp(new Ram2("삼성전자","16G"));
		c2.addPartComp(new Hdd2("삼성전자","SSD 250G"));
		c2.addPartComp(new Hdd2("삼성전자","SSD 500G"));
		c2.showPartList();
		
	}
}
class Computer{
	private String company;
	private Cpu cpu;
	private Ram ram;
	private Hdd hdd;
	public Computer(String company) {
		super();
		this.company = company;
	}
	public void showInfo() {
		System.out.println("# 컴퓨터 #");
		System.out.println("제조사:"+company);
		if(cpu!=null) { 
			cpu.showInfo(); 
		}else{
			System.out.println("cpu장착이 안되었습니다.");
		}
		if(ram!=null) { 
			ram.showInfo(); 
		}else{
			System.out.println("ram장착이 안되었습니다.");
		}
		if(hdd!=null) { 
			hdd.showInfo(); 
		}else{
			System.out.println("hdd장착이 안되었습니다.");
		}
		
	}
	
	// 기능 메서드를 통해 부품 장착
	public void addCpu(Cpu cpu) {
		this.cpu = cpu;
	}
	public void addRam(Ram ram) {
		this.ram = ram;
	}
	public void addHdd(Hdd hdd) {
		this.hdd = hdd;
	}
	
	
}
class Computer2{
	private String company;
	private ArrayList<PartComp> plist;
	public Computer2(String company) {
		super();
		this.company = company;
		plist = new ArrayList<PartComp>();
	}
	//  상위        =   하위(); 다형성이 일어났기때문에 가능하다.
	// PartComp pc = new Cpu2("MS","3.6GHz 6core");
	//  
	// com2.addPartComp(new Cpu2("MS","3.6GHz 6core"));
	public void addPartComp(PartComp pc) {
		plist.add(pc);
		System.out.println("# 부품 장착 #");
		System.out.println(pc.getKind()+"추가 장착");
	}
	public void showPartList() {
		System.out.println("# 컴퓨터의 부품 현황 #");
		System.out.println("컴퓨터 제조사:"+company);
		if(plist.size()==0) {
			System.out.println("부품은 없습니다.");
		}else {
			System.out.println("종류\t제조사\t사양");
			for(PartComp c:plist) {
				// 재정의한 메서드 호출, 각 부품별로 
				// 다르게 정의한 내용이 출력된다. ****
				c.show();
			}
		}
		
	}
}


abstract class PartComp{
	private String kind;
	private String company;
	private String spec;
	public PartComp(String kind, String company, String spec) {
		super();
		this.kind = kind;
		this.company = company;
		this.spec = spec;
	}
	// 개별적으로 하위 클래스에서 재정의할 부분
	abstract void show();
	// 공통적인 처리 부분..
	public void showCom() {
		System.out.print(kind+"\t");
		System.out.print(company+"\t");
		System.out.print(spec+"\n");		
	}
	public String getKind() {
		return kind;
	}
	
}
class Cpu2 extends PartComp{
	public Cpu2(String company, String spec) {
		super("CPU",company,spec);
	}
	@Override
	void show() {
		// TODO Auto-generated method stub
		// 하위 객체마다 추가적으로 처리할 내용.
		System.out.println("# CPU 부품 정보 #");
		// 공통정보 사용할 수 있게 처리
		showCom();
	}
}
class Ram2 extends PartComp{
	public Ram2(String company, String spec) {
		super("RAM", company, spec);
		// TODO Auto-generated constructor stub
	}
	@Override
	void show() {
		System.out.println("* Ram 부품 정보 *");
		showCom();
	}
}
class Hdd2 extends PartComp{
	public Hdd2(String company, String spec) {
		super("HDD", company, spec);
	}
	@Override
	void show() {
		System.out.println("@ Hdd 부품 정보 @");
		showCom();
	}
}


class Cpu{
	private String company;
	private String spec;
	public Cpu(String company, String spec) {
		super();
		this.company = company;
		this.spec = spec;
	}
	public void showInfo() {
		System.out.println("# CPU 정보 #");
		System.out.print(company+"\t");
		System.out.print(spec+"\n");
	}
}
class Ram{
	private String company;
	private String spec;
	public Ram(String company, String spec) {
		super();
		this.company = company;
		this.spec = spec;
	}
	public void showInfo() {
		System.out.println("# Ram 정보 #");
		System.out.print(company+"\t");
		System.out.print(spec+"\n");
	}
}
class Hdd{
	private String company;
	private String spec;
	public Hdd(String company, String spec) {
		super();
		this.company = company;
		this.spec = spec;
	}
	public void showInfo() {
		System.out.println("# Hdd 정보 #");
		System.out.print(company+"\t");
		System.out.print(spec+"\n");
	}
}
// 
class BookStore{
	private String name;
	private ArrayList<Book01> blist;
	public BookStore(String name) {
		super();
		this.name = name;
		// 동적 물건처리 객체 초기화..
		blist = new ArrayList<Book01>();
	}
	// 구매할 물건을 전체 저장..
	public void setBlist(ArrayList<Book01> blist) {
		this.blist = blist;
	}
	// 하나하나 구매 목록을 추가 처리..
	public void buyBook(Book01 b) {
		blist.add(b);
	}
	public void showBuyList() {
		System.out.println(name+" 서점에 방문하여 구매한 도서리스트");
		// if( 객체 != null)
		// 생성자에서 동적인 배열 객체인 ArrayList를 생성했기 때문에
		// 메모리 확인보다는 크기를 기준으로 처리하여야 한다.
		if(blist.size()==0) {
			System.out.println("구매 목록이 없습니다.");
		}else {
			System.out.println("번호\t도서명\t저자\t가격\t권수\t계");
			int tot=0;
			for(int idx=0;idx<blist.size();idx++) {
				Book01 b1 = blist.get(idx);
				tot+=b1.showBuyInfo(idx);
			}
			System.out.println("총 구매 비용:"+tot);
		}
	}
}
class Book01{
	private String title; 
	private int price;
	private String writer;
	private int cnt;
	public Book01() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book01(String title, int price, String writer, int cnt) {
		super();
		this.title = title;
		this.price = price;
		this.writer = writer;
		this.cnt = cnt;
	}
	public int showBuyInfo(int idx) {
		System.out.print(idx+1+"\t");
		System.out.print(title+"\t");
		System.out.print(writer+"\t");
		System.out.print(price+"\t");
		System.out.print(cnt+"\t");
		System.out.print(price*cnt+"\n");
		return price*cnt;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}


//  Record (날짜, 내용, 구분, 금액)
class Record{
	private String date;
	private String content;
	private boolean isIncome;
	private int money;
	public int write(String date, String content,
			boolean isIncome, int money) {
		this.date = date;
		this.content = content;
		this.isIncome = isIncome;
		this.money = money;
		System.out.println("# 입출금 내역 등록 #");
		System.out.println("날짜:"+date);
		System.out.println("내용:"+content);
		System.out.println("구분:"+(isIncome?"수입":"지출"));
		System.out.println("금액:"+money);
		return isIncome?money:-money;
	}
}
class Visitor{
	private String name;
	private int age;
	public Visitor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Visitor(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
class Museum{
	private String name;
	private Visitor visitor;
	public Museum() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Museum(String name) {
		super();
		this.name = name;
	}
	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
		System.out.println(name+" 박물관에 ");
		System.out.println(visitor.getName()+" 방문했습니다.");
	}
	public void showVisitor() {
		System.out.println(name+" 박물관에 방문객 정보");
		if(visitor != null) {
			System.out.println("이름:"+visitor.getName());
			System.out.println("나이:"+visitor.getAge());
		}else {
			System.out.println("방문객이 없습니다!!");
		}
	}
	
}



