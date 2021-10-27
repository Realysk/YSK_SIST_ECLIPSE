package javaexp.z05_project.sample01;

import javaexp.z01_vo.Product;




public class XXXController {
// 화면단에서 오는 데이터를 받고,
// 화면단에 전달할 데이터를 설정하는 기능
// 게시판 검색 처리..
// 	 물건명 [   ] 가격 [1000   ] ~ [2000   ]  [검색] 
//   물건명 가격 갯수 기타..
//   @@@  @@@ @@@ @@
//   @@@  @@@ @@@ @@
//   @@@  @@@ @@@ @@
// 입력 : 물건명, 가격  - controller의 메서드의 매개변수로 설정해준다. 
// 출력 : 물건명 리스트  - Model 객체에 key, value형식으로 할당 처리.
//                     마지막 매개변수로 선언해놓는다.
// select * 
// from product
// where name like '%'||'물건명'||'%'
//  and price between 가격의최소 and 가격의최대; 
	
/*
1. 개발패턴 3가지.
Controller (화면만 호출 시)
Controller ==> Service ==> Dao (DB처리)
		   <==         <==
Controller ==> Service (DB처리가 필요없고 입력을 통해서 반복이나 조건 처리)
		   <==
Controller ==> Dao (X)
		   <== 
 * */	
	
	private XXXService service = new XXXService();
	
	public String schList(String pname, int price, 
			Model d) {
		// 화면단에 대한 호출
		return "경로/@@@.jsp";
	}
	// 
	public String schList2(ProductSch p, 
			Model d) {
		System.out.println("# 컨트롤에서 받은 데이터 #");
		System.out.println(p.getName());
		/*
		Controller ==> Service ==> Dao (DB처리)
				   <==         <==		
		*/
		// view단에 넘겨줄 데이터 key, object
		d.addAttribute("plist", service.schList(p));
		// 화면단에 대한 호출
		return "경로/@@@.jsp";
	}	

}
