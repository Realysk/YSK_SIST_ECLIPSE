package wannafit.content.vo;

public class Com_Info_VO {
  String wm_id;//-아이디 
  String bs_email;//기업이메일 (세금계싼서발행) 
  String bs_sns ;//기업 sns주소 
  String bs_number ;//기업전화번호 
  String bs_address;//기업주소 
  String bs_ceo;//대표자명
  String bs_accname;//예금주명
  String bs_accnum;//계좌번호
  String bs_accnum_name;//은행명 
  String bs_busname;// 상호명 
  String bs_intro;//소개글 
  String bs_pic_url;// varchar2(100) --소개사진 

  public Com_Info_VO() {
    super();
    // TODO Auto-generated constructor stub
  }
  public Com_Info_VO(String wm_id, String bs_email, String bs_sns, String bs_number, String bs_address,
      String bs_ceo, String bs_accname, String bs_accnum, String bs_accnum_name, String bs_busname,
      String bs_intro, String bs_pic_url) {
    super();
    this.wm_id = wm_id;
    this.bs_email = bs_email;
    this.bs_sns = bs_sns;
    this.bs_number = bs_number;
    this.bs_address = bs_address;
    this.bs_ceo = bs_ceo;
    this.bs_accname = bs_accname;
    this.bs_accnum = bs_accnum;
    this.bs_accnum_name = bs_accnum_name;
    this.bs_busname = bs_busname;
    this.bs_intro = bs_intro;
    this.bs_pic_url = bs_pic_url;
  }
  public Com_Info_VO(String bs_email, String bs_sns, String bs_number, String bs_address,
      String bs_ceo, String bs_accname, String bs_accnum, String bs_accnum_name, String bs_busname,
      String bs_intro, String bs_pic_url) {
    super();
    this.bs_email = bs_email;
    this.bs_sns = bs_sns;
    this.bs_number = bs_number;
    this.bs_address = bs_address;
    this.bs_ceo = bs_ceo;
    this.bs_accname = bs_accname;
    this.bs_accnum = bs_accnum;
    this.bs_accnum_name = bs_accnum_name;
    this.bs_busname = bs_busname;
    this.bs_intro = bs_intro;
    this.bs_pic_url = bs_pic_url;
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
   * @return the bs_email
   */
  public String getBs_email() {
    return bs_email;
  }
  /**
   * @param bs_email the bs_email to set
   */
  public void setBs_email(String bs_email) {
    this.bs_email = bs_email;
  }
  /**
   * @return the bs_sns
   */
  public String getBs_sns() {
    return bs_sns;
  }
  /**
   * @param bs_sns the bs_sns to set
   */
  public void setBs_sns(String bs_sns) {
    this.bs_sns = bs_sns;
  }
  /**
   * @return the bs_number
   */
  public String getBs_number() {
    return bs_number;
  }
  /**
   * @param bs_number the bs_number to set
   */
  public void setBs_number(String bs_number) {
    this.bs_number = bs_number;
  }
  /**
   * @return the bs_address
   */
  public String getBs_address() {
    return bs_address;
  }
  /**
   * @param bs_address the bs_address to set
   */
  public void setBs_address(String bs_address) {
    this.bs_address = bs_address;
  }
  /**
   * @return the bs_ceo
   */
  public String getBs_ceo() {
    return bs_ceo;
  }
  /**
   * @param bs_ceo the bs_ceo to set
   */
  public void setBs_ceo(String bs_ceo) {
    this.bs_ceo = bs_ceo;
  }
  /**
   * @return the bs_accname
   */
  public String getBs_accname() {
    return bs_accname;
  }
  /**
   * @param bs_accname the bs_accname to set
   */
  public void setBs_accname(String bs_accname) {
    this.bs_accname = bs_accname;
  }
  /**
   * @return the bs_accnum
   */
  public String getBs_accnum() {
    return bs_accnum;
  }
  /**
   * @param bs_accnum the bs_accnum to set
   */
  public void setBs_accnum(String bs_accnum) {
    this.bs_accnum = bs_accnum;
  }
  /**
   * @return the bs_accnum_name
   */
  public String getBs_accnum_name() {
    return bs_accnum_name;
  }
  /**
   * @param bs_accnum_name the bs_accnum_name to set
   */
  public void setBs_accnum_name(String bs_accnum_name) {
    this.bs_accnum_name = bs_accnum_name;
  }
  /**
   * @return the bs_busname
   */
  public String getBs_busname() {
    return bs_busname;
  }
  /**
   * @param bs_busname the bs_busname to set
   */
  public void setBs_busname(String bs_busname) {
    this.bs_busname = bs_busname;
  }
  /**
   * @return the bs_intro
   */
  public String getBs_intro() {
    return bs_intro;
  }
  /**
   * @param bs_intro the bs_intro to set
   */
  public void setBs_intro(String bs_intro) {
    this.bs_intro = bs_intro;
  }
  /**
   * @return the bs_pic_url
   */
  public String getBs_pic_url() {
    return bs_pic_url;
  }
  /**
   * @param bs_pic_url the bs_pic_url to set
   */
  public void setBs_pic_url(String bs_pic_url) {
    this.bs_pic_url = bs_pic_url;
  }
}
