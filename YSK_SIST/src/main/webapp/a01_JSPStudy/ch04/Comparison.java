package ch04;

public class Comparison {
	public static void main(String[] args) {
		int a = 5;
		int b = 3;
		int r1 = 10, r2 = 10, r3 = 10, r4 = 10, r5 = 10, r6 = 10;

		r1 = a;
		r2 += a;
		r3 -= a;
		r4 *= a;
		r5 /= a;
		r6 %= a;

		System.out.println("�񱳿�����");
		System.out.println("a > b�� " + (a > b) + "�Դϴ�.");
		System.out.println("a >= b�� " + (a >= b) + "�Դϴ�.");
		System.out.println("a == b�� " + (a == b) + "�Դϴ�.");
		System.out.println("a != b�� " + (a != b) + "�Դϴ�.");
		System.out.println("���Կ�����");
		System.out.println("r1 = a�� " + r1 + "�Դϴ�.");
		System.out.println("r2 += a�� " + r2 + "�Դϴ�.");
		System.out.println("r3 -= a�� " + r3 + "�Դϴ�.");
		System.out.println("r4 *= a�� " + r4 + "�Դϴ�.");
		System.out.println("r5 /= a�� " + r5 + "�Դϴ�.");
		System.out.println("r6 %= a�� " + r6 + "�Դϴ�.");
	}
}
