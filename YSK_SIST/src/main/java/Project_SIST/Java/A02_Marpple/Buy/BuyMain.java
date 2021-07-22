package Project_SIST.Java.A02_Marpple.Buy;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import Project_SIST.Java.A02_Marpple.Buy.Model;
import Project_SIST.Java.A02_Marpple.Cart.CartDTO;

public class BuyMain {

	public static String java;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# MARRPLE 장바구니 #\n");
//		관리자용으로 입력받는 메뉴이나 이번 프로젝트에는 따로 분할하지 않음.
		System.out.println("# (관리자용) MARPPLE 주문 번호 #");
		System.out.print("\n주문 번호 (CA_005) : ");
		String prodkey = sc.nextLine();
		System.out.println("상품명 : ");
		String prodName = sc.nextLine();
		System.out.print("가격 : ");
		int price = sc.nextInt();
		System.out.print("수량 : ");
		int cnt = sc.nextInt();
		int tot1 = price*cnt;
		System.out.println("상품 총 가격 : " + tot1 + "원");
		int delivery = 2500;
		if(tot1 > 49999) {
			System.out.println("배송비 : " + (delivery - delivery) + "원");
		} else {
			System.out.println("배송비 : " + delivery + "원");
			System.out.println("* 50000원 이상 구매 시 배송비 무료! *");
		}
//		int tot2 = tot1;
		int tot2 = tot1 + delivery;
		if(tot1 >= 50000) {
			System.out.println("총 가격 : " + (tot2 - delivery) + "원");
		} else {
			System.out.println("총 가격 : " + tot2 + "원");
		}
		
		System.out.println("\n# 장바구니 담기 성공! #\n");
		
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		BuyDTO buys = new BuyDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2);
		// Controller만 호출
		BuyController bctrl = new BuyController();
		System.out.println("\n# 호출된 화면 #\n");
//		Scanner sc = new Scanner(System.in);
		System.out.println(bctrl.BuyList2(buys, new Model()));
		
		System.out.println("===============================================\n");
		System.out.println("# MARRPLE 장바구니 상품 구매 #\n");
//		상품 구매를 위한 사용자가 입력한 정보를 불러온다.
		ArrayList<BuyDTO> blist = new ArrayList<BuyDTO>();
		Scanner sc2 = new Scanner(System.in);
		System.out.print("* 구매 예정인 상품 정보 *\n");
		System.out.println(new CartDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2));
		// 상품 구매를 위한 개인정보 입력
		System.out.println("상품 주문을 위해 개인 정보를 입력하세요.\n");
		String id;
		System.out.println("ID(EMAIL) : ");
		id = sc2.nextLine();
		String pw;
		System.out.println("PW : ");
		pw = sc2.nextLine();
		String name;
		System.out.println("이름 : ");
		name = sc2.nextLine();
		String address;
		System.out.println("주소 : ");
		address = sc2.nextLine();
		System.out.println("\n# 개인 정보 입력 확인 #\n");
		System.out.println("ID : " + id + "\n" + "PW : " + pw + "\n" + "이름 : " + name + "\n" + "주소 : " + address + "\n");
		System.out.println("# 상품 구매 정보 확인 #");
		System.out.println(new CartDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2));
		
//		상품 구매 최종 여부
		System.out.println("# 상품 구매를 확정하시겠습니까? (Y/N) #\n");
		String payCheck = sc2.nextLine();
		if(payCheck.equals("Y")) {
//			상품 구매 확정 시 이동
			System.out.println("# 상품 주문이 완료되었습니다! #\n");
			System.out.println("- 주문자 정보 -");
			System.out.println("ID : " + id + "\n" + "PW : " + pw + "\n" + "이름 : " + name + "\n" + "주소 : " + address + "\n");
			System.out.println("# 주문 상품 영수증 #");
			blist.add(buys);
			System.out.println(new CartDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2));
			System.out.println("이용해주셔서 감사합니다!");
			System.out.println("\n===============================================\n");
			BuyMain bin = new BuyMain();
			bin.main(args);
			
		} else {
//			상품 구매 확정 취소 -> 메인 이동
			System.out.println("상품 구매를 취소했습니다.");
			System.out.println("메인으로 이동합니다.");
			System.out.println("\n===============================================\n");
			BuyMain bin = new BuyMain();
			bin.main(args);
		}
}
}