package ch04;

public class Switch {
	public static void main(String[] args) {

		int score = 80;

		switch (score) {

		case 100:
			System.out.println("������ 100���Դϴ�.");
			break;
		case 90:
			System.out.println("������ 90���Դϴ�.");
			break;
		case 80:
			System.out.println("������ 80���Դϴ�.");
			break;
		default:
			System.out.println("������ 70���Դϴ�.");
			break;
		}// switch-case
	}
}
