package SungKeun.DHLOTTO.LT1_LOTTO645.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class test_date {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 프로그램을 구동 시간 기준 출력 (ex.영수증 출력 시 사용)
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println("프로그램 구동 시간 기준 : " + dateFormat.format(cal.getTime()));
	}

}
