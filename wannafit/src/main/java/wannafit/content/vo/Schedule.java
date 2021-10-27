package wannafit.content.vo;

public class Schedule {
	private String Snum;
	private String title;
	private String work1;
	private String work2;
	private String work3;
	private String work4;
	private String date01;
	private String comment01;
	
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Schedule(String Snum) {
		super();
		this.Snum= Snum;
	}


	public Schedule(String Snum, String title, String work1, String work2, String work3, String work4, String date01, String comment01) {
		super();
		this.Snum = Snum;
		this.title = title;
		this.work1 = work1;
		this.work2 = work2;
		this.work3 = work3;
		this.work4 = work4;
		this.date01 = date01;
		this.comment01 = comment01;
		
		
	}
	public void setSnum(String Snum) {
		this.Snum = Snum;
	}
	public String getSnum() {
		return Snum;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public String getWork1() {
		return work1;
	}
	public void setWork1(String work1) {
		this.work1 = work1;
	}
	public String getWork2() {
		return work2;
	}
	public void setWork2(String work2) {
		this.work2 = work2;
	}
	public String getWork3() {
		return work3;
	}
	public void setWork3(String work3) {
		this.work3 = work3;
	}
	public String getWork4() {
		return work4;
	}
	public void setWork4(String work4) {
		this.work4 = work4;
	}
	public String getDate() {
		return date01;
	}
	public void setDate(String date) {
		this.date01 = date;
	}
	public String getComment() {
		return comment01;
	}
	public void setComment(String comment) {
		this.comment01 = comment;
	}


	
	public String toString() {
		return "Schedule [title=" + title + ", work1=" + work1 + ", work2=" + work2 + ", work3=" + work3 + ", work4="
				+ work4 + ", date=" + date01 + ", comment=" + comment01 + "]";
	}
}
