package javaexp.a05_object;

import javaexp.a05_object.vo.Person;

public class A05_NullPointer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. 자바의 변수는 크게 두 가지로 나뉘어진다.
		 	1) 기본 타입(primitive type)
		 		정수/실수/boolean
		 		stack영역에 선언과 할당을 한다.
		 	2) 참조 타입(reference type)
		 		객체형
		 		heap영역에 할당되있고 heap영역의 주소값을 stack에 저장한다.
		 		
		 		a05_object.vo.Person@7637f22
		 		클래스명@16진수heap영역의주소값
		*/
		
		int num01 = 25;
		Person p01 = new Person();
		System.out.println("스택 영역의 데이터(primitive) : " + num01);
		System.out.println("스택 영역의 데이터(object) : " + p01);
		
		/*
		 2. null이란
		 	1) 객체를 선언만 하고 heap영역에 생성이 되지 않을 때 null 즉 heap영역에 아무것도 없다는 뜻으로 사용되는 것을 말한다.
		 	2) heap영역에 없는 객체를 속성/메서드를 호출하면 NullPointerException 발생한다.
		 	3) 일반적으로 해당 데이터가 생성되었을 때 처리하기 위해 객체 변수는 if(변수명!=null)로 check 후 속성을 사용한다.
		 	
		 3. 비교 연산자 처리
		 	1) 비교 연산자(==, !=...)는 stack영역의 할당된 데이터를 비교하여 boolean값을 리턴한다.
		 	2) 기본 primitive 데이터 : 할당된 데이터값 비교.
		 	3) 객체형 참조변수 : heap영역의 주소값 비교.
		 		참조변수 != null : 객체가 할당된 경우를 의미
		 	4) String
		 		- 문자열 직접 할당.
		 		String str1 = "홍길동";
		 		String str2 = "홍길동";
		 		동일한 문자열은 동일한 heap영역에 할당된 경우를 말한다.
		 		str1==str2 true
		 		- 객체 생성 할당
		 		String str3 = new String("홍길동");
		 		String str4 = new String("홍길동");
		 		일반적으로 외부 입력 Scanner이나 Stream(네트워크,파일처리)을 통해서
		 		처리된 경우는 내부적으로 객체가 생성되어 처리된다.
		 		str3 == str4 false 같은 주소값이 아니다.
		 		문자열 자체로 비교할 때 str3.equals(str4)를 사용한다.
		*/
		
		Person p02 = null;
		System.out.println("heap 영역에 할당되지 않는 object : " + p02);
		if(p01!=null) {
			System.out.println("객체가 생성되었습니다.");
			System.out.println(p01.age);
		} else {
			System.out.println("객체가 생성되지 않았습니다.");
		}
		if(p02!=null) {
			System.out.println("객체가 생성되었습니다.");
			System.out.println(p02.age);
		} else {
			System.out.println("객체가 생성되지 않았습니다.");
		}
	}

}
