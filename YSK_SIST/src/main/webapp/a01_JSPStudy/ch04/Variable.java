package ch04;

public class Variable {

	public String name = "JSPStudy";
	public int year = 2013;

	public void jspStudy() {
		System.out.println("���� name�� " + name + "�Դϴ�.");
		System.out.println("���� year�� " + year + "�Դϴ�.");
		System.out.println(name + year);
	}

	public static void main(String[] args) {
		Variable v = new Variable();
		v.jspStudy();

	}
}
