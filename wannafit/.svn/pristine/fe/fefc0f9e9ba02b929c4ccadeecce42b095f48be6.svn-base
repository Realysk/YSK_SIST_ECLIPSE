package wannafit.content.vo;

public class Trainer {

	// 회원 + 트레이너 + 운동분야구분 join
	String wm_id;
	String wm_pass;
	String wm_email;
	String wm_nick;
	String wm_tel;
	String wm_usrGroup; // 0:관리자 100:일반회원 200:트레이너 300:헬스장 400:기업
	int wm_repCnt;		// 신고횟수
	String wm_imgSrc;	// 프로필 이미지
	String wb_num;		// 사업자번호
	
	// 트레이너 
	String wt_gender;	// M:남자 W:여자
	int wt_age;			// 10:10대 20:20대 30:30대 40:40대 50:50대
	int wt_sports;		// 1:헬스 2:런데이 3:홈트
	String wt_info; 	// 트레이너 소개
	
	// 운동분야구분 
	int wsk_num;		// 운동분야번호
	String wsk_name;	// 운동분야명
	
	public Trainer() {
		super();
	}

	// 검색 (닉네임, 운동분야명)
	public Trainer(String wm_nick, String wsk_name) {
		super();
		this.wm_nick = wm_nick;
		this.wsk_name = wsk_name;
	}

	// 예약 조회를 위한 트레이너 목록 내용
	public Trainer(String wm_id, String wm_nick, String wm_imgSrc, String wsk_name, String wt_info) {
		super();
		this.wm_id = wm_id;
		this.wm_nick = wm_nick;
		this.wm_imgSrc = wm_imgSrc;
		this.wsk_name = wsk_name;
		this.wt_info = wt_info;
	}

	// 예약 상세정보 출력을 위한 선언
	public Trainer(String wm_id, String wm_nick, String wm_tel, String wm_imgSrc, String wt_gender, int wt_age,
			String wt_info, String wsk_name) {
		super();
		this.wm_id = wm_id;
		this.wm_nick = wm_nick;
		this.wm_tel = wm_tel;
		this.wm_imgSrc = wm_imgSrc;
		this.wt_gender = wt_gender;
		this.wt_age = wt_age;
		this.wt_info = wt_info;
		this.wsk_name = wsk_name;
	}
	
	// 트레이너 가입시 사용
	public Trainer(String wm_id, String wm_pass, String wm_email, String wm_nick, String wm_tel, String wm_imgSrc,
			String wt_gender, int wt_age, int wt_sports, String wt_info) {
		super();
		this.wm_id = wm_id;
		this.wm_pass = wm_pass;
		this.wm_email = wm_email;
		this.wm_nick = wm_nick;
		this.wm_tel = wm_tel;
		this.wm_imgSrc = wm_imgSrc;
		this.wt_gender = wt_gender;
		this.wt_age = wt_age;
		this.wt_sports = wt_sports;
		this.wt_info = wt_info;
	}

	public String getWm_id() {
		return wm_id;
	}

	public void setWm_id(String wm_id) {
		this.wm_id = wm_id;
	}

	public String getWm_pass() {
		return wm_pass;
	}

	public void setWm_pass(String wm_pass) {
		this.wm_pass = wm_pass;
	}

	public String getWm_email() {
		return wm_email;
	}

	public void setWm_email(String wm_email) {
		this.wm_email = wm_email;
	}

	public String getWm_nick() {
		return wm_nick;
	}

	public void setWm_nick(String wm_nick) {
		this.wm_nick = wm_nick;
	}

	public String getWm_tel() {
		return wm_tel;
	}

	public void setWm_tel(String wm_tel) {
		this.wm_tel = wm_tel;
	}

	public String getWm_usrGroup() {
		return wm_usrGroup;
	}

	public void setWm_usrGroup(String wm_usrGroup) {
		this.wm_usrGroup = wm_usrGroup;
	}

	public int getWm_repCnt() {
		return wm_repCnt;
	}

	public void setWm_repCnt(int wm_repCnt) {
		this.wm_repCnt = wm_repCnt;
	}

	public String getWm_imgSrc() {
		return wm_imgSrc;
	}

	public void setWm_imgSrc(String wm_imgSrc) {
		this.wm_imgSrc = wm_imgSrc;
	}

	public String getWb_num() {
		return wb_num;
	}

	public void setWb_num(String wb_num) {
		this.wb_num = wb_num;
	}

	public String getWt_gender() {
		return wt_gender;
	}

	public void setWt_gender(String wt_gender) {
		this.wt_gender = wt_gender;
	}

	public int getWt_age() {
		return wt_age;
	}

	public void setWt_age(int wt_age) {
		this.wt_age = wt_age;
	}

	public int getWt_sports() {
		return wt_sports;
	}

	public void setWt_sports(int wt_sports) {
		this.wt_sports = wt_sports;
	}

	public String getWt_info() {
		return wt_info;
	}

	public void setWt_info(String wt_info) {
		this.wt_info = wt_info;
	}

	public int getWsk_num() {
		return wsk_num;
	}

	public void setWsk_num(int wsk_num) {
		this.wsk_num = wsk_num;
	}

	public String getWsk_name() {
		return wsk_name;
	}

	public void setWsk_name(String wsk_name) {
		this.wsk_name = wsk_name;
	}
}
