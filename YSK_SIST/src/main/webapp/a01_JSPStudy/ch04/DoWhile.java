package ch04;

public class DoWhile {
	public static void main(String[] args) {

		int a = 11;

		do {
			System.out.println(a);
			if (a == 10) {
				System.out.println("a�� " + a + "�̹Ƿ� while���� ����˴ϴ�.");
			}// if
			a++;
		} while (a <= 10);// do-while
	}
}
