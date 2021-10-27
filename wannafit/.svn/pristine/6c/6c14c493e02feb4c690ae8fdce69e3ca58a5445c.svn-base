package wannafit.content.partner.trainer;

import com.google.gson.Gson;

import wannafit.content.vo.Trainer;

public class TrainerService {
	private TrainerDAO dao;
	private Gson gson;

	public TrainerService() {
		super();
		dao = new TrainerDAO();
		gson = new Gson();
	}
	
	public String insertTr(Trainer tr) {
		return dao.insertTr(tr);
	}
}
