package jspexp.a01_start;
// jspexp.a01_start.A01_Movie
public class A01_Movie {
	
	private String title;
	private int visitCnt;
	private String openDate;
	
	public A01_Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public A01_Movie(String title, int visitCnt, String openDate) {
		super();
		this.title = title;
		this.visitCnt = visitCnt;
		this.openDate = openDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	

}
