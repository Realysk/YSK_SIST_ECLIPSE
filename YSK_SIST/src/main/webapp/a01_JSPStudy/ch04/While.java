package ch04;

public class While {
	public static void main(String[] args) {

		int a = 1;

		while (a <= 10) {
			System.out.println(a);
			if (a == 10) {
				System.out.println("a�� " + a + "�̹Ƿ� while���� ����˴ϴ�.");
			}// if
			a++;
		}// while
	}
}
