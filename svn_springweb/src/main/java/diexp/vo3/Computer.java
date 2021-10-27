package diexp.vo3;

import java.util.ArrayList;
// diexp.vo.Computer
// diexp.vo.Ram
// diexp.vo.Hdd
// diexp.vo.Cpu
public class Computer {
	private String company;
	private ArrayList<PartDevice> plist;
	public Computer() {
		// TODO Auto-generated constructor stub
		plist = new ArrayList<PartDevice>();
	}
	public Computer(String company) {
		super();
		this.company = company;
		plist = new ArrayList<PartDevice>();
	}
	public void setPlist(ArrayList<PartDevice> plist) {
		this.plist = plist;
	}
	public void testExp() {
		company="삼성전자";
		plist.add(new Cpu());
		plist.add(new Ram());
		showParts();
	}
	
	public void showParts() {
		System.out.println("컴퓨터 제조사:"+company);
		System.out.println("포함된 부품들!");
		for(PartDevice pd : plist) {
			pd.showDevice();
		}
	}
	

}
