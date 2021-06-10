package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a03_Buy;

// 장바구니 담기 이후 상품 구매 입력을 위한 DTO 클래스

public class BuyDTO {
	private String Prodkey; // 주문 번호
	private String prodName; // 상품명
	private int price; // 가격
	private int cnt; // 수량
	private int tot1 = price*cnt; // 가격*수량 (배송비 제외 총 가격)
	private int delivery = 2500; // 배송비 (50000원 이상 주문시 무료)
	private int tot2 = (price*cnt) + 2500; // (배송비 포함 총 가격)
	public BuyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyDTO(String prodkey, String prodName, int price, int cnt, int tot1, int delivery, int tot2) {
		super();
		Prodkey = prodkey;
		this.prodName = prodName;
		this.price = price;
		this.cnt = cnt;
		this.tot1 = tot1;
		this.delivery = delivery;
		this.tot2 = tot2;
	}
	public String getProdkey() {
		return Prodkey;
	}
	public void setProdkey(String prodkey) {
		Prodkey = prodkey;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	public int getTot1() {
		return tot1;
	}
	public void setTot1(int tot1) {
		this.tot1 = tot1;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getTot2() {
		return tot2;
	}
	public void setTot2(int tot2) {
		this.tot2 = tot2;
	}
	@Override
	public String toString() {
		
		return  "\n" + "주문 번호 : " + Prodkey + "\n" + "상품명 : " + prodName + "\n" +
		"가격 : " + price + "\n" + "수량 : " + cnt + "\n" + "상품 총 가격 : " + tot1 + "\n" +
				"배송비 : " + delivery + "\n" + "총 가격 : " + tot2 + "\n";
	}
	
	
	
}
