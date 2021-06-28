package SungKeun.DHLOTTO.LT2_CATCHME.backup;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

import SungKeun.DHLOTTO.Model;

public class LT2Main2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int lotto[] = new int[7]; // 당첨 복권 번호 생성
		int myLotto[] = new int[6]; // 선택한 복권 번호 내역
		int result[] = new int[6]; // 추첨 복권 번호 (선택 복권 번호와 일치 여부 확인)
		int cnt, i, j, tmp; // cnt : 선택한 복권 번호와 당첨 복권 번호의 일치하는 갯수
		int gen_count = 0; // 선택할 복권 번호를 카운팅
		int ok_generation; // 카운팅 완료
		
		Scanner sc = new Scanner(System.in);
				
		// 복권 구매 페이지
		System.out.println("# CATCH ME : 복권 구매 #\n");
		System.out.println("상품명 : CATCH ME \n");
		int price = 500;
		System.out.print("예치금 : 500원" + "\n");
		System.out.print("배수 : ");
		int lt2cnt1 = sc.nextInt();
		System.out.println("선택 배수 : " + lt2cnt1 + " 배");
		int tot2 = price*lt2cnt1;
		System.out.println("상품 총 가격 : " + tot2 + "원" + "\n");
		
		System.out.println("\n# CATCH ME 구매가 완료되었습니다. #\n");
		
		// 영수증 출력
		System.out.println("[ CATCH ME 구매 영수증 ]\n");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println("발 행 일 : " + dateFormat.format(cal.getTime()) + "\n");
		System.out.println("배수 : " + lt2cnt1 + "배");
		System.out.println("금액 : " + tot2 + "원\n");
		System.out.println("===============================================\n");
		
		System.out.println("# CATCH ME : 같은 금액을 가진 도둑 3명을 찾아라! # \n");
		
		System.out.println("자동으로 당첨 결과를 확인하시겠습니까? (Y/N) : \n");
		String auto = sc.nextLine(); // '구입 후 자동확인' 여부
		if(auto.equals("Y")) {
			// YES
			
			// 당첨 번호 생성
			for(i=0; i<7; i++) {
				lotto[i] = (int)(Math.random()*50 + 1);
			}
			
			// 자동 창문 번호 생성
			for(i=0; i<6; i++) {
				myLotto[i] = (int)(Math.random()*10 + 1);
			}
			
			// 당첨 결과
			System.out.println("\n# CATCH ME : 당첨 결과! #\n");
			
			System.out.print("선택한 창문 번호 : [");
			for(i=0; i<6; i++) {
				System.out.print(myLotto[i] + "번 ");
			}
			System.out.println("]\n");
			
			System.out.print("CATCH ME 당첨 번호 : [");
			
			for(i=0; i<6; i++) {
				System.out.print(lotto[i] + "백만원 ");
			}
			System.out.printf("]", lotto[6]);
			
			cnt = 0;
			for(i=0; i<6; i++) {
				for(j=0; j<7; j++) {
					if(myLotto[i] == lotto[j]) {
						result[cnt] = myLotto[i];
						cnt++;
					} 
				}
			}
			
			System.out.printf("\n* 일치하는 당첨 금액 수 : %d\n", cnt);
			if(cnt>0) {
				System.out.print("* 일치하는 당첨 금액 : ");
				for(i=0; i<cnt; i++) {
					System.out.print(result[i] + "백만원 ");
				}
			}
			
			System.out.println("\n");
			
			if(cnt == 6)
				// if(result[cnt] == lotto[5]) System.out.print("CATCH ME 결과 : 축하합니다! 당첨입니다! \n");
				if(result[cnt] == myLotto[5]) System.out.print("CATCH ME 결과 : 축하합니다! 당첨입니다! \n");
				else System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
			else if(cnt==5) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
			else if(cnt==4) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
			else if(cnt==3) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
			else
				System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
				System.out.println("\n### CATCH ME 당첨 조건 ###\n");
				System.out.println("* 11개의 창문 중 6개를 열어 같은 금액을 갖고 있는 도둑 3명을 잡으면 당첨! *");
			
		} else {
			// NO
			
			// 당첨 번호 생성
			for(i=0; i<7; i++) {
				lotto[i] = (int)(Math.random()*50 + 1);
			}
			
			// 복권 번호 선택
			while(gen_count < 6) {
				ok_generation = 1;
				System.out.printf("[%d] [1-11] 번호 선택 : ", gen_count+1);
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
			} else {
				System.out.println("중복된 번호입니다. 다시 입력해주세요.");
			}
		}
		
		// 당첨 결과
		System.out.println("\n# CATCH ME : 당첨 결과! #\n");
		
		System.out.print("선택한 창문 번호 : [");
		for(i=0; i<6; i++) {
			System.out.print(myLotto[i] + "번 ");
		}
		System.out.println("]\n");
		
		System.out.print("CATCH ME 당첨 번호 : [");
		
		for(i=0; i<6; i++) {
			System.out.print(lotto[i] + "백만원 ");
		}
		System.out.printf("]", lotto[6]);
		
		cnt = 0;
		for(i=0; i<6; i++) {
			for(j=0; j<7; j++) {
				if(myLotto[i] == lotto[j]) {
					result[cnt] = myLotto[i];
					cnt++;
				} 
			}
		}
		
		System.out.printf("\n* 일치하는 당첨 금액 수 : %d\n", cnt);
		if(cnt>0) {
			System.out.print("* 일치하는 당첨 금액 : ");
			for(i=0; i<cnt; i++) {
				System.out.print(result[i] + "백만원 ");
			}
		}
		
		System.out.println("\n");
		
		if(cnt == 6)
			// if(result[cnt] == lotto[5]) System.out.print("CATCH ME 결과 : 축하합니다! 당첨입니다! \n");
			if(result[cnt] == myLotto[5]) System.out.print("CATCH ME 결과 : 축하합니다! 당첨입니다! \n");
			else System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
		else if(cnt==5) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
		else if(cnt==4) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
		else if(cnt==3) System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
		else
			System.out.print("CATCH ME 결과 : 아쉽습니다! 다음 기회에! \n");
			System.out.println("\n### CATCH ME 당첨 조건 ###\n");
			System.out.println("* 11개의 창문 중 6개를 열어 같은 금액을 갖고 있는 도둑 3명을 잡으면 당첨! *");
			
		}
				
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		LT2DTO2 lto2 = new LT2DTO2(myLotto, lotto);
		// Controller만 호출.
		LT2Controller2 lt2ctrl = new LT2Controller2();
		System.out.println("\n# 호출된 화면 #\n");
		System.out.println(lt2ctrl.LT2List2(lto2, new Model()));
	}
}