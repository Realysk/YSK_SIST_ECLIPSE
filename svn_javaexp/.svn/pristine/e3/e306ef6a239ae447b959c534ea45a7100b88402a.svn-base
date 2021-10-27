package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStream;

public class A03_InputStreamExp {

	public static void main(String[] args) {
/*
	3단계: 임의의 번호를(랜덤으로1~4)이 발생하게 처리..
	     랜덤숫자 숫자형식, 입력한데이터는 문자 
 */		
		// TODO Auto-generated method stub
		System.out.print("정답을 입력하세요(1-4):");
		InputStream is = System.in;		
		try {
			char inData = (char)is.read();
			// 문자열의 숫자로 변환  Integer.parseInt("문자열")
			///    ""+'A' ==> "A" : 앞에 ""+가 붙으면 모든 데이터 유형
			//     문자열로 변환..
			//     ""+27 ==> "27"
			int inNum = Integer.parseInt(""+inData);
			System.out.println("입력 받은 번호는 "+inNum+"번입니다");
			int corNum = (int)(Math.random()*4+1); // 정답번호 설정..
			System.out.println("정답은 "+corNum);
			if( inNum == corNum ) {
				System.out.println("정답");
			}else {
				System.out.println("오답");
			}		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
