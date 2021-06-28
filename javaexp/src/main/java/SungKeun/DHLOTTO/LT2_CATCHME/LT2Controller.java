package SungKeun.DHLOTTO.LT2_CATCHME;

import SungKeun.DHLOTTO.Model;

public class LT2Controller {
	
	private LT2Service lt2service = new LT2Service();
	
	public String LT2List2(LT2DTO lt2, Model d) {
				
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 복권 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("선택한 창문 번호 객체 : " + lt2.getMyLotto());
		System.out.println("\n# Controller에서 받은 당첨 번호 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("당첨 된 창문 번호 객체 : " + lt2.getResult() + "\n");
				
		d.addAttribute("lt2list", lt2service.LT2List(lt2));
		return "CATCHME_복권_입력_정보.jsp";
	}
}