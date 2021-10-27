package wannafit.content.reserve;

import com.google.gson.Gson;

import wannafit.content.vo.Reserve;
import wannafit.content.vo.Trainer;

public class ReserveService {
	private ReserveDAO dao;
	private Gson gson;

	public ReserveService() {
		super();
		dao = new ReserveDAO();
		gson = new Gson();
	}
	
	public String getTrainerList(Trainer tr) {
		return "{\"result\":\"조회\", \"list\":" + gson.toJson(dao.getTrainerList(tr)) + "}";
	}
	
	public Trainer getTrainerInfo(String wm_id) {
		return dao.getTrainerInfo(wm_id);
	}
	
	public String getSchedule(String wm_id) {
		return "{\"result\":\"상세\", \"list\":" + 
			gson.toJson(dao.getSchedule(wm_id)) + "}";
	}
	
	public boolean insertReserve(Reserve inrev) {
		return dao.insertReserve(inrev); 
	}

}
