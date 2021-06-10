package javaexp.a05_object.access.woodcutterhome;

/*
 	1. package명은 계층구조와 상관없이 동일한 이름으로 선언되어지 같은 패키지이다.
	2. package명은 종속관계로 선언되지 않는다.
 */
	public class Angel {
		public void callData() {
			WoodCutter wc = new WoodCutter();
//			같은 패키지일지라도 접근제어자 private는 접근불가
//			System.out.println(wc.hiddenCloth);
			System.out.println(wc.savingMoney);
//			package 범위로 접근하는 멤버는 그 이상의 protected나 public도 접근이 가능하다.
			System.out.println(wc.inheritMoney);
			System.out.println(wc.weddingDaugherDate);
	}
}
