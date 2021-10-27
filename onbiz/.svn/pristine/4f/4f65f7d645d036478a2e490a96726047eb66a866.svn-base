package onbiz.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onbiz.dao.OnCalendarDao;
import onbiz.vo.OnCalendar;

@Service
public class OnCalendarService {
	
	@Autowired
	OnCalendarDao dao;

	public ArrayList<OnCalendar> mycalList(String emp_no){
		return dao.mycalList(emp_no);
	};
	
	public void calInsert(OnCalendar oncal) {
		dao.calInsert(oncal);
	};
	
	public void calUpdate(OnCalendar oncal) {
		dao.calUpdate(oncal);
	};
	
	public void calDelete(OnCalendar oncal) {
		dao.calDelete(oncal);
	};
}
