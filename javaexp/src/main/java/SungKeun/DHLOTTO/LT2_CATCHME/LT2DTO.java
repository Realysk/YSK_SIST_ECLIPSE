package SungKeun.DHLOTTO.LT2_CATCHME;

// 창문 번호 선택 및 당첨 결과 출력
public class LT2DTO {
	private int myLotto[] = new int[6]; // 선택한 창문 번호
	private int result[] = new int[6]; // 자동으로 생성된 당첨 번호
	
	public LT2DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LT2DTO(int[] myLotto, int[] result) {
		super();
		this.myLotto = myLotto;
		this.result = result;
	}
	
	public void showInfo(int[] arr) {
		for(int i = 0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		System.out.println();
	}

	public int[] getMyLotto() {
		return myLotto;
	}

	public void setMyLotto(int[] myLotto) {
		this.myLotto = myLotto;
	}

	public int[] getResult() {
		return result;
	}

	public void setResult(int[] result) {
		this.result = result;
	}
	
}