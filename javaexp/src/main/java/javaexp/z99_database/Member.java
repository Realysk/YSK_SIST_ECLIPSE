package javaexp.z99_database;

import java.util.Date;

public class Member {
	
	/*
	 mno number PRIMARY KEY,
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER,
	regdte date
	 */
	
	private int mno;
	private String id;
	private String pass;
	private String name;
	private String auth;
	private int point;
	private Date regdte;
	private String regdteS;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

	public Member(int mno, String id, String pass, String name, String auth, int point, Date regdte) {
		super();
		this.mno = mno;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.regdte = regdte;
	}

	public Member(int mno, String id, String pass, String name, String auth, int point, String regdteS) {
		super();
		this.mno = mno;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.regdteS = regdteS;
	}
	
	public String getRegdteS() {
		return regdteS;
	}

	public void setRegdteS(String regdteS) {
		this.regdteS = regdteS;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getRegdte() {
		return regdte;
	}

	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	
}
