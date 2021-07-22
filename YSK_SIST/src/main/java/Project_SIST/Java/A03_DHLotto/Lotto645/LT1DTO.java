package Project_SIST.Java.A03_DHLotto.Lotto645;

// 복권 번호 선택 및 당첨 번호 출력
public class LT1DTO {
	private int myLotto[] = new int[6]; // 선택한 복권 번호
	private int result[] = new int[6]; // 자동으로 생성된 당첨 번호
	
	public LT1DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LT1DTO(int[] myLotto, int[] result) {
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