package ch04;

public class Arithmetic {
	public static void main(String[] args) {
		int a = 5;
		int b = 3;
		int c1, c2, c3, c4, c5;

		c1 = a + b;
		c2 = a - b;
		c3 = a * b;
		c4 = a / b;
		c5 = a % b;

		System.out.println("���������");
		System.out.println("a + b�� " + c1 + "�Դϴ�.");
		System.out.println("a - b�� " + c2 + "�Դϴ�.");
		System.out.println("a * b�� " + c3 + "�Դϴ�.");
		System.out.println("a / b�� " + c4 + "�Դϴ�.");
		System.out.println("a / b�� �������� " + c5 + "�Դϴ�.");
		System.out.println("-------------------------------------------");
		System.out.println("����������");
		System.out.println("++a�� " + (++a)+"�Դϴ�.");
		System.out.println("--a�� " + (--a)+"�Դϴ�.");
		System.out.println("a++�� " + (a++)+"�Դϴ�.");
		System.out.println("a--�� " + (a--)+"�Դϴ�.");
		System.out.println(a);
	}

}
