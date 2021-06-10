package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a03_Buy;

import java.util.ArrayList;

public class BuyService {
   
	BuyDAO bdao = new BuyDAO(); 
   public ArrayList<BuyDTO> buyList(BuyDTO buy) {
		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
		System.out.println("CartDAO에 전송 할 장바구니 데이터 1 (상품 번호) : " + buy.getProdkey());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 2 (상품명) : " + buy.getProdName());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 3 (가격) : " + buy.getPrice());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 4 (수량) : " + buy.getCnt());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 5 (상품 총 가격) : " + buy.getTot1());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 6 (배송비) : " + buy.getDelivery());
		System.out.println("CartDAO에 전송 할 장바구니 데이터 7 (총 가격) : " + buy.getTot2());
		System.out.println("CartDAO에서 받을 장바구니 데이터 크기 : " + bdao.buyList(buy).size() + "\n");
		return bdao.buyList(buy);
   }

}