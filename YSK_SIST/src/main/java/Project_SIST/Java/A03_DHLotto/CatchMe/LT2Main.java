package Project_SIST.Java.A03_DHLotto.CatchMe;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

import Project_SIST.Java.A03_DHLotto.CatchMe.Model;

public class LT2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int lotto[] = new int[7]; // 당첨 복권 번호 생성
		int myLotto[] = new int[6]; // 선택한 복권 번호 내역
		int result[] = new int[6]; // 추첨 복권 번호 (선택 복권 번호와 일치 여부 확인)
		int cnt, i, j, tmp; // cnt : 선택한 복권 번호와 당첨 복권 번호의 일치하는 갯수
		int gen_count = 0; // 선택할 복권 번호를 카운팅
		int ok_generation; // 카운팅 완료
		
		Scanner sc = new Scanner(System.in);
		
		/*
		 # CATCH ME 로직 계획
		 	1. 시작 전 1게임당 500원으로 최대 5배수까지 설정하여 구매 (90퍼 구현)
		 		=> 당첨 시 당첨금액의 선택한 배수만큼 지급은 아직 구현이 안됨.
		 	2. 구매하면 영수증 출력 후 게임 시작. (구현 완료)
		 	1. 11개의 랜덤 당첨 번호 선정. (당첨번호는 번호 선택 후 공개) (80퍼 구현)
		 		=> 아래의 문제점
		 	2. 복권 번호 선택 6개 선택. (구현 완료)
		 	3. 선택하면 당첨 번호도 같이 공개되어 3개 일치 시 선택한 배수만큼 당첨금액 지급! (20퍼 구현)
		 		=> 1번과 동일
		 	
		 	결론 : LOTTO 6/45의 로직의 순서를 적절히 바꾸면 가능성이 있음!
		 	
		 	문제점 : 만약 [1,2,3,4,5,6]을 골라서 2,3,4가 당첨된다면 백만원 단위로 2,3,4백만원이 지급 됨.
		 			=> 창문 번호 6개를 선택했을 때, 6개 중 해당 창문 번호에서 나온 금액 3개가 일치한다면 그 금액이 얼마던 간에 3개 모두 일치하는 해당 금액이면 지급되는 방식으로 바뀌었으면 함.
		 				ex) 1부터 11까지 [1, 4, 9]로 당첨 시, 당첨 금액 : [1백만원, 4백만원, 9백만원] => [1, 4, 9]로 당첨 시, [1, 4, 9]를 선택한 것에 대한 랜덤으로 생성 된 같은 금액.
		 				
		 	해결 방안 : 랜덤 당첨 번호를 설정하지 않고, 애초에 당첨 금액을 일정 단위 만큼 배열로 설정하여 창문 번호를 클릭 했을 때, 금액의 범위를 설정한 배열(당첨 금액) 내에서 나오게끔 구현!
		 	 			(당첨 금액 배열 설정을 좀 세분화해서 다양하게 설정할 필요성이 있음!)
		 			
		 			또한, 최종적으로 3개가 당첨되더라도 결과 로직에서는 당첨되지 않는다고 나옴.
		 */
		
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
		
//		// 당첨번호 생성
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
		
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		LT2DTO lto2 = new LT2DTO(myLotto, lotto);
		// Controller만 호출.
		LT2Controller lt2ctrl = new LT2Controller();
		System.out.println("\n# 호출된 화면 #\n");
		System.out.println(lt2ctrl.LT2List2(lto2, new Model()));
	}
}