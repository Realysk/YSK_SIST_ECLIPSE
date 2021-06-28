package SungKeun.DHLOTTO.LT2_CATCHME.backup;

import java.util.ArrayList;

public class LT2DAO2 {
/*
// select * 
// from product
// where name like '%'||'물건명'||'%'
//  and price between 가격의최소 and 가격의최대; 
==> java 객체로 할당 전달..
 */
	
	// 입력값에 의해서 처리한 ArrayList리턴해준다.
	public ArrayList<LT2DTO2> LT2List(LT2DTO2 lto2) {
		
		ArrayList<LT2DTO2> lt2list  = new ArrayList<LT2DTO2>();
		lt2list.add(new LT2DTO2(lto2.getMyLotto(), lto2.getResult()));
		
	    // 전체 복권 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에 넘겨 줄 복권 입력 데이터 #\n");
		System.out.println("선택 한 복권 번호 (객체) : " + lto2.getMyLotto() + "\n");
		System.out.println("생성 된 당첨 번호 (객체) : " + lto2.getResult() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에서 온 복권 입력 데이터 리스트 #\n");
		lt2list.add(new LT2DTO2());
		System.out.println("===============================================\n");
		for(LT2DTO2 ltto2:lt2list) {
			int[] numArr1 = lto2.getMyLotto();
			int[] numArr2 = lto2.getResult();
			
			System.out.println("입력 된 복권 번호 데이터 : " + ltto2.getMyLotto() + "\n");
			System.out.println("생성 된 당첨 번호 데이터 : " + ltto2.getResult() + "\n");
			
			// 객체 내용보기
//			System.out.println("########### 입력 된 복권 번호 ###########\n");
//			lto2.showInfo(lto2.getMyLotto());
//			System.out.println("########### 생성 된 당첨 번호 ###########\n");
//			lto2.showInfo(lto2.getResult());
			
			System.out.println("########### 입력 된 복권 번호 ###########\n");
			for(int i = 0; i<numArr1.length; i++) {
				System.out.println(i + "(" + (i+1) + ") 번째 번호 : " + numArr1[i]);
			}
			System.out.println("\n");

			System.out.println("########### 생성 된 당첨 번호 ###########\n");
			for(int i = 0; i<numArr2.length; i++) {
				System.out.println(i + "(" + (i+1) + ") 번째 번호 : " + numArr2[i]);
			}
			System.out.println("\n");
		}

		return lt2list;
	}
}