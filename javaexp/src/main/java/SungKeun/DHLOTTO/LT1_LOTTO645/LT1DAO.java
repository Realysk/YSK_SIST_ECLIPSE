package SungKeun.DHLOTTO.LT1_LOTTO645;

import java.util.ArrayList;

public class LT1DAO {
/*
// select * 
// from product
// where name like '%'||'물건명'||'%'
//  and price between 가격의최소 and 가격의최대; 
==> java 객체로 할당 전달..
 */
	
	// 입력값에 의해서 처리한 ArrayList리턴해준다.
	public ArrayList<LT1DTO> LT1List(LT1DTO lto1){
		
		ArrayList<LT1DTO> lt1list  = new ArrayList<LT1DTO>();
		lt1list.add(new LT1DTO(lto1.getMyLotto(), lto1.getResult()));
		
	    // 전체 복권 입력 데이터를 확인하기 위한 메소드
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에 넘겨 줄 복권 입력 데이터 #\n");
		System.out.println("선택 한 복권 번호 (객체) : " + lto1.getMyLotto() + "\n");
		System.out.println("생성 된 당첨 번호 (객체) : " + lto1.getResult() + "\n");
		System.out.println("===============================================\n");
		System.out.println("# DB 서버에서 온 복권 입력 데이터 리스트 #\n");
		lt1list.add(new LT1DTO());
		System.out.println("===============================================\n");
		for(LT1DTO ltto1:lt1list) {
			int[] numArr1 = lto1.getMyLotto();
			int[] numArr2 = lto1.getResult();
			
			System.out.println("입력 된 복권 번호 데이터 : " + ltto1.getMyLotto() + "\n");
			System.out.println("생성 된 당첨 번호 데이터 : " + ltto1.getResult() + "\n");
			
			// 객체 내용보기
//			System.out.println("########### 입력 된 복권 번호 ###########\n");
//			lto1.showInfo(lto1.getMyLotto());
//			System.out.println("########### 생성 된 당첨 번호 ###########\n");
//			lto1.showInfo(lto1.getResult());
			
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

		return lt1list;
	}
}