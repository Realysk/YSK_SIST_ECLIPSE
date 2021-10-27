package wannafit.content.vo;

public class BuUser_VO {
     String wm_id; //회원아이디
     String wm_pass; //비밀번호
     String wm_email; //이메일 
     String wm_nick ; //닉네임
      String wm_tel; //휴대폰번호
      String wm_usrGroup; //회원구분 (0, 100, 200, 300, 400)
      int wm_repCnt; //신고횟수
      String wm_imgSrc;//프로필이미지
      String wb_num;//사업자번호
      public BuUser_VO() {
        super();
        // TODO Auto-generated constructor stub
      }
      public BuUser_VO(String wm_id, String wm_pass, String wm_email, String wm_nick, String wm_tel,
          String wm_usrGroup, int wm_repCnt, String wm_imgSrc, String wb_num) {
        super();
        this.wm_id = wm_id;
        this.wm_pass = wm_pass;
        this.wm_email = wm_email;
        this.wm_nick = wm_nick;
        this.wm_tel = wm_tel;
        this.wm_usrGroup = wm_usrGroup;
        this.wm_repCnt = wm_repCnt;
        this.wm_imgSrc = wm_imgSrc;
        this.wb_num = wb_num;
      }
      public BuUser_VO(String wm_id, String wm_pass, String wm_email, String wm_nick, String wm_tel,
          String wm_usrGroup, int wm_repCnt, String wm_imgSrc) {
        super();
        this.wm_id = wm_id;
        this.wm_pass = wm_pass;
        this.wm_email = wm_email;
        this.wm_nick = wm_nick;
        this.wm_tel = wm_tel;
        this.wm_usrGroup = wm_usrGroup;
        this.wm_repCnt = wm_repCnt;
        this.wm_imgSrc = wm_imgSrc;
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
       * @return the wm_pass
       */
      public String getWm_pass() {
        return wm_pass;
      }
      /**
       * @param wm_pass the wm_pass to set
       */
      public void setWm_pass(String wm_pass) {
        this.wm_pass = wm_pass;
      }
      /**
       * @return the wm_email
       */
      public String getWm_email() {
        return wm_email;
      }
      /**
       * @param wm_email the wm_email to set
       */
      public void setWm_email(String wm_email) {
        this.wm_email = wm_email;
      }
      /**
       * @return the wm_nick
       */
      public String getWm_nick() {
        return wm_nick;
      }
      /**
       * @param wm_nick the wm_nick to set
       */
      public void setWm_nick(String wm_nick) {
        this.wm_nick = wm_nick;
      }
      /**
       * @return the wm_tel
       */
      public String getWm_tel() {
        return wm_tel;
      }
      /**
       * @param wm_tel the wm_tel to set
       */
      public void setWm_tel(String wm_tel) {
        this.wm_tel = wm_tel;
      }
      /**
       * @return the wm_usrGroup
       */
      public String getWm_usrGroup() {
        return wm_usrGroup;
      }
      /**
       * @param wm_usrGroup the wm_usrGroup to set
       */
      public void setWm_usrGroup(String wm_usrGroup) {
        this.wm_usrGroup = wm_usrGroup;
      }
      /**
       * @return the wm_repCnt
       */
      public int getWm_repCnt() {
        return wm_repCnt;
      }
      /**
       * @param wm_repCnt the wm_repCnt to set
       */
      public void setWm_repCnt(int wm_repCnt) {
        this.wm_repCnt = wm_repCnt;
      }
      /**
       * @return the wm_imgSrc
       */
      public String getWm_imgSrc() {
        return wm_imgSrc;
      }
      /**
       * @param wm_imgSrc the wm_imgSrc to set
       */
      public void setWm_imgSrc(String wm_imgSrc) {
        this.wm_imgSrc = wm_imgSrc;
      }
      /**
       * @return the wb_num
       */
      public String getWb_num() {
        return wb_num;
      }
      /**
       * @param wb_num the wb_num to set
       */
      public void setWb_num(String wb_num) {
        this.wb_num = wb_num;
      }
 
}
