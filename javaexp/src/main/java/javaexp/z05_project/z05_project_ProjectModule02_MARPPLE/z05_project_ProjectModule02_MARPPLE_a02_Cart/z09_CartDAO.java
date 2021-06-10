package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a02_Cart;
//package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a02_Cart;
//
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Scanner;
//
//
//public class z09_CartDAO {
//	
//    Scanner sc2 = new Scanner(System.in);
//    
//    ArrayList<CartDTO> buy = new ArrayList<>();
//    
//    // 생성자로 초기 데이터 입력
//    public z09_CartDAO() {
//    	buy.add(new CartDTO("슬리퍼","7000","5"));
//    	buy.add(new CartDTO("폰케이스","16000","6"));
//    	buy.add(new CartDTO("티셔츠","22000","1"));
//    	buy.add(new CartDTO("야구점퍼","47000","1"));
//    }
//        
//    // 장바구니 메뉴에 해당하는 작업이 실행됨
//    public void run() {
//        
//        int key = 0;
//        while ((key = menu()) != 0) {
//            switch (key) {
//                case 1:
//                	// 장바구니
//                    prodCart(); 
//                    break;
//                case 2:
//                	// 장바구니 리스트
//                	prodMember();
//                	break;
//                case 3:
//                	// 삭제
//                    prodDel();
//                    break;
//            }
//        }
//    }
//    // 장바구니에 담기 위해 상품 정보를 입력한다.
//    private void prodCart() {
//        
//        while(true) {
//        	sc2.nextLine();
//            
//        	// 장바구니에 담을 정보들을 메소드로 입력받는다.
//        	System.out.println("# 장바구니에 담을 상품 정보를 입력하세요. #");
//        	String prodName = getStrInput(" 상품명 : ");
//        	String price = getStrInput(" 가격 : ");
//        	String cnt = getStrInput(" 갯수 : ");
//            
//          	// 장바구니에 담을 상품을 정확히 입력할 시 장바구니 내역에 등록
//            if(prodName.equals(prodName) && price.equals(price) && cnt.equals(cnt)) {
//                buy.add(new CartDTO(prodkey,prodName,price,cnt,tot1,delivery,tot2));
//                System.out.println(" 해당 상품을 장바구니에 담았습니다. \n");
//                System.out.print("\n # 장바구니 리스트 # \n");
//    			System.out.println(" 상품명 : " + prodName + " * " + cnt + "\t");   
//                break;
//            } else {
//            	System.out.println(" 장바구니에 담을 상품 정보가 일치하지 않습니다.\n");
//                break;
//            }  
//        }
//    }
//    
//    // 장바구니 리스트를 확인하기 위한 메소드
//    private void prodMember() {
//        Iterator<CartDTO> ite2 = buy.iterator();
//        
//        while(ite2.hasNext()) {
//            System.out.println(ite2.next() + " ");
//        }
//    }
//
//	private void prodDel() {
//		// TODO Auto-generated method stub
//		while(true) {
//        	sc2.nextLine();
//            
//        	// '삭제' 메서드
//        	String del = getStrInput(" 해당 상품을 삭제하시겠습니까? (Y/N) : "); 
//            
//          	// '삭제'에 Y로 동의할 시 해당 상품이 삭제된다.
//            if(del.equals("Y")) {
//                System.out.println("\n 해당 상품이 삭제되었습니다.\n");
//                break;
//            } else {
//            	System.out.println("\n 해당 상품의 삭제를 취소했습니다.\n");
//            	break;
//            }
//	}
//}
//        
//    // 프로그램을 실행시키면 나오는 메뉴화면
//    private int menu() {
//        System.out.println("\n ## MARPPLE 장바구니 메뉴 ##");
//        return getNumInput("[1]장바구니 담기 [2]장바구니 리스트 [3]삭제 \n");
//    }
// 
//    // 문자열을 입력받을 때 사용
//    private String getStrInput(String msg) {
//        System.out.print(msg);
//        return sc2.nextLine();        
//    }
// 
//    // 정수형을 입력받을 때 사용
//    private int getNumInput(String msg) {
//        System.out.println(msg);
//        System.out.print("# 메뉴(1~3) 중에 입력하세요 : ");
//        return sc2.nextInt();
//    }
//}