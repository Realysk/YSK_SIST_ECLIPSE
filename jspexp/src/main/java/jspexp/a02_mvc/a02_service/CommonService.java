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
	public String  getJsonEmp(int empno) {
		// dao를 통해 나온 Emp객체를 gson으로 처리.
		String empJson="{}";
		Emp emp = dao.getEmp(empno);
		if(emp!=null) {
			empJson =  gson.toJson(emp);
		}
		return empJson;
	}
	public String  getJsonMember(String id) {
		String memJson="{}";
		Member mem = dao.getMember(id);
		if(mem!=null) {
			memJson =  gson.toJson(mem);
		}
		return memJson;
	}
	// 전체 list 가져오는 dao 처리 및 json 데이터 만들기.
	public String memberList() {
		return gson.toJson( dao.getMemberList() );
	}
	// 등록 처리하는 dao 호출 및 최종 json 데이터 처리 
	public String insMemberJson(Member ins) {
		String ret="등록성공";
		try {
			dao.insertMember(ins);
		}catch(Exception e) {
			ret="등록시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+memberList()+"}";
	}
	public String uptMemberJson(Member upt) {
		String ret="수정성공";
		try {
			dao.updateMember(upt);
		}catch(Exception e) {
			ret="수정시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+memberList()+"}";
	}	
	public String delMemberJson(Member del) {
		String ret="삭제성공";
		try {
			dao.deleteMember(del.getId());
		}catch(Exception e) {
			ret="삭제시 문제발생("+e.getMessage()+")";
		}
		// {"result":"결과","list":[]}
		return "{\"result\":\""+ret+"\",\"list\":"+memberList()+"}";
	}	
	
	
	
}
