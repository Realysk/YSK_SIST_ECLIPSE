package wannafit.content.mypage;

import com.google.gson.Gson;

import wannafit.content.user.UserDAO;
import wannafit.content.vo.User;

public class memCRUDServ {
	
	private UserDAO mdao;
	private Gson gson;
	
	public memCRUDServ() {
		// TODO Auto-generated constructor stub
		mdao = new UserDAO();
		gson = new Gson();
	}
	
	public String memberList() {
		return gson.toJson(mdao.getMemberList());
	}
	
	public String getMember(String wm_id) {
		return gson.toJson(mdao.getMember(wm_id));
	}
	
	// 회원정보 조회 (단일)
	public String getMemberJson(String wm_id) {
		
		String memJson = "{}";
		
		User mem = mdao.getMember(wm_id);
		
		if(mem != null) {
			memJson = gson.toJson(mem);
		}
		
		return memJson;
	}
	
	// 수정
	public String uptmemJson(User upt) {
		String ret = "회원정보 수정이 완료되었습니다.";
		try {
			mdao.uptMember(upt);
		} catch(Exception e) {
			ret="수정시 문제발생("+e.getMessage()+")";
		}
		return "{\"result\":\""+ret+"\",\"list\":"+memberList()+"}";
	}
	
	// 삭제
	public String delmemJson(User del) {
		String ret = "탈퇴가 완료되었습니다. \n그동안 Wanna-Fit을 이용해주셔서 감사합니다!";
		try {
			mdao.delMember(del.getWm_id());
		} catch(Exception e) {
			ret="삭제시 문제발생("+e.getMessage()+")";
		}
		return "{\"result\":\""+ret+"\",\"list\":"+memberList()+"}";
	}

}
