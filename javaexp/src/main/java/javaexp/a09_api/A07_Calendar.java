package javaexp.a09_api;

import java.util.Calendar;

public class A07_Calendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
			# 날짜데이터 처리 클래스 Calendar (시간 + 날짜 + 위치)
				1. 기본적으로 데이터의 처리방식이
					시간 => 일 => 주 => 월 => 년
					단위로 처리되는 객체를 생성하고 활용할 수 있게 처리해 준다.
				2. Calendar 객체의 생성 .getInstance()
		*/
					// 1. 캘린더 객체 생성
					// 		클래스명.필드 : static 필드
					//		Calendar.DAY_OF_WEEK
					//		클래스명.대문자 : final이라는 필드에 붙으면 상수 (변경되지 않는 수)
					// 		클래스명.메서드() : static 메서드
					//		static 객체변수가 아닌 객체 공유 메모리 영역 (클래스)
					//		클래스
					Calendar cal = Calendar.getInstance();
					System.out.println("생성된 객체 : " + cal);
					// 1) 캘린더 객체는 위치(경도)에 따르고 여러가지 날짜처리 규칙을 가지고 있다.
					// 2) 캘린더는 고유의 상수값으로 년/월/일을 구할 수 있다.
					//		= 년도의 상수값. Calendar.상수 : 객체 생성 없이 사용하는 static이고 상수인 대문자를 가지고 있다.
					//		Calendar.YEAR : static final 클래스 상수
					//		1 : 일이냐?
					System.out.println("년도의 상수 Calendar.YEAR : " + Calendar.YEAR);
					System.out.println("Calendar.MONTH : " + Calendar.MONTH);
					System.out.println("Calendar.DAY_OF_MONTH : " + Calendar.DAY_OF_MONTH);
					System.out.println("시 : " + Calendar.HOUR_OF_DAY);
					System.out.println("분 : " + Calendar.MINUTE);
					System.out.println("초 : " + Calendar.SECOND);
					// 3) 위에 선언된 고유의 상수값을 기준으로 현재 시간 구하기.
					int year = cal.get(Calendar.YEAR);
					// 월은 영미에서 고유의 문자(jan,feb)로 되어 있어서 우리나라와 체계가 차이가 있다.
					// 0부터 11 index로 매핑되어 있다. +1로 우리나라의 1월~12월과 연결 처리
					int month = cal.get(Calendar.MONTH)+1;
					int date = cal.get(Calendar.DAY_OF_MONTH);
					System.out.println(year + "년" + month + "월" + date + "일");
					// 요일도 문자열로 연결 0 ~ 6
					String[] days = {"일", "월", "화", "수", "목", "금", "토"};
					
					int weekIdx = cal.get(Calendar.DAY_OF_WEEK)-1;
					//System.out.println("weekIdx : " + weekIdx);
					System.out.println("현재 요일 : " + days[weekIdx]);
					
					/*
					 	ex) 위에서 처리하는 상수와 처리되는 기준으로
					 		int hour, minute, second를 할당하여 출력하세요.
					 		@@시 @@분 @@초
					 */
					
					// Ctrl + space (자동 코드 generator)
					// Calendar.
					int hour = cal.get(Calendar.HOUR);
					int minute = cal.get(Calendar.MINUTE);
					int second = cal.get(Calendar.SECOND);
					System.out.println("현재 시간 : " + hour + "시 " + minute + "분 " + second + "초");
					
					// 특정 날짜/시간 설정.
					Calendar cal2 = Calendar.getInstance();
					// 월은 0~11의 index범위로 설정하여 저장한다.
					cal2.set(2021, 9, 5); // 2021.10.5
					// cal2.set(매개변수의 갯수와 유형) : 매개변수의 갯수와 유형에 따라서 여러가지 데이터를 저장할 수 있다.
					// cal2.get("년도"); 문자열 통해 조건을 처리하면 메모리 비효율(X)
					// cal2.get(Calendar.YEAR); 상수(1~3)통해서 조건
					int year2 = cal2.get(Calendar.YEAR);
					int month2 = cal2.get(Calendar.MONTH)+1;
					int date2 = cal2.get(Calendar.DAY_OF_MONTH);
					System.out.println(year2 + "년 " + month2 + "월 " + date2 + "일");
					
					/*
					 	ex) cal3을 만들고 자신의 생년월일을 설정하고 다시 출력하세요.
					 */
					
					Calendar cal3 = Calendar.getInstance();
					// 월은 0~11의 index범위로 설정하여 저장한다.
					cal3.set(1997, 1, 25); // 1997.2.25
					int year3 = cal3.get(Calendar.YEAR);
					int month3 = cal3.get(Calendar.MONTH)+1;
					int date3 = cal3.get(Calendar.DAY_OF_MONTH);
					System.out.println("생년월일 : " + year3 + "년 " + month3 + "월 " + date3 + "일");
					
					
		}
}
