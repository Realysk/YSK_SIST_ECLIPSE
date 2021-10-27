package jspexp.a01_start;
// jspexp.a01_start.A02_Entertainer
public class A02_Entertainer {
	private String name;
	private String birthdate;
	private String part;
	public A02_Entertainer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public A02_Entertainer(String name, String birthdate, String part) {
		super();
		this.name = name;
		this.birthdate = birthdate;
		this.part = part;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
}
