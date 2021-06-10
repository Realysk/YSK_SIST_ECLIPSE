package javaexp.a11_io;

import java.io.IOException;
import java.io.InputStream;

public class A02_inputStreamExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 ex1) 정답을 입력하세요 :
		 	1단계 : 입력받은 번호는 @@ 번입니다.
		 	2단계 : 조건문을 이용해서 임의의 번호가 맞을 때, 정답/오답
		 	3단계 : 임의의 번호(랜덤 1~4) 발생하게 처리.
		 			랜덤숫자 숫자형식, 입력한 데이터는 문자
		 			1 == '1' (X)
		 			2 == '2' (X)
		 			3 == '3' (X)
		 		char 문자열이 아니고, 문자이기 때문에 stack영역에 데이터가 할당.
		 	// 1, '1'
		 	// println() : 다음 라인에서 입력
		 	// print() : 현재 라인 마지막에 입력
		 	*/
				System.out.println("정답을 입력하세요(1-4) : ");
				InputStream is = System.in;
				
				try {
					char inData = (char)is.read();
					System.out.println("입력 받은 번호는 : " + inData + " 번 입니다.");
					char corNum = '3'; // 정답번호 설정
					if(inData == corNum) {
						System.out.println("정답");
					} else {
						System.out.println("오답");
					}
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						is.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				}
			/*
			 
			 */

				}
		}
}
