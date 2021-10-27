package diexp.vo;

import java.util.Map;
// diexp.vo.OnEmp
public class OnEmp {
	private String comName;
	private Map<Integer, Emp> map;
	public OnEmp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OnEmp(String comName) {
		super();
		this.comName = comName;
	}
	public void setMap(Map<Integer, Emp> map) {
		this.map = map;
	}
	public void showOnEmp() {
		System.out.println("회사명:"+comName);
		System.out.println("사원정보:"+map);
		for(int empno : map.keySet()) {
			Emp emp = map.get(empno); // key를 통해서 연결된 학생정보를 가져온다.
			System.out.print(empno+"\t");
			System.out.print(emp.getEname()+"\t");
			System.out.print(emp.getJob()+"\t");
			System.out.print(emp.getSal()+"\n");
		}		
	}
	
/*
[중:응용]1. OnEmp클래스 사원명, Map<Integer, Emp> <사원번호,사원정보>를 설정하여 컨테이너에 의해 데이터를
	출력하세요. 
 */	
	
}
