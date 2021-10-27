package javaexp.a05_object;

public class A10_ParameterObj {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Member m1 = new Member("himan","7777","홍길동");
		// Member(String id, String pass, String name)
		ShoppingSite sh1 = new ShoppingSite();
		sh1.login(m1);
		sh1.regMember("아이디", "패스워드", "이름","권한");
		sh1.regMember(m1);
		OnLineScreen on1 = new OnLineScreen();
		on1.setMovie(new Person01("홍길동",12000));
	}
}
// ex)  OnLineScreen 객체의 기능메서드 seeMovie(Person-이름/비용)
///       @@@가 영화관에 가서 @@를 지불하고 영화를 보다 출력 처리.
//   
class OnLineScreen{
	void setMovie(Person01 p) {
		System.out.println(p.name+"가 영화관에 가서 "+
			p.pay+"원을 지불하고 영화를 보다");
	}
}
class Person01{
	String name;
	int pay;
	public Person01(String name, int pay) {
		super();
		this.name = name;
		this.pay = pay;
	}
	
}
class ShoppingSite{
	void login(String id, String pass) {
		System.out.println("로그인 처리:"+id);
	}
	void login(Member m) {
		System.out.println("로그인 처리:"+m.id);
		System.out.println("로그인 처리:"+m.pass);
	}
	void regMember(String id, String pass, 
						String name, String auth) {
		System.out.println("회원 가입처리:"+id);
	}
	void regMember(Member m) {
		System.out.println("회원 가입 내용:"+m.id);
		System.out.println("회원 가입 내용:"+m.name);
		System.out.println("회원 가입 내용:"+m.pass);
	}
	
	
}