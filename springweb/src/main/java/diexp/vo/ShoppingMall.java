package diexp.vo;

public class ShoppingMall {
	
	private String mall;
	private Member mem;
	
	public ShoppingMall(String mall) {
		super();
		this.mall = mall;
	}
	
	public void show() {
		System.out.println(mall + " 쇼핑몰의 회원 정보");
		if(mem!=null) {
			System.out.println("회원 정보");
			System.out.println("ID : " + mem.getId());
			System.out.println("PASS : " + mem.getPass());
			System.out.println("NAME : " + mem.getName());
			System.out.println("AUTH : " + mem.getAuth());
			System.out.println("POINT : " + mem.getPoint());
		}
	}

	public String getMall() {
		return mall;
	}

	public void setMall(String mall) {
		this.mall = mall;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}
	
}
