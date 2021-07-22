package Project_SIST.Java.A02_Marpple.Cart;

import java.util.ArrayList;

public class CartDAO {
	/*
	// select * 
	// from product
	// where name like '%'||'물건명'||'%'
	//  and price between 가격의최소 and 가격의최대; 
	==> java 객체로 할당 전달..
	 */
		
		// 입력값에 의해서 처리한 ArrayList리턴해준다.
		public ArrayList<CartDTO> cartList(CartDTO ca){
			ArrayList<CartDTO> clist  = new ArrayList<CartDTO>();
			
			clist.add(new CartDTO(ca.getProdkey(), ca.getProdName(), ca.getPrice(),
					ca.getCnt(), ca.getTot1(), ca.getDelivery(), ca.getTot2()));
			
		    // 장바구니 상품 정보를 확인하기 위한 메소드
			System.out.println("\n===============================================\n");
			System.out.println("# DB 서버에 넘겨 줄 장바구니 데이터 #\n");
			System.out.println("상품 번호 : " + ca.getProdkey());
			System.out.println("상품명 : " + ca.getProdName());
			System.out.println("가격 : " + ca.getPrice());
			System.out.println("수량 : " + ca.getCnt());
			System.out.println("상품 총 가격 : " + ca.getTot1());
			System.out.println("배송비 : " + ca.getDelivery());
			System.out.println("총 가격 : " + ca.getTot2() + "\n");
			System.out.println("===============================================\n");
			System.out.println("# DB 서버에서 온 장바구니 데이터 리스트 #\n");
			clist.add(new CartDTO("CA_004","투명 폰 스트랩", 5400, 3, 16200, 2500, 18700));
			clist.add(new CartDTO("CA_003","아이폰 12 PRO MAX 투명 범퍼케이스 (블랙)", 21900, 4, 87600, 0, 87600));
			clist.add(new CartDTO("CA_002","페어플레이 에센셜 후드 집업", 33000, 1, 33000, 2500, 35500));
			clist.add(new CartDTO("CA_001","챔피온 스트릿 후드", 37900, 2, 75800, 0, 75800));
//			System.out.println("===============================================\n");
			for(CartDTO cart:clist) {
				System.out.print("상품 번호 : " + cart.getProdkey() + "\n");
				System.out.print("상품명 : " + cart.getProdName() + "\n");
				System.out.print("가격 : " + cart.getPrice() + "\n");
				System.out.print("수량 : " + cart.getCnt() + "\n");
				System.out.print("상품 총 가격 : " + cart.getTot1() + "\n");
				System.out.print("배송비 : " + cart.getDelivery() + "\n");
				System.out.print("총 가격 : " + cart.getTot2() + "\n");
				System.out.println("\n");
			}
			return clist;
		}


}