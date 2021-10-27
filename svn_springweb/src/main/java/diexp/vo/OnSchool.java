package diexp.vo;

import java.util.Map;

public class OnSchool {
	private String name;
	private Map<Integer, Student> studInfo;
	public OnSchool(String name) {
		super();
		this.name = name;
	}
	public void setStudInfo(Map<Integer, Student> studInfo) {
		this.studInfo = studInfo;
	}
	public void showInfo() {
		System.out.println("# 학교명:"+name);
		// studInfo.keySet() : map안에 있는 key만 가져와서 반복문 수행..
		for(int no : studInfo.keySet()) {
			Student s = studInfo.get(no); // key를 통해서 연결된 학생정보를 가져온다.
			System.out.print(no+"\t");
			System.out.print(s.getName()+"\t");
			System.out.print(s.getKor()+"\t");
			System.out.print(s.getEng()+"\t");
			System.out.print(s.getMath()+"\n");
		}
	} 
	
}
