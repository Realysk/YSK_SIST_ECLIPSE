package springweb.a05_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A04_MemberDao;
import springweb.z01_vo.Member;

@Service
public class A04_MemberService {
	@Autowired
	private A04_MemberDao dao;
	public ArrayList<Member> memberList(Member sch){
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		return dao.memberList(sch);
	}
	public void insertMember(Member ins) {
		dao.insertMember(ins);
	}
	public void updateMember(Member upt) {
		dao.updateMember(upt);
	}
	public void deleteMember(String id) {
		dao.deleteMember(id);
	}
}
