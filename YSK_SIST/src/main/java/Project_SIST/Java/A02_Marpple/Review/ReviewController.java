package Project_SIST.Java.A02_Marpple.Review;

import Project_SIST.Java.A02_Marpple.Model;
import Project_SIST.Java.A02_Marpple.Review.ReviewList;

public class ReviewController {

      private ReviewService rSer = new ReviewService();
      // 리뷰리스트에서 리뷰 리스트를 가져와 매개변수로 한다,
      // 모델에서 리뷰리스튼를 가져와 매개변수로 한다.
      public String reviewCon(ReviewList r, Model model) {
         model.addAttribute("리뷰리스트", rSer.reviewClick(r)); // DAO에서 처리된 검색 결과값을 addAttribute로 데이터 처리 
         // System.out.printf("리스트검색값 : ", rDao.reviewClick(r)); // 검색 결과값을 호출한다.
         return "호출할 화면 jps경로"; //호출될 화면을 리턴한다.
      }
      
}