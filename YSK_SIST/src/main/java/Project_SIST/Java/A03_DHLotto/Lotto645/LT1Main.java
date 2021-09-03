package Project_SIST.Java.A03_DHLotto.Lotto645;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

import Project_SIST.Java.A03_DHLotto.CatchMe.Model;

public class LT1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int lotto[] = new int[7]; // 당첨 복권 번호 생성
		int myLotto[] = new int[6]; // 선택한 복권 번호 내역
		int result[] = new int[6]; // 추첨 복권 번호 (선택 복권 번호와 일치 여부 확인)
		int cnt, i, j, tmp; // cnt : 선택한 복권 번호와 당첨 복권 번호의 일치하는 갯수
		int gen_count = 0; // 선택할 복권 번호를 카운팅
		int ok_generation; // 카운팅 완료
		
		System.out.println("# LOTTO 6/45 : 복권 설정 # \n");
		
		System.out.println("복권 번호를 자동으로 생성하시겠습니까? (Y/N) : ");
		String quest1 = sc.nextLine(); // 복권 번호 자동 선택 여부
		if (quest1.equals("Y")) {
			// 랜덤 복권 번호 생성
			for(i=0; i<6; i++) {
				myLotto[i] = (int)(Math.random()*45 + 1);
			}
		} else {
			System.out.println("# LOTTO 6/45 : 복권 설정 [혼합 선택] # \n");
			while(gen_count < 6) {
					
				ok_generation = 1;
				System.out.printf("[%d] [1-45] 번호 선택 : ", gen_count+1);
				tmp = sc.nextInt();
				
				for(i=0; i<6; i++) {
					if(tmp == myLotto[i]) {
						ok_generation = 0;
						break;
					}
				}
				
				if (ok_generation !=0) {
					myLotto[gen_count] = tmp;
					gen_count++;
				} else
					System.out.println("중복된 번호입니다. 다시 입력해주세요.");
			}
		}
		
//		System.out.println("# LOTTO 6/45 : 복권 설정 # \n");
//		
//		while(gen_count < 6) {
//			ok_generation = 1;
//			System.out.printf("[%d] [1-45] 번호 선택 : ", gen_count+1);
//			tmp = sc.nextInt();
//			
//			for(i=0; i<6; i++) {
//				if(tmp == myLotto[i]) {
//					ok_generation = 0;
//					break;
//				}
//			}
//			
//			if (ok_generation !=0) {
//				myLotto[gen_count] = tmp;
//				gen_count++;
//			} else
//				System.out.println("중복된 번호입니다. 다시 입력해주세요.");
//		}
		
		System.out.println("\n# LOTTO 6/45 : 번호 확인 #\n");
		
		System.out.print("선택한 복권 번호는 [");
		for(i=0; i<6; i++) {
			System.out.print(myLotto[i] + " ");
		}
		System.out.println("] 입니다.\n");

		System.out.println("===============================================\n");
		
		System.out.println("# LOTTO 6/45 : 복권 구매 #\n");
		System.out.println("상품명 : LOTTO 6/45 \n");
		int price = 1000;
		System.out.print("예치금 : 1000원" + "\n");
		System.out.print("수량 : ");
		int ltcnt1 = sc.nextInt();
		System.out.println("구매 수량 : " + ltcnt1 + " 매");
		
		int tot1 = price*ltcnt1;
		System.out.println("상품 총 가격 : " + tot1 + "원" + "\n");
		
		System.out.println("\n# LOTTO 6/45 구매가 완료되었습니다. #\n");
		
		System.out.println("[ 제 n 회 LOTTO 6/45 구매 영수증 ]\n");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println("발 행 일 : " + dateFormat.format(cal.getTime()) + "\n");
		for(i=0; i<6; i++) {
			System.out.print("[" + myLotto[i] + "]");
		}
		System.out.println("\n");
		System.out.println("수량 : " + ltcnt1 + "매");
		System.out.println("* 과몰입 방지를 위해 복권 구매는 1일 최대 5매까지 구매 가능합니다.\n");
		System.out.println("금액 : " + tot1 + "원\n");
		System.out.println("===============================================\n");
		
		// 당첨번호 생성
		for(i=0; i<7; i++) {
			lotto[i] = (int)(Math.random()*45 + 1);
		}
		
		System.out.println("# LOTTO 6/45 : 당첨 결과 #\n");
		System.out.print("선택 한 복권 번호 : ");
		for(i=0; i<6; i++) {
			System.out.print("[" + myLotto[i] + "]");
		}
		
		System.out.print("\n제 n 회 LOTTO 6/45 당첨 번호 : [");
		
		for(i=0; i<6; i++) {
			System.out.print(lotto[i] + " ");
		}
		System.out.printf("] + 보너스 번호 [ %d ] \n", lotto[6]);
		
		cnt = 0;
		for(i=0; i<6; i++) {
			for(j=0; j<7; j++) {
				if(myLotto[i] == lotto[j]) {
					result[cnt] = myLotto[i];
					cnt++;
				} 
			}
		}
		System.out.printf("* 당첨 번호 갯수 : %d\n", cnt);
		if(cnt>0) {
			System.out.print("* 당첨 번호 : ");
			for(i=0; i<cnt; i++) {
				System.out.print(result[i] + " ");
			}
		}
		
		System.out.println("\n");
		
		if(cnt == 6)
			if(result[cnt] == lotto[5]) System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : 1등입니다! \n");
			else System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : 2등 \n");
		else if(cnt==5) System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : 3등 \n");
		else if(cnt==4) System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : 4등 \n");
		else if(cnt==3) System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : 5등 \n");
		else
			System.out.print("제 n 회 LOTTO 6/45 복권 추첨 결과 : X \n");
			System.out.println("\n### LOTTO 6/45 당첨 조건 ###\n");
			System.out.println("* 선택 번호, 당첨 번호 * \n 1) 3개 일치 시, 5등! \n 2) 4개 일치 시, 4등! \n 3) 5개 일치 시, 3등! \n 4) 6개 일치 시, 2등! \n 5) 6개 & 보너스 번호 일치 시, 1등!");
		

		LT1DTO lto1 = new LT1DTO(myLotto, lotto);
		// Controller만 호출.
		LT1Controller lt1ctrl = new LT1Controller();
		System.out.println("\n# 호출된 화면 #\n");
		System.out.println(lt1ctrl.LT1List2(lto1, new Model()));

	}

}