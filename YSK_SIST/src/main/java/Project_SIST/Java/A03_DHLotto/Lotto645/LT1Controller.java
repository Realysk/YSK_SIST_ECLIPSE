package Project_SIST.Java.A03_DHLotto.Lotto645;

import Project_SIST.Java.A03_DHLotto.CatchMe.Model;

public class LT1Controller {
	
	private LT1Service lt1service = new LT1Service();
	
	public String LT1List2(LT1DTO lt1, Model d) {
				
		System.out.println("===============================================\n");
		System.out.println("# Controller에서 받은 복권 입력 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("선택 한 복권 객체 : " + lt1.getMyLotto());
		System.out.println("\n# Controller에서 받은 당첨 번호 데이터 #\n");
//		Main에서 입력받은 정보를 Controller로 불러온다.
		System.out.println("당첨 된 번호 (보너스 포함) 객체 : " + lt1.getResult() + "\n");
		
		d.addAttribute("lt1list", lt1service.LT1List(lt1));
		return "LOTTO645_복권_입력_정보.jsp";
	}
}