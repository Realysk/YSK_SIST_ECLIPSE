package diexp.vo7;
// 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Mart {
	private String mname;
	
	@Autowired
	private Product prod;
	private ArrayList<Product> plist;
	
	public Mart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mart(String mname) {
		super();
		this.mname =mname;
		plist = new ArrayList<Product>();
	}
	public void show() {
		System.out.println("마트명:"+mname);
		if(prod!=null) {
			System.out.println("구매한 물건 정보");
			System.out.println(prod.getName());
			System.out.println(prod.getPrice());
			System.out.println(prod.getCnt());
		}
	}
	public void showAll() {
		System.out.println("마트명:"+mname);
		if(plist.size()>0) {
		System.out.println("구매 물품들!!");
			for(Product pro:plist) {
				System.out.print(pro.getName()+"\t");
				System.out.print(pro.getPrice()+"\t");
				System.out.print(pro.getCnt()+"\n");
			}
		}
		
	}
	public ArrayList<Product> getPlist() {
		return plist;
	}
	public void setPlist(ArrayList<Product> plist) {
		this.plist = plist;
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
	// property명을 product1로 선언..
	public void setProduct1(Product prod) {
		this.prod = prod;
	}	
	
}
