package javaexp.a05_object.vo;

/*
ex) Product2.java로 선언하여 물건명 가격 갯수를 필드로 처리하되 toString()에는 해당 필드와 계까지 리턴하여 선언되게 하고 참조변수로 해당 내용을 출력해보세요.
*/

public class Product2 {
	private String name;
	private int price;
	private int cnt;
	private int tot = price*cnt;

	public Product2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product2(String name, int price, int cnt, int tot) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
		this.tot = tot;
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
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	
	@Override
	public String toString() {
		return super.toString() + "Product2 [name=" + name + ", price=" + price + ", cnt=" + cnt + ", 총계 = " + tot + "]";
	}
	public static void main(String args[]) {
		Product2 p2 = new Product2();
		System.out.println(p2);
	}

}
