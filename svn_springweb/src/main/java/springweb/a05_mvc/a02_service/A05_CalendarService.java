package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A05_CalendarDao;
import springweb.z01_vo.Calendar;

@Service
public class A05_CalendarService {
	@Autowired
	private A05_CalendarDao dao;
	public List<Calendar> calList(){
		return dao.calList();
	}
	public void insertCalendar(Calendar insert) {
		dao.insertCalendar(insert);
	}
	public void uptCalendar(Calendar upt) {
		dao.uptCalendar(upt);
	}
	public void delCalendar(int id) {
		dao.delCalendar(id);
	}	
}
