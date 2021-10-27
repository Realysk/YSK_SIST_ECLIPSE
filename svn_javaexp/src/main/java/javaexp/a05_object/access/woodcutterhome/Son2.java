package javaexp.a05_object.access.woodcutterhome;

public class Son2 extends WoodCutter{
	public void callData() {
		// 상속관계에 있는 외부 패키지에 있는 클래스
		// 1. private 는 접근불가
//		System.out.println(hiddenCloth);
		// 2. default 즉 같은 패키지에 있어야지 상속가능
		System.out.println(savingMoney);
		// 3. protected 외부패키지이지만, 상속관계에 있으면 접근가능.
		System.out.println(inheritMoney);
		// 4. public은 어떤 패키지에 있더라도 상속가능
		System.out.println(weddingDaugherDate);
	}
}
