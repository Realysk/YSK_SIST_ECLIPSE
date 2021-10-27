package javaexp.a09_api;

import java.io.UnsupportedEncodingException;
import java.util.Scanner;

public class A11_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
# String 문자열의 시작
1. 숫자
	0,1 : 데이터 최소단위 bit
	01010101 ==> 8개 byte ==> 정수형의 가장 기본 데이터
	==> 숫자들에 코드를 대입해서 'A', 'B' 문자를 설정하여 생성되었다.
	문자들이 배열로 만들어서 일상에 문자열을 사용하게 되었음.
	{'H','e','l','l','o'} 
	==>
	{25,34,72,43,22} : 코드값으로 bytes 배열은 문자가 모인 문자열로
	사용할 수 있다.
	==> 객체지향 프로그램에서 char[] 배열에서 한단계 더 나아가 String
	문자열 객체를 만들게 되었다. c++부터 사용되기 시작하였다.
*/
		System.out.println(65);
		System.out.println((char)65);
/*		
# String 
1. 문자열 처리 객체.. 
2. 생성자로 byte[]을 받아서 처리..
		 */
		byte[] bytes = { 72, 101, 108, 108, 111, 32, 74, 
				97, 118, 97 };
		// 숫자에 해당하는 문자(char)가 모여서 문자열을 이루게 한다는 개념하에
		// String 생성자를 통해서 문자열을 만들 수 있게 하였다..
		String str1 = new String(bytes);
		System.out.println("출력:" + str1);
		for (int code = 64; code <= 128; code++) {
			System.out.println(code + ":" + (char) code);
		}
		System.out.println((int) 'G');
		System.out.println((int) 'o');
		System.out.println((int) 'o');
		System.out.println((int) 'd');
		System.out.println((int) ' ');
		System.out.println((int) 'j');
		System.out.println((int) 'o');
		System.out.println((int) 'b');
		System.out.println((int) '!');
//	ex) 위와같이 byte 배열와 유니코드값을 이용해서 Good job을 출력하세요 [6조]
		byte[] bytes2 = { 71, 111, 111, 100, 32, 106, 111, 98, 33 };
		String str2 = new String(bytes2);
		System.out.println("출력:" + str2);
		/*
3. 여러가지 기능 메서드 
 * 1) charAt(index) : 특정 index 위치에 있는 문자를 리턴받는다.
		 * 
		 */
		String name = "himan";
		System.out.println("charAt(2):" + name.charAt(2));
//	ex) 주민번호를 문자열로 지정해서,  특정 위치에 있는 문자를 가져와서 
//		 1,3일 때  남자, 2,4일때는 여자로 표기하세요  [1조]   	
		String ssn = "010624-1230123";
		char gender = ssn.charAt(7);

		// switch(문자/문자열) 도 가능..
		switch (gender) {
//			case 1:     1 , '1' 천지 차이..
		case '1': // break가 없어 계속 밑으로
		case '3':
			System.out.println("남자");
			break;
		case '2': // break가 없어 계속 밑으로
		case '4':
			System.out.println("여자");
			break;
		default:
			System.out.println("해당 범위는 [1~4]까지 입니다.");
		}

		int num = 1;
		System.out.println("1의 코드값:" + (char) num);
		/*
		 * 2) getBytes() : 문자열의 byte배열을 가져온다. 이때, 매개변수값으로 EUC-KR이나 UTF-8로 한글 encoding
		 * 형식을 지정할 수 있다.
		 */
		String str3 = "반가워요";
		byte[] bytes3 = str3.getBytes();
		String str4 = new String(bytes3);
		System.out.println("문자열 4번째:" + str4);
		try {
			byte[] bytes4 = str3.getBytes("EUC-KR");
			String str5 = new String(bytes4);
			System.out.println("문자열 5번째:" + str5);
			byte[] bytes5 = str3.getBytes("UTF-8");
			String str6 = new String(bytes5);
			System.out.println("문자열 6번째:" + str6);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		ex) 오늘도 즐겁고 감사한 하루!! encoding으로 euc-kr과 utf-8로 처리하여
//	    출력하세요  		
		String strA = "오늘도 즐겁고 감사한 하루!!";
		System.out.println("문자열A: " + strA);
		
		try {
			byte[] byte1 = strA.getBytes("EUC-KR");
			String strB = new String(byte1);
			System.out.println("문자열B: " + strB);

			byte[] byte2 = strA.getBytes("UTF-8");
			String strC = new String(byte2);
			System.out.println("문자열C: " + strC );

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
/*
	3) indexOf("찾을문자열")
		해당 문자 안에서 찾을 문자열의 시작 위치를 index로 리턴 해준다.
		해당 문자열을 포함하지 않으면 -1을 리턴한다.
	4) length() : 문자열의 크기를 나타낸다.
		 cf) length : 배열의 크기
 * */
		//            0 1234 56 789
		String msg = "점심 맛나게 드셨나요??";
		int idxLoc = msg.indexOf("맛나게");
		System.out.println("시작 위치:"+idxLoc);
		if(msg.indexOf("짜장면") != -1) {
			System.out.println("짜장면 관련 위치!! 확인");
		}else {
			System.out.println("짜장면 해당 문자열을 발견하지 못 했습니다.");
		}
		System.out.println("문자열의 크기:"+msg.length());
		
// ex) "메뉴는 사과, 바나나, 딸기입니다."
//     선택할 과일을 입력하세요.. Scanner 입력받아서
//	   indexOf를 입력한 과일이 없으면? 해당 과일은 메뉴에 없습니다.
//     각 index위치를 확인해서 1번째/2번째/3번째 과일임을 표시하세요.
//     @@ 번째 과일 @@를 선택했습니다.
/*	대상문자열.indexOf(찾고자하는문자열) :
 * 	결과로 찾고자하는 문자열이 없으면 -1
 *  결과로 찾고자하는 문자열이 있으면 해당 문자열의 시작 위치를 리턴한다.
 *  Scanner sc = new Scanner(System.in);sc.nextLine() 
 *  	: 문자열을 입력받아서 enter키 입력 전까지  
 *  switch(입력된index){
 *  	case index번호 : 처리할 내용  break;
 *  	case index번호 : 처리할 내용  break;
 *  	case index번호 : 처리할 내용  break;
 *  	default : 위에 나열된 경우가 아닐 때..
 *  }
 * */		
		
		String menuShow = "메뉴는 사과, 바나나, 딸기입니다.";
		System.out.print("선택할 과일을 입력하세요:");
		Scanner sc = new Scanner(System.in);
		String chFruit = sc.nextLine();
		int findIdx = menuShow.indexOf(chFruit);
		System.out.println("선택한 index:"+findIdx);
		switch(findIdx) {
			case -1: System.out.println("해당 과일은 메뉴에 없습니다."); break;
			case 4: System.out.println("첫번째 과일 사과를 선택했습니다."); break;
			case 8: System.out.println("두번째 과일 사과를 선택했습니다."); break;
			case 13: System.out.println("세번째 과일 사과를 선택했습니다."); 
		}
	}

}
