package diexp.vo;

import java.util.ArrayList;

public class ShoppingMall {
	private String shname;
	private Member member;
	private ArrayList<Member> mlist;
	
	public ShoppingMall() {
		mlist = new ArrayList<Member>();	
	}
	public ShoppingMall(String shname) {
		this.shname = shname;
		mlist = new ArrayList<Member>();	
	}
	public void showAllMembers() {
		System.out.println("쇼핑몰:"+shname);
		System.out.println("회원 정보 리스트");
		 if(mlist.size()>0) {
			 for(Member m:mlist) {
				 System.out.print(m.getId()+"\t");
				 System.out.print(m.getPass()+"\t");
				 System.out.print(m.getName()+"\t");
				 System.out.print(m.getAuth()+"\t");
				 System.out.print(m.getPoint()+"\n");
			 }
		 }
	}
	public ArrayList<Member> getMlist() {
		return mlist;
	}
	public void setMlist(ArrayList<Member> mlist) {
		this.mlist = mlist;
	}
	public String getShname() {
		return shname;
	}
	public void setShname(String shname) {
		this.shname = shname;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public void showMember() {
		System.out.println("# 온라인 쇼핑몰 #");
		System.out.println(shname);
		if(member!=null) {
			System.out.println("가입회원정보");
			System.out.println(member.getId());
			System.out.println(member.getPass());
			System.out.println(member.getName());
			System.out.println(member.getAuth());
			System.out.println(member.getPoint());
		}
	}
	
}
