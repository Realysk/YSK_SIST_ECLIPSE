package javaexp.a09_api;

public class A03_TypeTransfer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 데이터의 변환
		 	1. 숫자형 문자열은 연산이 불가능하다.
		 		이 때, 필요로 하는 것이 숫자형으로 변환이 필요로 하다.
		 	2. 정수/정수일 때, 자바에서는 정수형의 몫만 가져올 수 있다.
		 		소수점 이하의 숫자로 가져오기 위해서는 형 변환이 필요로 한다.
		 	3. 숫자형 데이터를 문자열로 변환하여 처리
		 		1) 각 Wrapper 클래스 (기본 데이터 유형을 객체화한 클래스)
		 			정수형 Integer.toString(25) ==> "25"
		 			실수형 Double.toString(27.35) ==> "27.35"
		 		2) 간략하게 "" + 25 ==> "25"
		 				  "" + 37.5 ==> "37.5"
		 */
		String numStr = "25";
		int num01 = 25;
		System.out.println(numStr + 30);
		System.out.println(Integer.parseInt(numStr)+30);
//		문자열은 기본적으로 + 기호에 의해서 연결(concat) 처리를 한다.
		System.out.println(num01 + 30);
		String fname = args[0];
		String fprice = args[1];
		String fcnt = args[2];
		System.out.println("물건명 : " + fname);
		System.out.println("가격 : " + fprice);
		System.out.println("갯수 : " + fcnt);
//		System.out.println("총계 : " + (fprice*fcnt)); 에러발생?
//		숫자 형태의 데이터가 아니기 때문에 연산을 할 수 없다.
//		숫자형 문자열 ==> 숫자
//			1) 정수형 : Interger.parseInt("정수형 문자열");
//			2) 실수형 : Double.parseDouble("실수형 문자열");
		int price = Integer.parseInt(fprice);
		int cnt = Integer.parseInt(fcnt);
		System.out.println("총계 : " + (price * cnt));
		
		double dblNum = Double.parseDouble("180.7");
		System.out.println(dblNum+25.25);
	}

}
