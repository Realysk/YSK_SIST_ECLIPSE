package Project_SIST.Java;

//로그인 처리시 DB 데이터 전달
//회원가입시 회원가입내용 전달
//회원리스트 처리시 회원리스트 데이터의 단위객체
public class Member {
private String id;
private String pass;
private String name;
private String auth;;
private String email;
private int point; 
// 이정도 데이터를 사용한다는 걸 만들어서 캡쳐해서 첨부,,

// 아이디랑 비번정도만 받는 생성자 하나
public Member(String id, String pass) {
   super();
   this.id = id;
   this.pass = pass;
}

// 다 받는 생성자 하나
public Member(String id, String pass, String name, String auth, String email, int point) {
   super();
   this.id = id;
   this.pass = pass;
   this.name = name;
   this.auth = auth;
   this.email = email;
   this.point = point;
}

// 데이터 셋팅할 메소드들 자동완성
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