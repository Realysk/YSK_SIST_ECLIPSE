package springweb.z01_vo;

public class Cart {
	private int no;
	private String title;
	private String kind;
	private int pay;
	private int cnt;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cart(int no) {
		super();
		this.no = no;
	}

	public Cart(int no, String title, String kind, int pay, int cnt) {
		super();
		this.no = no;
		this.title = title;
		this.kind = kind;
		this.pay = pay;
		this.cnt = cnt;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
