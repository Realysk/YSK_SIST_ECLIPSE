package Project_SIST.Java.A02_Marpple.Buy;

import java.util.ArrayList;

public class BuyDAO {
	/*
	// select * 
	// from product
	// where name like '%'||'물건명'||'%'
	//  and price between 가격의최소 and 가격의최대; 
	==> java 객체로 할당 전달..
	 */
		
		// 입력값에 의해서 처리한 ArrayList리턴해준다.
		public ArrayList<BuyDTO> buyList(BuyDTO buy){
			ArrayList<BuyDTO> blist  = new ArrayList<BuyDTO>();
			
			blist.add(new BuyDTO(buy.getProdkey(), buy.getProdName(), buy.getPrice(),
					buy.getCnt(), buy.getTot1(), buy.getDelivery(), buy.getTot2()));
			
		    // 장바구니 상품 정보를 확인하기 위한 메소드
			System.out.println("\n===============================================\n");
			System.out.println("# DB 서버에 넘겨 줄 상품 구매 데이터 #\n");
			System.out.println("상품 번호 : " + buy.getProdkey());
			System.out.println("상품명 : " + buy.getProdName());
			System.out.println("가격 : " + buy.getPrice());
			System.out.println("수량 : " + buy.getCnt());
			System.out.println("상품 총 가격 : " + buy.getTot1());
			System.out.println("배송비 : " + buy.getDelivery());
			System.out.println("총 가격 : " + buy.getTot2() + "\n");
			System.out.println("===============================================\n");
			System.out.println("# DB 서버에서 온 장바구니 데이터 리스트 #\n");
			blist.add(new BuyDTO("CA_004","투명 폰 스트랩", 5400, 3, 16200, 2500, 18700));
			blist.add(new BuyDTO("CA_003","아이폰 12 PRO MAX 투명 범퍼케이스 (블랙)", 21900, 4, 87600, 0, 87600));
			blist.add(new BuyDTO("CA_002","페어플레이 에센셜 후드 집업", 33000, 1, 33000, 2500, 35500));
			blist.add(new BuyDTO("CA_001","챔피온 스트릿 후드", 37900, 2, 75800, 0, 75800));
//			System.out.println("===============================================\n");
			for(BuyDTO bu:blist) {
				System.out.print("상품 번호 : " + bu.getProdkey() + "\n");
				System.out.print("상품명 : " + bu.getProdName() + "\n");
				System.out.print("가격 : " + bu.getPrice() + "\n");
				System.out.print("수량 : " + bu.getCnt() + "\n");
				System.out.print("상품 총 가격 : " + bu.getTot1() + "\n");
				System.out.print("배송비 : " + bu.getDelivery() + "\n");
				System.out.print("총 가격 : " + bu.getTot2() + "\n");
				System.out.println("\n");
			}
			return blist;
		}


}