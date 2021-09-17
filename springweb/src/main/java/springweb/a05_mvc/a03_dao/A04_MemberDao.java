package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;


import springweb.z01_vo.Member;

public interface A04_MemberDao {
	
	public ArrayList<Member> memberList();
	
	public void insertMember (Member ins);
	
	public void updateMember (Member upt);
	
	public void deleteMember (String id);
	
	public ArrayList<Member> schMember(String id, String auth);

}