package javaexp.a09_api;

public class A04_TypeTransfer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 현변환 예제
args[]  수박 12000 3 바나나 4000 5
ex1) 출력1 수박		12000	3	36000
ex2) 출력2
형변환하여 아래와 같이 출력 하세요.
물건명	가격		갯수	계
수박		12000	3	36000
바나나	 4000	5	20000

	총계 56000
 * */
		// 데이터 출력
		System.out.println(args[0]);
		System.out.println(args[1]);
		System.out.println(args[2]);
		System.out.println(args[3]);
		System.out.println(args[4]);
		System.out.println(args[5]);
		String fname1 = args[0];
		String fprice1 = args[1];
		String fcnt1 = args[2];
		System.out.println("# 출력1 #");
		// "\t" :탭간격 띄우기
		System.out.print(fname1+"\t");
		System.out.print(fprice1+"\t");
		System.out.print(fcnt1+"\t");
		int price1 = Integer.parseInt(fprice1);
		int cnt1 = Integer.parseInt(fcnt1);
		int tot1 = price1*cnt1;
		System.out.print(tot1+"\n");
		//==========================================
		// \n : 줄바꿈 처리
		String fname2 = args[3];
		String fprice2 = args[4];
		String fcnt2 = args[5];	
		int price2 = Integer.parseInt(fprice2);
		int cnt2 = Integer.parseInt(fcnt2);
		int tot2 = price2*cnt2;	
		// \t : 탭간격 설정..
		System.out.println("물건명\t가격\t갯수\t계");
		System.out.println(fname1+"\t"+price1+"\t"+cnt1+"\t"+tot1);
		System.out.println(fname2+"\t"+price2+"\t"+cnt2+"\t"+tot2);
		System.out.println("\t총계:"+(tot1+tot2));
		
	}

}
