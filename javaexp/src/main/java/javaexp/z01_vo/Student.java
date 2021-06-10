package javaexp.z01_vo;

public class Student {
	private int num;
	private int kor;
	private int eng;
	private int math;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(int num, int kor, int eng, int math) {
		super();
		this.num = num;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	public void show() {
		System.out.print(num+"\t");
		System.out.print(kor+"\t");
		System.out.print(eng+"\t");
		System.out.print(math+"\t");
		int tot = kor+eng+math;
		System.out.print(tot+"\t");
		System.out.print(tot/3+"\t");
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
}
