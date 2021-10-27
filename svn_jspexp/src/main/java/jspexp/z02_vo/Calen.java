package jspexp.z02_vo;

public class Calen {
	private int year;
	private int month;
	private int date;
	private String schedule;
	public Calen() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calen(int year, int month, int date, String schedule) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
		this.schedule = schedule;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	
}
