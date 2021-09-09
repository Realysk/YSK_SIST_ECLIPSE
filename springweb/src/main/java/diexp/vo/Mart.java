package diexp.vo;
// diexp.vo.Mart

public class Mart {
	
	private String mname;
	private Product prod;
	
	public Mart(String mname) {
		super();
		this.mname = mname;
	}
	
	public void show() {
		System.out.println("마트명 : " + mname);
		if(prod!=null) {
			System.out.println("구매한 물건 정보");
			System.out.println(prod.getName());
			System.out.println(prod.getPrice());
			System.out.println(prod.getCnt());
		}
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Product getProd() {
		return prod;
	}

	public void setProd(Product prod) {
		this.prod = prod;
	}
	
}
