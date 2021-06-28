package SungKeun.DHLOTTO.LT2_CATCHME.backup;

import java.util.ArrayList;

public class LT2Service2 {
	LT2DAO2 lt2dao = new LT2DAO2();
	public ArrayList<LT2DTO2> LT2List(LT2DTO2 lto2) {

		System.out.println("===============================================\n");
		System.out.println("# Service #\n");
//		DAO로 데이터를 넘기기 위한 확인 과정
		System.out.println("LT2DAO에 전송 할 복권 입력 데이터 1 (선택 한 창문 번호) : "
				+ lto2.getMyLotto() + "\n");
		System.out.println("LT2DAO에 전송 할 당첨 번호 데이터 2 (당첨 된 창문 번호) : "
				+ lto2.getResult() + "\n");
		System.out.println("LT2DAO에서 받을 복권 입력 데이터 크기 : "
				+ lt2dao.LT2List(lto2).size() + "\n");
		return lt2dao.LT2List(lto2);
	}
}
