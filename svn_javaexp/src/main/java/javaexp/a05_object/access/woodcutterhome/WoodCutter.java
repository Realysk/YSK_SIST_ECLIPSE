package javaexp.a05_object.access.woodcutterhome;

public class WoodCutter {
	private String hiddenCloth="날개 옷은 뒷동산 바위밑";
	String savingMoney="가족들과 공유하는 생활비"; 
	// 접근제어자가 붙지 않는 것을 default 접근제어 : 패키내에서만 접근
	protected String inheritMoney="상속재산을 숨긴 곳";
	// 상속하는 외부패키지 클래스에서 사용가능
	public String weddingDaugherDate="막내딸 결혼일(공지사항)";
	// 모두가 접근 가능
	public void callData() {
		System.out.println(hiddenCloth);
		System.out.println(savingMoney);
		System.out.println(inheritMoney);
		System.out.println(weddingDaugherDate);
	}
}
