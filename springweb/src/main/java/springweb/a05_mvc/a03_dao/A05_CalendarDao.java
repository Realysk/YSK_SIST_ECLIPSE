package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;

import springweb.z01_vo.Calendar;
// springweb.a05_mvc.a03_dao.A05_CalendarDao
public interface A05_CalendarDao {
	public ArrayList<Calendar> calList();
	public void insertCalendar(Calendar insert);
	
}
