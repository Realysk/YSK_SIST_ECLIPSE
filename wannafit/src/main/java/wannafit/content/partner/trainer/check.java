package wannafit.content.partner.trainer;

import java.sql.Date;
import java.util.ArrayList;

import oracle.sql.DATE;
import wannafit.content.reserve.ReserveDAO;
import wannafit.content.vo.Reserve_Schedule;

public class check {
	static ReserveDAO dao = new ReserveDAO();
	static ArrayList<Reserve_Schedule> rsList = new ArrayList<Reserve_Schedule>();

	public check() {
		super();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Date date = new Date();

		Reserve_Schedule rs = new Reserve_Schedule();
		//rsList = dao.getScheduleDate("daily03");
		
		//for(Reserve_Schedule r:rsList) {
		//	Date date = r.getWrs_date();
		//	System.out.println(date);
		//}
		
		
	}

}
