package javaexp.a11_io;

import java.util.Scanner;

public class A06_Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 간단한 데이터 입력을 처리하는 Scanner 객체..
1. 데이터를 입력하여 처리해주는 util 패키지 하위 객체
2. 활용.
	new Scanner(InputStream객체) 
	1) 기능 메서드..
		next() : 공백 전까지 문자열을 입력.
		nextLine() : enter키 입력까지 문자열을 입력.
		nextInt() : 정수형 데이터 입력..
		nextDouble() : 실수형 데이터 입력
 * */
		Scanner sc = new Scanner(System.in);
		System.out.println("성적 등록");
		System.out.print("이름:");
		String name = sc.nextLine();
		System.out.print("점수:");
		int point = sc.nextInt();
		System.out.println("등록할 이름:"+name);
		System.out.println("입력한 점수:"+point);
		if(point>=70) {
			System.out.println("합격");
		}else {
			System.out.println("불합격");
		}
// ex) 구매할 물건 등록
//     물건명 : 
//     가격 : 
//     갯수 :
//     구매 내역 : @@@ @@@  총비용 @@@
		
		
	}

}
