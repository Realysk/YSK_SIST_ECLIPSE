package javaexp.com.Model;

public class FileVO {

	private int num;
	private String author;
	private String title;
	private String file;
	private String day;
	
	public FileVO(int num, String author, String title, String file, String day) {
		this.num = num;
		this.author = author;
		this.title = title;
		this.file = file;
		this.day = day;
	}
	public int getNum() {
		return num;
	}
	public String getAuthor() {
		return author;
	}
	public String getTitle() {
		return title;
	}
	public String getFile() {
		return file;
	}
	public String getDay() {
		return day;
	}
	
	
}
