package javaexp.a00_exp;

import java.util.Scanner;

public class A10_0517 {

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      /*
       # 정리 문제
          1. 중첩조건문의 형식을 정리하고, 영어/수학 점수를 입력받아 합격기준이 영어/수학 점수가 모두 80점 이상인 경우와
             수학점수만 100점인 경우를 기준으로 하였다고 가정했을 때 중첩조건에 의해 합/불 여부와 합격 기준을 표시하세요.
             
             기본 형식
             if(조건1) {
     
                 if(조건2) { 
                    조건1이고 조건2일 때 처리할 구문 
                 } else {
                    조건1이고 조건2가 아닐 때 처리할 구문 
                 } else {
                 }
              } else {
           }
             */
//               Scanner sc = new Scanner(System.in);
//               System.out.println("영어 점수를 입력하세요. : ");
//               int eng = sc.nextInt();
//               System.out.println("수학 점수를 입력하세요. : ");
//               int math = sc.nextInt();
//               
//               if(math>=80) {
//                  if(eng>=80) {
//                     System.out.println("합격입니다!");
//                  } else {
//                     System.out.println("합격입니다!");
//                  }
//               } else {
//            	   if(math==100) {
//                          System.out.println("합격입니다!");
//                       } else {
//                          System.out.println("불합격입니다.");
//                       }
//            	if(eng>=80&&math>=80) {
//                          System.out.println("두 과목 80점으로 합격입니다!");
//                       } else if(math==100) {
//                          System.out.println("수학점수 100점 합격입니다!");
//                       } else {
//                    	   System.out.println("불합격입니다.\n*합격기준 : 수학/영어 모두 80점 이상이거나 수학만 100점인 경우*");
//                       }
//               } 
            /*
            
          2. switch case문의 기본 형식을 기술하고, 경마를 해서 8마리 말 중에 1~3등까지 600%, 400%, 200%의 당첨금을 받기로 했다.
             티켓 금액을 입력하고 랜덤에 의해 1~8번 말을 선택하고 당첨금 총액을 출력하세요.
             
             switch(변수) {
            case 변수 유형1:
               처리할 내용
               break;
            case 변수 유형2:
               처리할 내용
               break;
            ..
            default:
               위에 정의한 변수 유형이 아닐 때 처리할 내용
            }
             
             */
//               Scanner sc = new Scanner(System.in);
//               System.out.println("# 경마 토토 #");
//               System.out.println("티켓 금액을 입력하세요. (티켓금액 입력시 1~10까지 말 번호가 랜덤으로 나오며 당첨 여부가 공개됩니다.) : ");
//               int jackpot = sc.nextInt();
//               switch((int)(Math.random() * 8 + 1)) {
//                  case 1:
//                     System.out.println("당신의 말은 1번! : " + (jackpot * 6) + " 원" + " / 당첨금의 200% 상승!");
//                     break;
//                  case 2:
//                     System.out.println("당신의 말은 2번! : " + (jackpot * 4) + " 원" + " / 당첨금의 200% 상승!");
//                     break;
//                  case 3:
//                     System.out.println("당신의 말은 3번! : " + (jackpot * 2) + " 원" + " / 당첨금의 200% 상승!");
//                     break;
//                  case 4:
//                     System.out.println("당신의 말은 4번! : " + (jackpot * 0) + " 원" + " / 꽝!");
//                     break;
//                  case 5:
//                     System.out.println("당신의 말은 5번! : " + (jackpot * 0) + " 원" + " / 꽝!");
//                     break;
//                  case 6:
//                     System.out.println("당신의 말은 6번! : " + (jackpot * 0) + " 원" + " / 꽝!");
//                     break;
//                  case 7:
//                     System.out.println("당신의 말은 7번! : " + (jackpot * 0) + " 원" + " / 꽝!");
//                     break;
//                  case 8:
//                     System.out.println("당신의 말은 8번! : " + (jackpot * 0) + " 원" + " / 꽝!");
//                     break;
//               }
            /*
             
             
          3. 아래 두 문제를 출력하세요.
             [1단계] for문을 활용하여 단가 2200원의 김밥 1~30개의 가격을 출력하세요.
             */
               int price = 2200;
               for(int cnt=1; cnt<=30; cnt++) {
            	   System.out.println(cnt + "\t" + price + "\t" + (cnt*price));
               }
            /*
          
             [2단계] 김밥 주문에 따른 총 비용을 누적 출력하세요.
                종류 2가지만 입력받아 (3000원 3개, 3500원 2개 등)
                1   3000   3000
                2   3000   6000
                3   3000   9000
                4   3500   12500
                5   3500   15000
             */
//               int price1 = 3000; // 첫 번째 주문 김밥의 단가
//               int cnt1 = 3; // 첫 번째 주문 김밥의 갯수
//               int price2 = 3500; // 두 번째 주문 김밥의 단가
//               int cnt2 = 2; // 두 번째 주문 김밥의 갯수

//               // 첫 번째 주문 처리 현황
//               for(int count=1; count<=cnt1; count++) {
//            	   System.out.println(count + "\t" + price1 + "\t" + count*price1);
//               }
//               // 두 번째 주문 처리 현황
//               // count의 시작은 첫 번째 주문갯수 + 1
//               // count의 마지막은 첫 번째 주문갯수 + 두 번째 주문갯수
//               for(int count=cnt+1; count<=(cnt1+cnt2); count++) {
//            	   System.out.println(count + "\t" + price2 + "\t" + count*price2);
//               }
            /*
                
          4. for문을 활용하여 아래의 형식(1~20)으로 출력하세요.
             [1단계] 짝수만 %연산자를 이용해서 출력.             
             [2단계] 5개 단위로 줄 바꿈 처리.
             2   4   6   8   10
             12   14   16   18   20
             */
               for(int cnt=1; cnt<=20; cnt++) {
            	   if(cnt%2==0) {
            		   System.out.print(cnt + "\t");
            	   }
            	   if(cnt%10==0) {
            		   System.out.println();
            	   }
               }
               System.out.println();
            /*
             
             
          5. for문을 이용하여 369게임으로 출력하세요.
             [1단계] 1~10까지
             1   2   짝   4   5   짝   7   8   짝   10             
             [2단계] 11~20까지
             11   12   짝   14   15   짝   17   18   짝   20
             */
               	System.out.println("# 3/6/9 1단계 #");
               	for(int cnt=1; cnt<=10; cnt++) {
               		if(cnt%3==0) { // 1~10까지 3의 나머지가 0일 때
               			// 1 2 3 4 5 6 7 8 9 10
               			// 1 2 0 1 2 0 1 2 0 1
               			System.out.print("짝\t");
               		} else {
               			System.out.print(cnt+"\t");
               		}
               	}
               	System.out.println();
               	System.out.println("# 3/6/9 2단계 #");
               	for(int cnt=1; cnt<=20; cnt++) {
               		// 10 단위 내용을 삭제해서 나머지 값이 3으로 나누었을 0일 때
               		// cnt % 10
//            	   		11	12	13	14	15	16	17	18	19	20
//         cnt%10		1	2	3	4	5	6	7	8	9	1
//         cnt%10%3		1	2	6	0	1	2	6	0	1	2
            	System.out.println();
                System.out.println("# 3/6/9 3단계 #");
               }
               
            /*
            
       */
   }
}