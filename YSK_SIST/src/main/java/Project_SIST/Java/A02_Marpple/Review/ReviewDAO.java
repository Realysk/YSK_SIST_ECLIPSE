package Project_SIST.Java.A02_Marpple.Review;

import java.util.ArrayList;

public class ReviewDAO {
      public ArrayList<ReviewList> reviewClick(ReviewList r) {
         // System.out.println("# DB(리뷰리스트)");
         System.out.println("리뷰사진 : "+r.getReviewPicture());
         System.out.println("아이디 : "+r.getId());
         System.out.println("평점 : "+r.getReviewGrade());
         System.out.println("날짜 : "+r.getReviewDate());
         System.out.println("리뷰내용 : "+r.getContent());
         System.out.println("상품링크 : "+r.getGoodsLink());
         ArrayList<ReviewList> arl1 = new ArrayList<ReviewList>();
         
         //arl1.add(new Product("사과",2000, 2)); 형식으로 추가
         return arl1;
         
      }
}