package wannafit.content.vo;

import java.sql.Date;

public class Reserve_Schedule {

	// 예약일정
	String wrs_num;		// 예약일정번호
	String wrs_title;	// 예약명
	
	Date wrs_date;		// 예약날짜(date)
	String wrs_dateS;	// 예약날짜(String)
	String wrs_day;		// 예약날짜 변환 - 날짜
	String wrs_year;	// 예약날짜 변환 - 연도
	String wrs_mon;		// 예약날짜 변환 - 월
	String wrs_nday;	// 예약날짜 변환 - 일
	String wrs_time;	// 예약날짜 변환 - 시간
	String wrs_hour;	// 예약날짜 변환 - 시간
	String wrs_min;		// 예약날짜 변환 - 분
	
	int wrs_price;		// 예약금액
	String wrs_step;	// 예약진행단계
	String wm_id;
	
	

	
	public Reserve_Schedule() {
		super();
	}
	
	public Reserve_Schedule(Date wrs_date) {
		super();
		this.wrs_date = wrs_date;
	}
	
	public Reserve_Schedule(String wrs_num, String wrs_title, Date wrs_date, String wrs_step) {
		super();
		this.wrs_num = wrs_num;
		this.wrs_title = wrs_title;
		this.wrs_date = wrs_date;
		this.wrs_step = wrs_step;
	}
	
	// 예약일정 등록
	public Reserve_Schedule(String wrs_title, String wrs_dateS, int wrs_price, String wm_id) {
		super();
		this.wrs_title = wrs_title;
		this.wrs_dateS = wrs_dateS;
		this.wrs_price = wrs_price;
		this.wm_id = wm_id;
	}
	
	

	public Reserve_Schedule(String wrs_num, String wrs_title, String wrs_dateS, 
			int wrs_price, String wrs_step, String wm_id) {
		super();
		this.wrs_num = wrs_num;
		this.wrs_title = wrs_title;
		this.wrs_dateS = wrs_dateS;
		this.wrs_price = wrs_price;
		this.wrs_step = wrs_step;
		this.wm_id = wm_id;
	}

	// 예약일정 조회
	public Reserve_Schedule(String wrs_num, String wrs_title, String wrs_day, 
			String wrs_time, int wrs_price, String wrs_step, String wm_id) {
		super();
		this.wrs_num = wrs_num;
		this.wrs_title = wrs_title;
		this.wrs_day = wrs_day;
		this.wrs_time = wrs_time;
		this.wrs_price = wrs_price;
		this.wrs_step = wrs_step;
		this.wm_id = wm_id;
	}
	
	// 예약일정 조회
	public Reserve_Schedule(String wrs_num, String wrs_title, String wrs_year, String wrs_mon, String wrs_nday,
			String wrs_hour, String wrs_min, int wrs_price, String wrs_step, String wm_id) {
		super();
		this.wrs_num = wrs_num;
		this.wrs_title = wrs_title;
		this.wrs_year = wrs_year;
		this.wrs_mon = wrs_mon;
		this.wrs_nday = wrs_nday;
		this.wrs_hour = wrs_hour;
		this.wrs_min = wrs_min;
		this.wrs_price = wrs_price;
		this.wrs_step = wrs_step;
		this.wm_id = wm_id;
	}

	public String getWrs_year() {
		return wrs_year;
	}

	public void setWrs_year(String wrs_year) {
		this.wrs_year = wrs_year;
	}

	public String getWrs_mon() {
		return wrs_mon;
	}

	public void setWrs_mon(String wrs_mon) {
		this.wrs_mon = wrs_mon;
	}

	public String getWrs_nday() {
		return wrs_nday;
	}

	public void setWrs_nday(String wrs_nday) {
		this.wrs_nday = wrs_nday;
	}

	public String getWrs_hour() {
		return wrs_hour;
	}

	public void setWrs_hour(String wrs_hour) {
		this.wrs_hour = wrs_hour;
	}

	public String getWrs_min() {
		return wrs_min;
	}

	public void setWrs_min(String wrs_min) {
		this.wrs_min = wrs_min;
	}

	public String getWrs_num() {
		return wrs_num;
	}

	public void setWrs_num(String wrs_num) {
		this.wrs_num = wrs_num;
	}

	public String getWrs_title() {
		return wrs_title;
	}

	public void setWrs_title(String wrs_title) {
		this.wrs_title = wrs_title;
	}

	public Date getWrs_date() {
		return wrs_date;
	}

	public void setWrs_date(Date wrs_date) {
		this.wrs_date = wrs_date;
	}

	public String getWrs_step() {
		return wrs_step;
	}

	public void setWrs_step(String wrs_step) {
		this.wrs_step = wrs_step;
	}

	public String getWm_id() {
		return wm_id;
	}

	public void setWm_id(String wm_id) {
		this.wm_id = wm_id;
	}

	public String getWrs_day() {
		return wrs_day;
	}

	public void setWrs_day(String wrs_day) {
		this.wrs_day = wrs_day;
	}

	public String getWrs_time() {
		return wrs_time;
	}

	public void setWrs_time(String wrs_time) {
		this.wrs_time = wrs_time;
	}

	public int getWrs_price() {
		return wrs_price;
	}

	public void setWrs_price(int wrs_price) {
		this.wrs_price = wrs_price;
	}

	public String getWrs_dateS() {
		return wrs_dateS;
	}

	public void setWrs_dateS(String wrs_dateS) {
		this.wrs_dateS = wrs_dateS;
	}

}
