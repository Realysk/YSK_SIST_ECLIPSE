package javaexp.a00_exp.a07;

public class A01_Database {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 정리문제
1. Dao의 주요 필드 4가지의 역할을 기술하세요.
	Connection : 연결객체 DB서버와 연결기능
	Statement, PreparedStatement : sql을 실행하는 객체.
	ResultSet : select의 결과를 2차원형식으로 받는 객체
	필드는 각 기능메서드에서 공통적/중복적으로 사용되기 때문에, 선언하여,
	참조변수로 활용할 수 있다.
	ex) setConn() 기능 메서드에 의해서, Connection 객체에 데이터를 할당 처리하낟.
2. jdbc 드라이버의 역할에 대하여 기술하세요
	java로 서버에 접속하기위해 복잡한 프로그램이 필요하다.
	이 중에서 공통적인 부분을 클래스로 만들어 압축하여, 개발자의
	서버 접속에 필요하는 대부분의 내용 중, 변경이 필요없는 부분은
	각 DB 서버회사에서 만들어 제공하고 있다. 이것을 드라이버라고 한다.
	java database connection driver 접속할 때, 메모리에 로딩하여 시작한다.

3. 특정 서버 접속정보 처리 기능객체와 메서드의 매개변수값을 기술하세요.
	1) jdbc드라이버를 Class.forName("드라이버명") 메모리로딩.
	2) DriverManager.getConnection("드라이버,접속ip,port,sid","계정","비밀번호");
		==> 결과 리턴값으로 Connection에 메모리를 할당 처리한다.
		
4. 기능 메서드(조회) 구현의 순서와 핵심코드를 기술하세요
	0) sql 작성.
		입력, 결과값 확인.
		select *
		from emp
		where ename like '%'||'A'||'%'
		and job like '%'||'B'||'%';
	1) 기능메서드의 구조를 만들기,
		결과로 어떤 데이터를 가져올 것인가? 리턴값 형식/객체  ArrayList
		DB서버에 입력 데이터는 무엇인가? 매개변수 선언..
		리턴할 객체 선언과 할당.
		public ArrayList<Emp> empList(Emp sch){
			ArrayList<Emp> list = new ArrayList<Emp>();
			
			return list;
		}
	2) 공통연결메서드 호출 setConn()과 기본 try{}catch(SQLException){}예외처리
		Connection con 에 메모리가 로딩된 상황.
	3) Statement 필드에 선언한 대화객체에 메모리 로딩.. 
		stmt = con.createStatement();
		대화객체 만들기
	4) ResultSet 객체 만들기,  stmt에 sql로 수행된 결과 객체 메모리 로딩..
		rs = stmt.executeQuery(sql);
	5) while문, if문을 통해서 rs의 next()로 행단위로 이동하면서 
		rs.getXXX("컬럼명"|순서index)로 가져온 데이터를 객체에 할당.
		while(rs.next()){
			list.add(new Emp(rs.getInt("empno"),.....));
		}
	6) 자원의 해제 : 역순위 자원해제 처리.
		rs.close(); stmt.close(); con.close();
	7) 기타 예외내용 처리.	
5. ResultSet 객체의 주요 메서드와 그 기능을 기술하세요.
	rs.next() : 행단위로 이동하면서, 다음행의 데이터가 있는지 여부(true/false)를 나타냄
	rs.get데이터유형("컬럼명")
	rs.get데이터유형(1부터시작하는 번호) select 의 선언된 순서로 호출된다.
	ex)
	while(rs.next()){
		rs.getInt("empno")
		rs.getString(2)
	}
6. ResultSet의 ArrayList 변환 과정을 기술하세요.
	ArrayList<VO>가 선언된 내용을
	while(rs.next()){  // 반복문을 호출하면서,
		// 리스트에 각 행의 단위객체를 추가할당 처리..
		list.add(new Emp(rs.getInt("empno")....);
	
	}
 
 
  */
	}

}
