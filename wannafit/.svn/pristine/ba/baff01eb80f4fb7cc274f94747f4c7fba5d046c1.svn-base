package wannafit.content.groupfit;

import com.google.gson.Gson;

import wannafit.content.user.UserDAO;
import wannafit.content.vo.Groupfit;
import wannafit.content.vo.User;

public class grpServ {

	private grpDAO gdao;
	private UserDAO mdao;
	private Gson gson;

	public grpServ() {
		// TODO Auto-generated constructor stub

		gdao = new grpDAO();
		mdao = new UserDAO();
		gson = new Gson();
	}
	
	// 그룹핏 조회
	public String grpList() {
		return gson.toJson( gdao.grpList() );
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

	// 그룹핏 조회 단일 (Json)
	public String JsongrpList(String wm_id, String gf_name) {
		// DAO를 통해 나온 grpDAO객체를 gson으로 처리

		String grpJson = "{}";

		Groupfit grp = gdao.schGrpfit(wm_id, gf_name);

		if (gdao.schGrpfit(wm_id, gf_name)!=null) {
			grpJson = gson.toJson(grp);
		}

		return grpJson;
	}
	
	// 그룹핏 조회 Arry (Json)
	public String JsonarrygrpList(Groupfit sch) {
		return gson.toJson(gdao.schArryGrpfit(sch));
	}
	
//	public void search(Groupfit sch) {
//		gdao.schArryGrpfit(sch);
//	}
	
	// 등록
	public String insgrpJson(Groupfit ins) {
		String ret = "그룹핏 등록이 완료되었습니다.";
		try {
			gdao.insGrpfit(ins);
		}catch(Exception e) {
			ret="등록시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+grpList()+"}";
	}
	
	// 수정
	public String uptgrpJson(Groupfit upt) {
		String ret="그룹핏 수정이 완료되었습니다.";
		try {
			gdao.uptGrpfit(upt);
		}catch(Exception e) {
			ret="수정시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+grpList()+"}";
	}
	
	// 삭제
	public String delgrpJson(Groupfit del) {
		String ret="그룹핏 삭제가 완료되었습니다.";
		try {
			gdao.delGrpfit(del.getWm_id());
		}catch(Exception e) {
			ret="삭제시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+grpList()+"}";
	}

}