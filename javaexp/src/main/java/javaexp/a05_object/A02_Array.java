package javaexp.a05_object;

public class A02_Array {
/*
# 객체의 범위
1. 사용자 정의 클래스의 객체
2. primitive data유형의 배열도 객체에 포함 된다.
# 배열의 선언..
1. 데이터유형[] 참조명 = new 데이터유형[배열의 크기];
	배열의 메모리만 선언
	ex) int [] array01 = new int[5];
		array01[0] array01[1] array01[2] array01[3] array01[4]
		데이터는 할당이 안됨. heap영역에 객체가 메모리를 만들어져 있다.
2. 데이터유형[] 참조명 = {데이터1, 데이터2, 데이터3};
	배열의 메모리선언과 함께 데이터 할당.
	ex) String []fruits = {"사과", "바나나", "오렌지"};
# 배열의 데이터 확인
1. 배열명[index] 로 데이터를 확인할 수 있다.
	index는 0부터 시작..
2. 배열명.length를 통해서 배열의 크기를 확인할 수 있다..		
 * */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] arry01 = new int[5];
		int [] arry02 = {3000, 4000, 5000};
		String [] fruits = {"사과","바나나","딸기"};
		System.out.println("메모리 확인:"+arry01);
		System.out.println("메모리 확인:"+arry02);
		System.out.println(arry02[0]);
		System.out.println(arry02[1]);
		System.out.println(arry02[2]);
		System.out.println(fruits[0]);
		System.out.println(fruits[1]);
		System.out.println(fruits[2]);	
		System.out.println("배열의 크기1:"+arry01.length);
		System.out.println("배열의 크기2:"+arry02.length);
		// ex1) 배열3번째로 좋아하는 공휴일 3개를 선언하고 할당, 출력
		String [] arry03 = {"어린이날","추석","설날"};
		System.out.println("좋아하는 공휴일:"+arry03.length);
		System.out.println(arry03[0]);
		System.out.println(arry03[1]);
		System.out.println(arry03[2]);
		// ex2) 주로 타는 버스번호(정수) 3개를 선언할당, 출력
		int [] busnos = {1001,7001,7780};
		System.out.println("# 버스 번호 #");
		System.out.println(busnos[0]);
		System.out.println(busnos[1]);
		System.out.println(busnos[2]);
		
		
		
		
		
		
		

	}

}
