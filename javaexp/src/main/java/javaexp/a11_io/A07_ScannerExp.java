package javaexp.a11_io;

import java.util.Scanner;

public class A07_ScannerExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex) 구매할 물건 등록
				//		물건명 :
				//		가격 :
				//		갯수 :
				//		구매내역 : @@@ @@@	총 비용 @@@
				
				Scanner sc2 = new Scanner(System.in);
				System.out.println("구매할 물건 등록");
				System.out.println("물건명 : ");
				String name2 = sc2.nextLine();
				System.out.println("가격 : ");
				int price = sc2.nextInt();
				System.out.println("갯수 : ");
				int cnt = sc2.nextInt();
				System.out.println("구매내역 : " + name2 + " * " + cnt + "\t" + "총 비용 : " + (price * cnt));
	}
}
