package Project_SIST.Java.A02_Marpple.Buy;

import Project_SIST.Java.A02_Marpple.Buy.Model;

public class BuyController {
	
	private BuyService service = new BuyService();
	
	public String BuyList2(BuyDTO b, Model d) {
		
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 상품 장바구니 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("상품 번호 : " + b.getProdkey());
		System.out.println("상품명 : " + b.getProdName());
		System.out.println("가격 : " + b.getPrice());
		System.out.println("수량 : " + b.getCnt());
		System.out.println("상품 총 가격 : " + b.getTot1());
		System.out.println("배송비 : " + b.getDelivery());
		System.out.println("총 가격 : " + b.getTot2() + "\n");
		/*
		  Controller => Service => Dao (DB 처리)
 					<=		  <=
		 */
		
		// view단에 넘겨 줄 데이터 key, object
		d.addAttribute("blist", service.buyList(b));
		// 화면단에 대한 호출
		return "상품구매내역.jsp";
//		return "경로/@@@.jsp";
	}
}