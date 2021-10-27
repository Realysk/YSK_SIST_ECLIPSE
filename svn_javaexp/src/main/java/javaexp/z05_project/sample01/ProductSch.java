package javaexp.z05_project.sample01;

public class ProductSch {
	// 물건명 [   ] 가격 [1000   ] ~ [2000   ]
	private String name;
	private int fr_price;
	private int to_price;
	
	
	public ProductSch() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ProductSch(String name, int fr_price, int to_price) {
		super();
		this.name = name;
		this.fr_price = fr_price;
		this.to_price = to_price;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFr_price() {
		return fr_price;
	}
	public void setFr_price(int fr_price) {
		this.fr_price = fr_price;
	}
	public int getTo_price() {
		return to_price;
	}
	public void setTo_price(int to_price) {
		this.to_price = to_price;
	}
	
}
