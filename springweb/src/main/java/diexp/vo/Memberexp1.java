package diexp.vo;

public class Memberexp1 {
	
	private String mno_exp1;
	private String id;
	private String pass;
	private String name;
	private String point;
	private String auth = "회원";
	
	public Memberexp1() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Memberexp1(String mno_exp1, String id, String pass, String name, String point, String auth) {
		super();
		this.mno_exp1 = mno_exp1;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.point = point;
		this.auth = auth;
	}

	public String getMno_exp1() {
		return mno_exp1;
	}

	public void setMno_exp1(String mno_exp1) {
		this.mno_exp1 = mno_exp1;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

}
