package Project_SIST.Java.A02_Marpple.Review;

import java.util.ArrayList;

public class ReviewService {
   ReviewDAO rDao = new ReviewDAO();
   public ArrayList<ReviewList> reviewClick(ReviewList r){
   
//         sys 서비스단 처리
//        sys DAO에 전송 데이터 1: p.getName();
//        sys DAO에서 받은 데이터크기 2 : p.schlist(p)size();
      return rDao.reviewClick(r);
   }
}