package javaexp.z05_project;

// 로그인 처리시, DB 데이터 전달
// 회원가입시, 회원가입내용 전달
// 회원리스트 처리시, 회원리스트 데이터의 단위객체
public class Member {
	private String id;
	private String pass;
	private String name;
	private String auth;
	private String email;
	private int point;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
	public Member(String id, String pass, String name, String auth, String email, int point) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.email = email;
		this.point = point;
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
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
