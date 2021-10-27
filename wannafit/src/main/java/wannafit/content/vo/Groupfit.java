package wannafit.content.vo;

import java.util.*;

public class Groupfit {
	
	private String gf_grpkey; // 그룹핏 번호
	private String wm_id; // 회원 ID (외래키)
	private String gf_category; // 그룹핏 유형
	private String gf_name; // 그룹핏 이름
	private String gf_info; // 그룹핏 정보
	private Date gf_date; // 그룹핏 생성일
	private String gf_dateS; // 그룹핏 생성일
	private int gf_repCnt; // 신고 횟수
	
	public Groupfit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 그룹핏 조회
	public Groupfit(String gf_grpkey, String wm_id, String gf_category, String gf_name, String gf_info,
			String gf_dateS) {
		super();
		this.gf_grpkey = gf_grpkey;
		this.wm_id = wm_id;
		this.gf_category = gf_category;
		this.gf_name = gf_name;
		this.gf_info = gf_info;
		this.gf_dateS = gf_dateS;
	}

	// 그룹핏 조회
	public Groupfit(String gf_grpkey, String wm_id, String gf_category, String gf_name, String gf_info, Date gf_date) {
		super();
		this.gf_grpkey = gf_grpkey;
		this.wm_id = wm_id;
		this.gf_category = gf_category;
		this.gf_name = gf_name;
		this.gf_info = gf_info;
		this.gf_date = gf_date;
	}

	// MVC 등록
	public Groupfit(String gf_name, String gf_category, String gf_info) {
		super();
		this.gf_name = gf_name;
		this.gf_category = gf_category;
		this.gf_info = gf_info;
	}
	
	// 등록
	public Groupfit(String wm_id, String gf_name, String gf_category, String gf_info) {
		super();
		this.wm_id = wm_id;
		this.gf_name = gf_name;
		this.gf_category = gf_category;
		this.gf_info = gf_info;
	}
	
	// 수정
	public Groupfit(String gf_name, String gf_category, String gf_info, String wm_id, Date gf_date) {
		super();
		this.gf_name = gf_name;
		this.gf_category = gf_category;
		this.gf_info = gf_info;
		this.wm_id = wm_id;
		this.gf_date = gf_date;
	}
	
	// 삭제
	public Groupfit(String wm_id) {
		super();
		this.wm_id = wm_id;
	}

	// 검색
	public Groupfit(String gf_name, String wm_id) {
		super();
		this.gf_name = gf_name;
		this.wm_id = wm_id;
	}
	
	// 검색 후 조회
	public Groupfit(String gf_name, String gf_category, String wm_id, Date gf_date) {
		super();
		this.gf_name = gf_name;
		this.gf_category = gf_category;
		this.wm_id = wm_id;
		this.gf_date = gf_date;
	}

	public String getGf_grpkey() {
		return gf_grpkey;
	}

	public void setGf_grpkey(String gf_grpkey) {
		this.gf_grpkey = gf_grpkey;
	}

	public String getWm_id() {
		return wm_id;
	}

	public void setWm_id(String wm_id) {
		this.wm_id = wm_id;
	}

	public String getGf_category() {
		return gf_category;
	}

	public void setGf_category(String gf_category) {
		this.gf_category = gf_category;
	}

	public String getGf_name() {
		return gf_name;
	}

	public void setGf_name(String gf_name) {
		this.gf_name = gf_name;
	}

	public String getGf_info() {
		return gf_info;
	}

	public void setGf_info(String gf_info) {
		this.gf_info = gf_info;
	}

	public Date getGf_date() {
		return gf_date;
	}

	public void setGf_date(Date gf_date) {
		this.gf_date = gf_date;
	}

	public String getGf_dateS() {
		return gf_dateS;
	}

	public void setGf_dateS(String gf_dateS) {
		this.gf_dateS = gf_dateS;
	}

	public int getGf_repCnt() {
		return gf_repCnt;
	}

	public void setGf_repCnt(int gf_repCnt) {
		this.gf_repCnt = gf_repCnt;
	}

}
