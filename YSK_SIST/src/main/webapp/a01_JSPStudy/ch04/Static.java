package ch04;

public class Static {

	static String jspStudy = "static���� ����� �����Դϴ�.";
	
	private static void jspStudy() {
		String jspStudy = "static���� ����� �޼ҵ��Դϴ�.";
		System.out.println(jspStudy);
	}

	public static void main(String[] args) {
		System.out.println(jspStudy);
		Static.jspStudy();
	}
}