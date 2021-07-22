package jspexp.a01_start;

public class A03_Product {
	
	private String name;
	private int price;
	private int cnt;
	
	public A03_Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public A03_Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
