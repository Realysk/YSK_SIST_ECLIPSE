package javaexp.a05_object.access.woodcutterhome;

public class WoodCutter {
	private String hiddenCloth = "날개 옷은 뒷동산 바위 밑";
	String savingMoney = "가족들과 공유하는 생활비";
	protected String inheritMoney = "상속 재산을 숨깃 곳";
	public String weddingDaugherDate = "막내 딸 결혼일(공지사항)";
	public void callData() {
		System.out.println(hiddenCloth);
		System.out.println(savingMoney);
		System.out.println(inheritMoney);
		System.out.println(weddingDaugherDate);
	}

}
