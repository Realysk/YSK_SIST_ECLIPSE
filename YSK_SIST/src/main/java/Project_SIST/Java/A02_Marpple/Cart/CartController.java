package Project_SIST.Java.A02_Marpple.Cart;

import java.util.Scanner;

import Project_SIST.Java.A02_Marpple.Buy.Model;

public class CartController {
	
	private CartService service = new CartService();
	
	public String CartList2(CartDTO c, Model d) {
		
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 상품 장바구니 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("상품 번호 : " + c.getProdkey());
		System.out.println("상품명 : " + c.getProdName());
		System.out.println("가격 : " + c.getPrice());
		System.out.println("수량 : " + c.getCnt());
		System.out.println("상품 총 가격 : " + c.getTot1());
		System.out.println("배송비 : " + c.getDelivery());
		System.out.println("총 가격 : " + c.getTot2() + "\n");
		/*
		  Controller => Service => Dao (DB 처리)
 					<=		  <=
		 */
		
		// view단에 넘겨 줄 데이터 key, object
		d.addAttribute("clist", service.cartList(c));
		// 화면단에 대한 호출
		return "장바구니_정보.jsp";
//		return "경로/@@@.jsp";
	}
}
