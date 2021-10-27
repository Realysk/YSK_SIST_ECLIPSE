package javaexp.a05_object;

public class A01_BeforeObject {
	// 합산처리 함수  : static ==> 객체 생성 없이 사용가능
//							new 객체();로 선언 없이 사용할
//							멤버
//					클래스명.필드;  클래스명.메서드()
	//    리턴할type   메서드명(들어올 데이터 유형 선언-매개변수 parameter type)
	//               plus(30,20)
	//               num01 = 30  num02 = 20
	static int plus(int num01, int num02) {
		
		// 함수를 통해서 처리할 프로세스
		int tot = num01+num02;
		// 리턴할 실제 데이터
		// 함수를 호출한 곳에 데이터를 전달
		// 선언된 데이터 유형과 동일하게 데이터를 return 처리
		return tot;
	}
	// ex1) minus 두개의 값을 뺄셈 처리한 데이터를 리턴
	static int minus(int num01, int num02) {
		int tot = num01 - num02;
		return tot;
	}
	// ex2) calcu 물건가격과 갯수로 총계를 처리한 데이터 리턴..
	///   하단에서 호출 처리..
	static int calcu(int price, int cnt) {
		int tot = price*cnt;
		return tot;
	}
	static String login(String id, String pass) {
		String result="";
		//   비교연산자1 &&(논리연산) 비교연산자2 : himan이고 7777일 때만 로그인
		// 성공 그외에는 로그인 실패 처리..
		// 문자열 비교는 자바에서는 .equals()를 사용하여야 한다. ==(X)
		if(id.equals("himan")&&pass.equals("7777")) {
			result="로그인 성공";
		}else {
			result="로그인 실패";
		}
		return result;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(login("himan","8888"));
		System.out.println(login("himan","7777"));
		System.out.println( plus(30,20) );
		System.out.println( plus(500,300) );
		System.out.println("minus()함수:"+minus(300,20));
		System.out.println("총계함수:"+calcu(3000,3));
		
		
		
/*
# 객체의 메모리
	ex) 도서관  [T01_ㅈ] 자바의 정석 
		T01_ㅈ : 순서에 의한 도서의 위치
	자바에서 작은메모리는 바로 할당하여 사용 stack영역의
		primitive 데이터 유형..
	큰메모리 즉, 객체형은 heap영역에 해당 데이터를 할당한 후에
	 	heap영역의 주소값을 stack영역에 할당하여 사용한다.
	 	
   null이 무엇인지?
   NullPointerException?
   String에서 equals와 == 의 차이점!!
# 함수
	자바에서는 기능함수를 클래스 소속 기능 구성요소인 메서드 개념으로 활용한다.
	ex) 자판기 기능..
	기본 형식
	리턴할데이터유형  함수명(입력할데이터1, 입력할 데이터2){
		//처리할 코드..
		return 실제리턴할데이터;
	}
# 배열

 * */
		//1.기본 데이터 
		int num01 = 30;
		System.out.println(num01);
		Object ob01 = new Object();
		// 주소값을 객체@16진수로heap영역의주소값
		System.out.println(ob01);
		
	}
}
