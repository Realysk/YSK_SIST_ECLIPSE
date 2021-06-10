package javaexp.a09_api;

public class A04_TypeTransfer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 형 변환 예제 #
		 형 변환 하여 아래와 같이 출력하세요.
		 
		 args[] 수박[0]		12000[1]	3[2]	바나나[3]		4000[4]		5[5]
		 
		 
		 ex1) 수박	12000	3	36000
		 
		 ex2) 수박 12000 3 바나나 4000 5
		 
		 	물건명	가격		갯수 	계
		 	수박		12000	3		36000
		 	바나나	4000	5		20000
		 	
		 		총계 56000
		 */

		
		String fname = args[0];
		String fprice = args[1];
		String fcnt = args[2];
		String fname2 = args[3];
		String fprice2 = args[4];
		String fcnt2 = args[5];
		
		int price = Integer.parseInt(fprice);
		int cnt = Integer.parseInt(fcnt);
		int price2 = Integer.parseInt(fprice2);
		int cnt2 = Integer.parseInt(fcnt2);
		
		System.out.println("물건명\t가격\t갯수\t계");
		System.out.println(fname + "\t" + fprice + "\t" + fcnt + "\t" + (price * cnt));
		System.out.println(fname2 + "\t" + fprice2 + "\t" + fcnt2 + "\t" + (price2 * cnt2));
		System.out.println("\t");
		System.out.println("\t" + "총계 " + ((price * cnt) + (price2 * cnt2)));
//		\t : 탭 간격 띄우기
//		\n : 줄 바꿈 처리
	}

}
