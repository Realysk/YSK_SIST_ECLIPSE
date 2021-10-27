package javaexp.a09_api;

public class A01_String {
/*
# String
1. 문자열의 처리하는 객체..
2. 선언 방식
	1) String 변수명 = "문자열 데이터";
	2) String 변수명 = new String("문자열데이터");
3. 객체이기때문에 heap메모리 주소에 할당된다.
	1) 첫번째 방식은 문자열만 같으면 같은 주소에 할당이 된다.
		String name1 = "홍길동";
		String name2 = "홍길동";
		String name3 = "홍길동";
		"홍길동" 이라는 문자열은 heap영역에 동일한 주소를 참조하여
		설정된다.
		직접 코딩에 의해서 할당이 되어 사용가능하다.
		name1 == name2는 동일한 주소값이기때문에 동일한 true로 처리가 된다.
	2) 두번째 방식은 문자열이 각각, 다른 주소를 만들어서 문자열의
		데이터를 가지고 온다.
		String name4 = new String("홍길동");
		String name5 = new String("홍길동");
		String name6 = new String("홍길동");
		name4 == name5  다른 주소를 가지고 있기에 주소값이 다르게 처리된다.
			false로 처리된다.
		*** 일반적으로 DB에서 불러오거나, network을 통해서 가져오거나,
		파일을 통해서 가져오는 데이터는 모두 다, 내부적으로 이 방식으로 가져온다.
 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name1 = "홍길동";
		String name2 = "홍길동";
		String name4 = new String("홍길동");
		String name5 = new String("홍길동");
		System.out.println(name1 == name2);
		System.out.println(name4 == name5);
		// 문자열만 비교해서 데이터를 처리할 때는 == 와 같은 stack영역의
		// 데이터비교 방식은 문제가 발생한다.
		// ## 자바에서 문자열의 데이터를 비교할 때는 stack영역의 주소값이
		// 아닌 문자열 자체를 비교해주는 .equals()메서드를 활용하여야 한다.
		System.out.println(name4.equals(name5));
		// java A01_String 홍길동 홍길동
		String name6 = args[0]; // 첫번째
		String name7 = args[1]; // 두번째
		System.out.println(name6 == name7);
		System.out.println(name6.equals(name7));
		// ex1) himan일때, 등록된 아이디입니다. 표시, 
		//      그외에는 등록가능한 아이디입니다.
		// ex2) args에 로그인 id와 pass를 입력하고,
		//    "himan"//"7777"일때만 로그인 성공, 그외에는 로그인 실패로
		//    출력되게 하세요...
		
		
		
		
		
		
	}

}
