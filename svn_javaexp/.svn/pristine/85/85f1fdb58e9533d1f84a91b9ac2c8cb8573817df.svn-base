package javaexp.a00_exp.a05;

import java.util.Scanner;

public class A10_0517 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 정리문제
1. 중첩조건문의 형식을 정리하고, 영어/수학 점수를 입력받아
    합격기준이 영어/수학 점수가 모두 80점이상인 경우와 수학점수만 100점인 경우를
    기준으로 하였다고 가정하면, 중첩조건에 의해 합격/불합격여부와
    합격기준을 표시하세요.
    if(조건1){
    	if(조건2){
    		// 조건1과 조건2가 모두 true
    	}else{
    		// 조건1만 true
    	}
    }else{
    	if(조건2){
    		// 조건2만 true
    	}else{
    		// 조건1과 조건2가 모두 false
    	}
    }
*/
	int eng = 85;
	int math = 85;
	if(eng>=80) {
		if(math>=80) {
			System.out.println("둘다 80점 합격!!");
		}else {
			System.out.println("불합격");
		}
	}else {
		if(math==100) {
			System.out.println("수학점수 100점 합격");
		}else {
			System.out.println("불합격");
		}		
	}
	if(eng>=80&&math>=80) {
		System.out.println("둘다 80점 합격!!");
	}else if(math==100) {
		System.out.println("수학점수 100점 합격");
	}else {
		System.out.println("불합격");
	}
/*
2. switch case문의 기본형식을 기술하고,
    경마를 해서, 8마리의 말 중에, 1~3등까지 600%, 400%, 200%의
    담첨금을 받기로 했다. 티켓 금액을 입력하고, 랜덤에 의해
    1~8말을 선택하고 당첨금 총액을 출력처리하세요.
    switch(데이터){
    	case 케이스1:
    		처리할 내용
    		break;
    	case 케이스2:
    	case 케이스3:
    		케이스2와 케이스3이 처리할 내용
    		break;
    	default :
    		위에 정의된 케이스 이외의 처리할 내용
    }
*/
	/*
	System.out.print("티켓 금액을 입력하세요:");
	Scanner sc = new Scanner(System.in);
	int pay = sc.nextInt();
	int ranRank = (int)(Math.random()*8+1); 
	System.out.println("등수:"+ranRank);
	// 1~8 등.(자신의 등수)임의로 처리..
	switch(ranRank) {
		case 2:	pay=pay*2;
		case 3:	pay=pay*2;
			break;
		case 1:	pay=pay*6;
			break;
		default: pay=0;
	}
	System.out.println("총 금액:"+pay);
	*/
/*	
3. [1단계] for문을 활용하여, 단가 2200원의 김밥 1~30개의 가격을 출력하세요.
*/
	int price= 2200;
	for(int cnt=1;cnt<=30;cnt++) {
		System.out.println(cnt+"\t"+price+"\t"+(cnt*price));
	}
	
/*	
   [2단계] 김밥 주문에 따른 총비용을 누적하세요. 
          종류 2가지만 입력받아 3000원 3개, 3500원 2개
      1 3000    3000
      2 3000    6000
      3 3000    9000
      4 3500   12500  
      5 3500   15000
*/
	int price1 = 3000; // 첫번째 주문 김밥의 단가
	int cnt1 = 3;	// 첫번째 주문 김밥의 갯수
	int price2 = 3500; // 두번째 주문 김밥의 단가
	int cnt2 = 2;	// 두번째 주문 김밥의 갯수
	// 1번째 주문의 처리 현황..
	for(int count=1;count<=cnt1;count++) {
		System.out.println(count+"\t"+price1+"\t"+count*price1);
	}
	// 2번째 주문의 처리 현황
	//  count의 시작은 첫번째 주문갯수 + 1
	//  count의 마지막은 첫번째 주문갯수 + 두번째 주문갯수
	for(int count=cnt1+1;count<=(cnt1+cnt2);count++) {
		System.out.println(count+"\t"+price2+"\t"+count*price2);
	}
	
/*	
4. for문을 활용하여 아래의 형식(1~20)으로 출력 하세요.
    1단계 짝수만 %연산자를 이용해서 출력
    2단계 5걔 단위로 줄바꿈 처리.
    2  4  6  8  10  
    12 14 16 18 20
*/
	for(int cnt=1;cnt<=20;cnt++) {
		if(cnt%2==0) {
			System.out.print(cnt+"\t");
		}
		if(cnt%10==0) {
			System.out.println();
		}
	}
	System.out.println();
/*	
5. for문을 이용하여 3/6/9게임으로 출력하세요.
    1 단계(1~10까지)
    1   2   짝  4   5   짝   7   8   짝  10...
    2 단계(11~20까지)
    11  12  짝 14  15  짝  17 18 짝  20
 
 */
	
		System.out.println("#3/6/9 1단계#");
		for(int cnt=1;cnt<=10;cnt++) {
			if(cnt%3==0) { // 1~10까지 3의 나머지가 0 일 때..
				// 1  2  3  4  5  6  7  8  9  10
				// 1  2  0  1  2  0  1  2  0  1
				System.out.print("짝\t");
			}else {				
				System.out.print(cnt+"\t");
			}
		}
		System.out.println();
		System.out.println("#3/6/9 2단계#");
		for(int cnt=1;cnt<=20;cnt++) {
			// 10단위 내용을 삭제해서 나머지값이 3으로 나누었을  0일때
			// cnt%10%3
	// 			11   12   13   14  15  16   17   18   19  20
	//cnt%10	1    2	  3    4    5   6    7    8    9   1
	//cnt%10%3	1    2	  0    1    2   0    1    2    0   1
			
			if(cnt%10!=0 &&cnt%10%3==0) {
				System.out.print("짝\t");
			}else {				
				System.out.print(cnt+"\t");
			}
			if(cnt%10==0) {
				System.out.println();
			}
		}
		System.out.println("#3/6/9 3단계#");
		String str="";
		for(int cnt=1;cnt<=1000;cnt++) {
			str = "";
			// 문자열로 변환처리..
			String numS = ""+cnt;
			// numS.toCharArray()를  문자열의 구성요소를 char 배열로 변환.
			// "30" ==> ['3','0']
			// "331" ==> ['3','3','1']			
			// for(단위데이터 : 배열)
			for(char c:numS.toCharArray()) {
				// 포함된 문자가 3/6/9일때,
				// 출력할 문자 "짝"을 누적 처리..
				if(c == '3'||c == '6'||c == '9') {
					str+="짝";
				}
			}
			if(str.equals("")) {
				System.out.print(cnt+"\t");
			}else {
				System.out.print(str+"\t");
			}
			// 10단위로 줄바꿈 처리..
			if(cnt%10==0) {
				System.out.println();
			}
			
		}
				
		
	}

}
