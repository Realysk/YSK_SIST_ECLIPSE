package wannafit.content.mapfit;

import java.util.ArrayList;

import wannafit.content.vo.map_VO;

public class MapService {
	private mapDAO dao;

	public MapService() {
		super();
		dao = new mapDAO();
	}
	
	public ArrayList<map_VO> getGymList() {
		return dao.getGymList();
	}
}
