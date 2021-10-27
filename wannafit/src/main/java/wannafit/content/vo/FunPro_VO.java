package wannafit.content.vo;

import java.util.Date;

public class FunPro_VO {
  
  
  String wm_id;// varchar2(50), -- 1. 사용자 번호(기업아이디)
  String id;// varchar2(50) PRIMARY KEY, --1. 펀딩상품번호 
  String fp_category;// varchar2(50) check (fp_category in ('도서', '운동기구', '약품', '식품', '패션')), -- 3. 카테고리 
  String fp_tagprice;// number,-- 4. 목표금액 
  Date fp_startdate;// Date, -- 5. 시작일 
  Date fp_enddate;// DATE, -- 6. 마감일 
  String fp_title;// varchar2(200), --7. 제목 
  String fp_intro;// varchar2(1000), --8. 내용 
  int fp_people;// NUMBER, --9. 참여자수 
  String fp_state;// varchar2(50) check (fp_state in ('신청', '대기', '반려' ,'만료', '승인', '판매중')), --10.처리상태 
  int fp_accprice;// NUMBER, --11. 누적금액 
  String fp_picurl;// varchar2(100), --12. 사진경로 
  String fp_content;// varchar2(1000) --13. 내용 
  public FunPro_VO() {
    super();
    // TODO Auto-generated constructor stub
  }
  public FunPro_VO( String wm_id,String id, String fp_category, String fp_tagprice,
      Date fp_startdate, Date fp_enddate, String fp_title, String fp_intro, int fp_people,
      String fp_state, int fp_accprice, String fp_picurl, String fp_content) {
    super();
   
    this.wm_id = wm_id;
    this.id = id;
    this.fp_category = fp_category;
    this.fp_tagprice = fp_tagprice;
    this.fp_startdate = fp_startdate;
    this.fp_enddate = fp_enddate;
    this.fp_title = fp_title;
    this.fp_intro = fp_intro;
    this.fp_people = fp_people;
    this.fp_state = fp_state;
    this.fp_accprice = fp_accprice;
    this.fp_picurl = fp_picurl;
    this.fp_content = fp_content;
  }
  public FunPro_VO(String fp_category, String fp_state) {
    super();
    this.fp_category = fp_category;
    this.fp_state = fp_state;
  }
  /**
   * @return the id
   */
  public String getId() {
    return id;
  }
  /**
   * @param id the id to set
   */
  public void setId(String id) {
    this.id = id;
  }
  /**
   * @return the wm_id
   */
  public String getWm_id() {
    return wm_id;
  }
  /**
   * @param wm_id the wm_id to set
   */
  public void setWm_id(String wm_id) {
    this.wm_id = wm_id;
  }
  /**
   * @return the fp_category
   */
  public String getFp_category() {
    return fp_category;
  }
  /**
   * @param fp_category the fp_category to set
   */
  public void setFp_category(String fp_category) {
    this.fp_category = fp_category;
  }
  /**
   * @return the fp_tagprice
   */
  public String getFp_tagprice() {
    return fp_tagprice;
  }
  /**
   * @param fp_tagprice the fp_tagprice to set
   */
  public void setFp_tagprice(String fp_tagprice) {
    this.fp_tagprice = fp_tagprice;
  }
  /**
   * @return the fp_startdate
   */
  public Date getFp_startdate() {
    return fp_startdate;
  }
  /**
   * @param fp_startdate the fp_startdate to set
   */
  public void setFp_startdate(Date fp_startdate) {
    this.fp_startdate = fp_startdate;
  }
  /**
   * @return the fp_enddate
   */
  public Date getFp_enddate() {
    return fp_enddate;
  }
  /**
   * @param fp_enddate the fp_enddate to set
   */
  public void setFp_enddate(Date fp_enddate) {
    this.fp_enddate = fp_enddate;
  }
  /**
   * @return the fp_title
   */
  public String getFp_title() {
    return fp_title;
  }
  /**
   * @param fp_title the fp_title to set
   */
  public void setFp_title(String fp_title) {
    this.fp_title = fp_title;
  }
  /**
   * @return the fp_intro
   */
  public String getFp_intro() {
    return fp_intro;
  }
  /**
   * @param fp_intro the fp_intro to set
   */
  public void setFp_intro(String fp_intro) {
    this.fp_intro = fp_intro;
  }
  /**
   * @return the fp_people
   */
  public int getFp_people() {
    return fp_people;
  }
  /**
   * @param fp_people the fp_people to set
   */
  public void setFp_people(int fp_people) {
    this.fp_people = fp_people;
  }
  /**
   * @return the fp_state
   */
  public String getFp_state() {
    return fp_state;
  }
  /**
   * @param fp_state the fp_state to set
   */
  public void setFp_state(String fp_state) {
    this.fp_state = fp_state;
  }
  /**
   * @return the fp_accprice
   */
  public int getFp_accprice() {
    return fp_accprice;
  }
  /**
   * @param fp_accprice the fp_accprice to set
   */
  public void setFp_accprice(int fp_accprice) {
    this.fp_accprice = fp_accprice;
  }
  /**
   * @return the fp_picurl
   */
  public String getFp_picurl() {
    return fp_picurl;
  }
  /**
   * @param fp_picurl the fp_picurl to set
   */
  public void setFp_picurl(String fp_picurl) {
    this.fp_picurl = fp_picurl;
  }
  /**
   * @return the fp_content
   */
  public String getFp_content() {
    return fp_content;
  }
  /**
   * @param fp_content the fp_content to set
   */
  public void setFp_content(String fp_content) {
    this.fp_content = fp_content;
  }
}

