package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a02_Cart;

import java.util.Scanner;

import javaexp.z05_project.z05_project_ProjectModule00_sample.Model;

public class CartMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# MARRPLE 장바구니 #\n");
//		관리자용으로 입력받는 메뉴이나 이번 프로젝트에는 따로 분할하지 않음.
		System.out.println("\n# (관리자용) MARPPLE 주문 번호 #");
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
		if(tot1 >= 50000) {
			System.out.println("배송비 : " + (delivery - delivery) + "원");
		} else {
			System.out.println("배송비 : " + delivery + "원");
			System.out.println("* 50000원 이상 구매 시 배송비 무료! *");
		}
		int tot2 = tot1;
		if(tot1 >= 50000) {
			System.out.println("총 가격 : " + tot2 + "원");
		} else {
			System.out.println("총 가격 : " + (tot2 + delivery) + "원");
		}
		
		System.out.println("\n# 장바구니 담기 성공! #\n");
		
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		CartDTO cart = new CartDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2);
		// Controller만 호출
		CartController cctrl = new CartController();
		System.out.println("\n# 호출된 화면 #\n");
//		Scanner sc = new Scanner(System.in);
		System.out.println(cctrl.CartList2(cart, new Model()));

	}

}
