package javaexp.a00_exp.a06;

import java.util.StringTokenizer;

public class A17_0601 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 정리문제
1. System. 하위에 기능메서드로 현재시스템에 대한 내용을 확인하고 처리할려고 한다.
    주요 메서드와 속성/속성값 처리 코드를 기술하세요.
    .getProperty("속성") : 운영체제의 해당 속성의 내용을 가져온다.
       - 속성 : os.name, user.name, user,home
    .getProperties() : 시스템의 모든 정보들을 Properties 객체로 가져온다.
    .keySet() : 해당 내용을 Set 형식의 key를 객체들로 가져올 수 있다.    
    Set set = System.getProperties().keySet();
    for(Object ob:set){
    	String key = (String)ob;
    	System.out.println(key + ":"
    		+System.getProperty(key));
    }
    
2. 시스템의 환경변수를 가져와서 해당 내용을 자바에서 확인할 때, 사용하는 객체와 메서드를 기술하세요.
	System.getEnv("환경변수의 key")
3. String 문자열이 만들어질 때까지 과정을 bit단위부터 기술해보세요.
	bit 01 ==> byte ==> 코드값으로 char
	char[], byte[]을 통해서 모인 배열이 객체형 타입으로 설정한 것이
	String이다.
	byte [] bytes = {64,27,30};
	char [] chars = {'H','e','l'};
	String str1 = new String(bytes);
	String str2 = new String(chars);

4. String 생성자를 통해, 알파벳 대문자 8자의 임의의 비밀번호를 만들려고 한다. 
    byte[] 배열을 이용하여 처리하세요.
*/
		byte[] pass = new byte[8]; // 8개 byte 배열 생성..
		// 알파벳 대문자 코드 범위 : 65~90 
		// (int)(Math.random()*26+65)
		// 배열의 데이터 입력 : pass.length길이 보다 index 1적다
		for(int idx=0;idx<pass.length;idx++) {
			// 실수형이므로 해당 byte에 넣기 위하여 타입 casting 처리
			pass[idx] = (byte)(Math.random()*26+65);
		}
		String password = new String(pass);
		System.out.println("임의의 비밀번호:"+password);
		
		
		
/*		
5. 학번을 연도(2자리)학년(2자리)반(1자리)성별(F/M)로 만들어서 처리할 때, 
    charAt와 substring을 활용해서 해당 내용을 추출하여
    @@@ 년도 입학, @@학년 @@반 남자/여자 로 출력하세요
*/
		String code01 = "15015F";
		// substring(0부터시작index, 1부터시작index)
		String yyyy = "20"+code01.substring(0,2);
		String grade = code01.substring(2,4);
		String class01 = code01.substring(4,5);
		// 삼항연산자 code01.charAt(5)=='F' 코드값이 F인지 여부에 따라
		//   true이면 "여자"를 할당, 그렇지 않으면 "남자"를 할당 처리
		String gender = code01.charAt(5)=='F'?"여자":"남자";
		
		System.out.println(yyyy+" 년도 입학, "+grade+"학년 "
				+class01+"반 "+gender);
		
/*		
6. 요일별로 중국집에 오늘은 메뉴를 바꿀려고 한다.
    요일을 랜덤으로 나오게 하여, 요일과 메뉴출력하는 란을 변경처리하세요
    오늘은 @@ 요일 @@ 메뉴 추천
    월 짜장
    화 짬뽕
    수 탕슉
    목 우동
    금 뽁음 
    토 마라
    일 우탕
*/
		String menu="오늘은  요일 @@ 메뉴 추천\n";
		menu+="월 짜장\n화 짬뽕\n수 탕슉\n목 우동\n금 뽁음\n토 마라\n일 우탕\n";
		String[]weeks= {"월","화","수","목","금","토","일"};
		String[]menus= {"짜장","짬뽕","탕슉","우동","뽁음","마라","우탕"};
		// 임의의 요일과 메뉴를 처리하기위하여 0~6 범위 임의 index값가져오기 처리
		int ranIdx = (int)(Math.random()*weeks.length);
		// 임의의 요일과 해당하는 요일의 메뉴를 할당.
		String week = weeks[ranIdx];
		String cmenu = menus[ranIdx];
		// menu 문자열에서 요일이라는 부분은 선택된 요일로 변경 처리..
		menu=menu.replace("요일", week+"요일");
		// @@로 메뉴는 선택된 메뉴로 대체.
		menu=menu.replace("@@", cmenu);
		System.out.println(menu);
		
		/*    
7. 다음과 같은 데이터를 2중 반복문으로 처리하여 구매 물품을 리스트 하세요.
   split(), StringTokenizer 둘다 활용
    사과&3000&2/바나나&4000&3/딸기&12000&5
*/
	String data = "사과&3000&2/바나나&4000&3/딸기&12000&5";
	StringTokenizer st = new StringTokenizer(data,"/");
	System.out.println("물건명\t가격\t갯수");
	while(st.hasMoreTokens()) {
		//  /로 물건 단위 정보를 처리하여,
		// split을 통해서 각 단위 데이터를 배열로 가져온다.
		// 사과&3000&2 ==> {"사과","3000","2"};
		String fruits[] = st.nextToken().split("&");
		// forEach 구문을 통하여 배열의 단위 데이터를 String fruit에
		// 할당하면서 하나씩 데이터를 뽑아서, \t(탭간격)을 설정
		for(String fruit:fruits) {
			
			System.out.print(fruit+"\t");
		}
		System.out.println();
	}
	
    
/*    
6. 함수의 두가지 유형은 기술하세요..(DB)
                1) 단일 행 함수 :
                   개별 행을 대상으로 하는 함수를 적용하여 하나의 결과를 반환하는 함수
                2) 복수 행 함수 :
                   조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수 
7. 사원명을 대소문자 구분없이 a를 입력했을 때, 해당 사원을 keyword검색되게 sql을 처리하세요(DB)
SELECT *
FROM EMP e
WHERE ename LIKE '%'||upper('a') ||'%';
-- 데이터는 대/소문자를 구분하기 때문에  함수를 이용해서 변환 후, 처리
-- || 검색할 keyword 문자열 연결처리
-- '%'||upper('a') ||'%' 

 * */
	}

}
