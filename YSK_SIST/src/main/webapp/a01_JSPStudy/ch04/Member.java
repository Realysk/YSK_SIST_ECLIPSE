package ch04;

public class Member {

	String m;
	String m1 = "��������Դϴ�.";

	public Member() {
		String m = "���������Դϴ�.";
		System.out.println(m);
	}

	public static void main(String[] args) {
		Member member = new Member();
		System.out.println("�ʱ�ȭ���� ���� ������� : " + member.m);
		System.out.println("�ʱ�ȭ�� ������� : " + member.m1);
	}

}
