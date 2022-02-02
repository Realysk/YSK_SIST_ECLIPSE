package javaexp.a00_exp;

public class A01_0504 {
	
	static int autoSeller(int inMoney) {
		System.out.println("입급액:"+inMoney);
		int rest = inMoney-900;
		if(rest<0) {
			System.out.println("입급액이 부족합니다.");
			System.out.println("콜라 지급 안됨");
			rest = inMoney;
		}else {

			System.out.println("콜라 지급");
		}
		
		
		return rest;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//# 오늘 정리 문제.
//1. 새로운 javaexp2폴드를 만들고, eclipse의 installer 설치한 후,
//    오늘 설치한 개발환경을 처리하고, hello java를 출력하세요
//2. 자바의 기본 변수 선언과 할당을 통해 아래의 변수를 선언하고 출력하세요
//    이름/나이/취미
		String name= "홍길동";
		int age = 25;
		String hobby="스카이 다이빙";
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("취미:"+hobby);
//3. 변수와 사칙연산자와 나머지 연산를 활용하여 아래와 같은 내용을 처리하세요
//    1) 곰돌이 3마리가 5개씩 빵을 먹은 총갯수
//    2) 20개의 빵을 3마리의 곰돌이가 동일하게 먹은 갯수와 남은 나머지
//    3) 총잔액 100000에서 교통비3000 2회 식대 7000, 간식비 3000을
//        뺀 나머지
		int bearCnt = 3;
		int perBread = 5;
		int totBread = 20;
		System.out.println("곰돌이 3마리가 5개씩 빵을 먹은 총갯수"+(bearCnt*perBread));
		System.out.println("20개의 빵을 3마리의 곰돌이가 동일하게 먹은 갯수:"
				+(totBread/bearCnt)
				+"와 남은 나머지:"+(totBread%bearCnt));
		int rest = 100000;
		// ()를 통해서 문자열 구분.. : 괄호 최우선, 곱셈/나눗셈, 덧셈/뺄셈
		System.out.println("총잔액 100000에서 교통비3000 2회 식대 7000, 간식비 3000을 뺀 나머지"
				+(rest-(3000*2+7000+3000)));
//4. 컴퓨터 가격이 1000000이상이면 고가 그외는 저가로 처리하기로 했다.
//    해당 프로그램을 조건문에 의하여 처리하고 출력하세요.
		int comPrice = 1200000;
		if(comPrice>=1000000) {
			System.out.println("고가");
		}else {
			System.out.println("저가");
		}
//5. 반복문을 이용하여 30~50까지 출력하고, 10부터 discount 0까지 출력하세요.
		for(int cnt=30;cnt<=50;cnt++) {
			System.out.print("카운드1:"+cnt+"\t");
		}
		System.out.println();
		for(int cnt=10;cnt>=0;cnt--) {
			System.out.print("카운드2:"+cnt+"\t");
		}		
		System.out.println();
//6. 함수로 입금액을 넣었을 때, 콜라 900원의 잔액을 리턴처리하게 선언하고,
//    출력하게 하세요.
		System.out.println("잔액:"+autoSeller(3000));
		System.out.println("잔액:"+autoSeller(600));
		
//7. 자바의 heap영역과 stack영역에 대하여 메모리기준을 기술하세요.
/*		객체는 heap영역에 객체를 생성하고 stack영역에 객체의 주소값을 저장한다.
 * 	    primitive데이터는 stack영역에 바로 데이터를 할당한다.
 * 
 * */		

	}

}
