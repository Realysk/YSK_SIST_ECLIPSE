package javaexp.a09_api;

import java.util.StringTokenizer;

public class A12_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # String 기능 메서드
		 	5) "대상문자열".replace("찾는문자열","변경할문자열")
		 	
		 		*/
					String target = "자바는 객체지향 프로그램입니다.\n "
									+ "자바는 풍부한 API를 지원합니다.";
					String newStr = target.replace("자바", "JAVA");
					System.out.println("기존 문자열 : " + target);
					System.out.println("변경한 문자열 : " + newStr);	
				/*
		
			6) "문자열".substring(추출할시작위치, 추출할마지막위치+1)
					단, 마지막 문자열은 +를 하지 않는다.
				특정한 문자열에서 문자열을 추출하여 문자를 만들 때 사용한다.
			 	
			 	*/
					String subStr = target.substring(4, 12);
					System.out.println("추출한 문자열 : " + subStr);
				/*
			
			ex) 자신의 주민번호를 통해서 생년월일을 추출하여
				"주민번호 : @@@@@@
				@@년 @@월 @@일 생입니다."
				를 출력하세요.
				
				*/
					String serialNum = "970225";
					String subSerial1 = serialNum.substring(0, 2);
					String subSerial2 = serialNum.substring(2, 4);
					String subSerial3 = serialNum.substring(4, 6);
					System.out.println("추출한 연도 : " + subSerial1);
					System.out.println("추출한 월 : " + subSerial2);
					System.out.println("추출한 일 : " + subSerial3);
					System.out.println("주민번호 : " + serialNum + "\n");
					System.out.println("## 나의 생년월일 ## \n");
					System.out.println(subSerial1 + "년 " + subSerial2 + "월 " + subSerial3 + "일 생입니다.\n");
				/*
			
			7) 문자열.split("구분자") : 특정 문자열을 구분자에 의해 구분해서 해당 데이터를 배열로 할당
			
				*/
					String data01 = "사과 & 바나나 & 딸기";
					String[] fruits = data01.split("&");
					// {"사과","바나나","딸기"}
					// forEach 구문 : for(단위데이터:배열) {}
					for(String fruit:fruits) {
						// 반복문을 통해서 배열 안에 구성하는 요소를 하나씩 뽑아서 fruit 변수에 담고 출력.
						System.out.println(fruits);
					}
					
				/*
			
			ex) 서울-대구-대전-부산 나열된 문자열을 split 구문을 통해서 처리하고 해당 내용을 forEach 구문으로 출력하세요.
				*/
					System.out.println("##");
					String data02 = "서울-대구-대전-부산";
					String []locs = data02.split("-");
					for(String loc:locs) {
						System.out.println(loc);
					}
				/*
				
				사과 & 바나나 & 딸기 - 오렌지 & 수박 & 딸기 - 키위 & 바나나 & 복숭아
				=> 이중 for문 활용
				
			# StringTokenizer("문자열","구분자")
				1. 기능 메서드 ex) 사과 & 바나나 & 딸기
					countTokens() : 구분자를 통해 나온 데이터 건수
					nextToken() : 구분자를 통해서 나온 각 데이터 하나씩. 호출시 마다 하나씩 데이터를 가져온다.
					hasMore Tokens() : 해당 데이터가 있을 때 true, row 단위로 변경.
					
				*/
					StringTokenizer st = new StringTokenizer("오렌지 & 수박 & 딸기" + "&");
					int count = st.countTokens();
					System.out.println("# TOKEN #");
					for(int cnt=1; cnt<=count; cnt++) {
						String token = st.nextToken();
						System.out.println(token);
					}
					st = new StringTokenizer("홍길동/김길동/신길동","/");
					while(st.hasMoreTokens()) {
						String token = st.nextToken();
						System.out.println(token);
					}
				/*
			
			ex) StringTokenizer를 활용하여 물건명@가격@갯수 로 해당 데이터를 출력하세요. (for문, while문)
			
				*/
					StringTokenizer st2 = new StringTokenizer("사과@3000@2", "@");
					int count2 = st2.countTokens();
					System.out.println("# TOKEN 예제 문제 #");
					for(int cnt=1; cnt<=count2; cnt++) {
						System.out.println(st2.nextToken());
					}
					System.out.println("##");
					st2 = new StringTokenizer("사과@3000@2", "@");
					while(st2.hasMoreTokens()) {
						System.out.println(st2.nextToken());
					}
				/*
		 */
	}

}
