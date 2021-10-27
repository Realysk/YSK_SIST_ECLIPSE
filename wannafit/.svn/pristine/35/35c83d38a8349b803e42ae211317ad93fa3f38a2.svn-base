package wannafit.content.mypage.mytr;

import com.google.gson.Gson;

import wannafit.content.vo.Reserve_Schedule;
import wannafit.content.vo.User;

public class MyTrService {
	private MyTrDAO dao;
	private Gson gson;

	public MyTrService() {
		super();
		dao = new MyTrDAO();
		gson = new Gson();
	}
	
	public String getReserveList(String id) {
		return "{\"result\":\"예약내역\", \"list\":" + 
			gson.toJson(dao.getReserveList(id)) + "}";
	}
	
	public String getScheduleList(String id) {
		return "{\"result\":\"예약일정\", \"list\":" + 
				gson.toJson(dao.getScheduleList(id)) + "}";
	}
	
	// 예약일정 조회 
	/*
	public String getScheduleJson(String wrs_num) {
			
		String schJson = "{}";
			
		Reserve_Schedule sch = dao.getSchedule(wrs_num);
			
		if(sch != null) {
			schJson = gson.toJson(sch);
		}
			
		return schJson;
	}
	*/
	
	// 삽입
	public String insSchedule(Reserve_Schedule ins) {
		String ret = "예약일정 등록성공";
				
		try {
			dao.insSchedule(ins);
		} catch(Exception e) {
			ret="예약일정 등록실패 ("+e.getMessage()+")";
		}
				
		return ret;
	}
	
	// 수정
	public String uptSchedule(Reserve_Schedule upt) {
		String ret = "예약일정 수정성공";
			
		try {
			dao.uptSchedule(upt);
		} catch(Exception e) {
			ret="예약일정 수정실패("+e.getMessage()+")";
		}
			
		return "{\"result\":\""+ret+"\",\"list\":"+ 
			getScheduleList(upt.getWm_id())+"}";
	}
		
	// 삭제
	public String delSchedule(String wrs_num, String wm_id) {
		String ret = "예약일정 삭제성공";
			
		try {
			dao.delSchedule(wrs_num, wm_id);
		} catch(Exception e) {
			ret="예약일정 삭제실패("+e.getMessage()+")";
		}
			
		return "{\"result\":\""+ret+"\",\"list\":"+getScheduleList(wm_id)+"}";
	}
}
