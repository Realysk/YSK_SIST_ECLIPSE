package diexp.vo9;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Buyer {

	private String name;
	@Autowired
	private Product product;
	
	public Buyer() {
		super();
		// TODO Auto-generated constructor stub
		name = "익명";
	}
	
	public void show() {
		System.out.println("구매자 : " + name);
		if(product != null) {
			System.out.println("# 구매 정보 #");
			System.out.println("물건명 : " + product.getName());
			System.out.println("가격 : " + product.getPrice());
			System.out.println("수량 : " + product.getCnt());
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
