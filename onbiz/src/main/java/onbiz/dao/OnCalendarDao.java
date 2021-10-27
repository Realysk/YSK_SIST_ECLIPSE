package onbiz.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import onbiz.vo.OnCalendar;

@Repository
public interface OnCalendarDao {

	public ArrayList<OnCalendar> mycalList(String emp_no);
	public void calInsert(OnCalendar oncal);
	public void calUpdate(OnCalendar oncal);
	public void calDelete(OnCalendar oncal);
}
