package Project_SIST.Java.A02_Marpple.Review;

import Project_SIST.Java.A02_Marpple.Model;

public class ReviewMain {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 화면에서 처리하는 부분을 main()을 통해서 test한다.
		 	 게시판 검색
 			물건명 [  ] 가격 [ 1000 ] ~ [ 2000 ] [검색]
 			물건명 가격 갯수 기타
 			@@@	@@@ @@@ @@
 			@@@	@@@ @@@ @@
 			@@@	@@@ @@@ @@
		 */
		
		// Scanner이나 직접 입력 처리
		// 입력 값으로 처리된 객체 생성
		ReviewList sch = new ReviewList("폰 케이스", "gong", "★★★★", "2021-06-04", "정말 만족합니다!", "www.case.com");
		// Controller만 호출
		ReviewController ctrl = new ReviewController();
		System.out.println("# 호출된 화면 #");
		System.out.println(ctrl.reviewCon(sch, new Model()));

	}

}
