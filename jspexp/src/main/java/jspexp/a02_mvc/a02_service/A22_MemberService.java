package jspexp.a02_mvc.a02_service;

import jspexp.z01_database.A05_PreparedDao;
import jspexp.z02_vo.Member;
// service ==> dao단 연동 처리..
// jspexp.a02_mvc.a02_service.A22_MemberService.java
public class A22_MemberService {
	private A05_PreparedDao dao;
	public A22_MemberService() {
		// TODO Auto-generated constructor stub
		dao = new A05_PreparedDao();
	}
	public Member getMember(String id) {
		return dao.getMember(id);
	}

}
