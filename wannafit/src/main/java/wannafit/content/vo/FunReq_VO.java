package wannafit.content.vo;

import java.util.Date;

public class FunReq_VO {
  String fs_num;//펀딩후원번호 
  String id; //상품번호 
  String wm_id;  //사용자아디
  String wp_class;//결제분류(후원/예약)
  String wp_type ;//결제방법 (카드.계좌)
  int wp_price ;//결제금액
  String wp_address ;//주소
  String wp_cardnum ;//카드번호
  String wp_bank;//은행명
  String wp_accname;//예금주명 
  String wp_limitdate;//유효기간
  String wp_birth;//생년월일
  int wp_install;//할부기간 
  
  public FunReq_VO() {
    super();
    // TODO Auto-generated constructor stub
  }
  



  public FunReq_VO(String id, String wm_id, String wp_class, String wp_address, String wp_cardnum,
      String wp_bank, String wp_accname, String wp_limitdate, String wp_birth, int wp_install) {
    super();
    this.id = id;
    this.wm_id = wm_id;
    this.wp_class = wp_class;
    this.wp_address = wp_address;
    this.wp_cardnum = wp_cardnum;
    this.wp_bank = wp_bank;
    this.wp_accname = wp_accname;
    this.wp_limitdate = wp_limitdate;
    this.wp_birth = wp_birth;
    this.wp_install = wp_install;
  }




  public FunReq_VO(String fs_num, String id, String wm_id, String wp_class, String wp_type,
      int wp_price, String wp_address, String wp_cardnum, String wp_bank, String wp_accname,
      String wp_limitdate, String wp_birth, int wp_install) {
    super();
    this.fs_num = fs_num;
    this.id = id;
    this.wm_id = wm_id;
    this.wp_class = wp_class;
    this.wp_type = wp_type;
    this.wp_price = wp_price;
    this.wp_address = wp_address;
    this.wp_cardnum = wp_cardnum;
    this.wp_bank = wp_bank;
    this.wp_accname = wp_accname;
    this.wp_limitdate = wp_limitdate;
    this.wp_birth = wp_birth;
    this.wp_install = wp_install;
  }
 
  /**
   * @return the fs_num
   */
  public String getFs_num() {
    return fs_num;
  }
  /**
   * @param fs_num the fs_num to set
   */
  public void setFs_num(String fs_num) {
    this.fs_num = fs_num;
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
   * @return the wp_class
   */
  public String getWp_class() {
    return wp_class;
  }
  /**
   * @param wp_class the wp_class to set
   */
  public void setWp_class(String wp_class) {
    this.wp_class = wp_class;
  }
  /**
   * @return the wp_type
   */
  public String getWp_type() {
    return wp_type;
  }
  /**
   * @param wp_type the wp_type to set
   */
  public void setWp_type(String wp_type) {
    this.wp_type = wp_type;
  }
  /**
   * @return the wp_price
   */
  public int getWp_price() {
    return wp_price;
  }
  /**
   * @param wp_price the wp_price to set
   */
  public void setWp_price(int wp_price) {
    this.wp_price = wp_price;
  }
  /**
   * @return the wp_address
   */
  public String getWp_address() {
    return wp_address;
  }
  /**
   * @param wp_address the wp_address to set
   */
  public void setWp_address(String wp_address) {
    this.wp_address = wp_address;
  }
  /**
   * @return the wp_cardnum
   */
  public String getWp_cardnum() {
    return wp_cardnum;
  }
  /**
   * @param wp_cardnum the wp_cardnum to set
   */
  public void setWp_cardnum(String wp_cardnum) {
    this.wp_cardnum = wp_cardnum;
  }
  /**
   * @return the wp_bank
   */
  public String getWp_bank() {
    return wp_bank;
  }
  /**
   * @param wp_bank the wp_bank to set
   */
  public void setWp_bank(String wp_bank) {
    this.wp_bank = wp_bank;
  }
  /**
   * @return the wp_accname
   */
  public String getWp_accname() {
    return wp_accname;
  }
  /**
   * @param wp_accname the wp_accname to set
   */
  public void setWp_accname(String wp_accname) {
    this.wp_accname = wp_accname;
  }
  /**
   * @return the wp_limitdate
   */
  public String getWp_limitdate() {
    return wp_limitdate;
  }
  /**
   * @param wp_limitdate the wp_limitdate to set
   */
  public void setWp_limitdate(String wp_limitdate) {
    this.wp_limitdate = wp_limitdate;
  }
  /**
   * @return the wp_birth
   */
  public String getWp_birth() {
    return wp_birth;
  }
  /**
   * @param wp_birth the wp_birth to set
   */
  public void setWp_birth(String wp_birth) {
    this.wp_birth = wp_birth;
  }
  /**
   * @return the wp_install
   */
  public int getWp_install() {
    return wp_install;
  }
  /**
   * @param wp_install the wp_install to set
   */
  public void setWp_install(int wp_install) {
    this.wp_install = wp_install;
  }
  public FunReq_VO(String id, String wm_id, int wp_price, String wp_address, String wp_cardnum,
      String wp_bank, String wp_accname, String wp_limitdate, String wp_birth, int wp_install) {
    super();
    this.id = id;
    this.wm_id = wm_id;
    this.wp_price = wp_price;
    this.wp_address = wp_address;
    this.wp_cardnum = wp_cardnum;
    this.wp_bank = wp_bank;
    this.wp_accname = wp_accname;
    this.wp_limitdate = wp_limitdate;
    this.wp_birth = wp_birth;
    this.wp_install = wp_install;
  }
  
}