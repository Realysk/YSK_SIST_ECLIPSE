package jspexp.a02_mvc.a02_service;

import com.google.gson.Gson;

import jspexp.z01_database.A05_PreparedDao;
import jspexp.z02_vo.Emp;
import jspexp.z02_vo.Member;
// service ==> dao단 연동 처리..
// jspexp.a02_mvc.a02_service.A22_MemberService.java
public class CommonService {
	private A05_PreparedDao dao;
	private Gson gson;
	public CommonService() {
		// TODO Auto-generated constructor stub
		dao = new A05_PreparedDao();
		gson = new Gson();
	}
	
	public Member getMember(String id) {
		return dao.getMember(id);
	}
	
	public String getJsonEmp(int empno) {
		// DAO를 통해 나온 Emp객체를 gson으로 처리
		
		String empJson = "{}";
		
		Emp emp = dao.getEmp(empno);
		
		if(dao.getEmp(empno)!=null) {
			empJson = gson.toJson(emp);
		}
		
		return empJson;
	}
	
	public String getJsonMember(String id) {
		// DAO를 통해 나온 Member객체를 gson으로 처리
		
		String memJson = "{}";
		
		Member mem = dao.getMember(id);
		
		if(dao.getMember(id)!=null) {
			memJson = gson.toJson(id);
		}
		
		return memJson;
	}

}
