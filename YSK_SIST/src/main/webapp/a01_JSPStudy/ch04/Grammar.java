package ch04;

public class Grammar {

	public String name = "JSPStudy";
	

	public void jspStudy(int year) {
		System.out.println("���� name�� " + name + "�Դϴ�.");
		System.out.println("���� year�� " + year + "�Դϴ�.");
		System.out.println(name + year);
	}

	public static void main(String[] args) {
		int year = 2013;
		Grammar g = new Grammar();
		g.jspStudy(year);
	}
}
