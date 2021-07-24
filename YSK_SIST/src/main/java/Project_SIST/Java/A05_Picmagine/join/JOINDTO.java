package Project_SIST.Java.A05_Picmagine.join;

public class JOINDTO {
	
	private String memcode; // 회원 번호
	private String name; // 이름
	private String id; // ID
	private String pw; // PW
	private String tel; // Tel
	private String email; // 이메일
	
	public JOINDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JOINDTO(String memcode, String name, String id, String pw, String tel, String email) {
		super();
		this.memcode = memcode;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.email = email;
	}

	public String getMemcode() {
		return memcode;
	}

	public void setMemcode(String memcode) {
		this.memcode = memcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
