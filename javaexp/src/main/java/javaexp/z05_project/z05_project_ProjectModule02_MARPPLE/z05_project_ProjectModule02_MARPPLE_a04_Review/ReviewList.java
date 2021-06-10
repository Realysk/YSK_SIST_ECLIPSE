package javaexp.z05_project.z05_project_ProjectModule02_MARPPLE.z05_project_ProjectModule02_MARPPLE_a04_Review;

public class ReviewList {
   // 리뷰 리스트, 리뷰 표시
   // 사진, 아이디, 평점(별점), 내용, 물품링크
   private String reviewPicture;
   private String id;
   private String reviewGrade; //명칭 바꿔야 될거같은데
   private String reviewDate;
   private String content;
   private String goodsLink;
   // 리뷰 사진 클릭 예시 구현
   public ReviewList(String reviewPicture) {
      this.reviewPicture = reviewPicture;
   }
   // 전체 회신 구현
   public ReviewList(String reviewPicture, String id, String reviewGrade, 
         String reviewDate, String content, String goodsLink) {
      this.reviewPicture = reviewPicture;
      this.id = id;
      this.reviewGrade = reviewGrade;
      this.reviewDate = reviewDate;
      this.content = content;
      this.goodsLink = goodsLink;
   }
   
   
   //get, set 매소드
   public String getReviewPicture() {
      return reviewPicture;
   }
   public void setReviewPicture(String reviewPicture) {
      this.reviewPicture = reviewPicture;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getReviewGrade() {
      return reviewGrade;
   }
   public void setReviewGrade(String reviewGrade) {
      this.reviewGrade = reviewGrade;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getGoodsLink() {
      return goodsLink;
   }
   public void setGoodsLink(String goodsLink) {
      this.goodsLink = goodsLink;
   }
   public String getReviewDate() {
      return reviewDate;
   }
   public void setReviewDate(String reviewDate) {
      this.reviewDate = reviewDate;
   }
   
   
   
}