package onbiz.vo;

public class OnRisk_File {
  String riskfile_no;//varchar2(10), --리스크파일번호
  String riskfile_name;// varchar2(50), --리스크파일명
  String riskfile_regDte;// DATE, --파일등록일 
  String risk_no ;//varchar2(10) --번호 
  public OnRisk_File() {
    super();
    // TODO Auto-generated constructor stub
  }
  
  //이게무슨역할? 근데중요함!
  public OnRisk_File(String riskfile_name) {
    super();
    this.riskfile_name= riskfile_name;
  }
  
  
  public OnRisk_File(String riskfile_no, String riskfile_name, String riskfile_regDte,
      String risk_no) {
    super();
    this.riskfile_no = riskfile_no;
    this.riskfile_name = riskfile_name;
    this.riskfile_regDte = riskfile_regDte;
    this.risk_no = risk_no;
  }
  /**
   * @return the riskfile_no
   */
  public String getRiskfile_no() {
    return riskfile_no;
  }
  /**
   * @param riskfile_no the riskfile_no to set
   */
  public void setRiskfile_no(String riskfile_no) {
    this.riskfile_no = riskfile_no;
  }
  /**
   * @return the riskfile_name
   */
  public String getRiskfile_name() {
    return riskfile_name;
  }
  /**
   * @param riskfile_name the riskfile_name to set
   */
  public void setRiskfile_name(String riskfile_name) {
    this.riskfile_name = riskfile_name;
  }
  /**
   * @return the riskfile_regDte
   */
  public String getRiskfile_regDte() {
    return riskfile_regDte;
  }
  /**
   * @param riskfile_regDte the riskfile_regDte to set
   */
  public void setRiskfile_regDte(String riskfile_regDte) {
    this.riskfile_regDte = riskfile_regDte;
  }
  /**
   * @return the risk_no
   */
  public String getRisk_no() {
    return risk_no;
  }
  /**
   * @param risk_no the risk_no to set
   */
  public void setRisk_no(String risk_no) {
    this.risk_no = risk_no;
  }
}
