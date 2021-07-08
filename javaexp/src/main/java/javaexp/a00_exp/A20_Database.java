package javaexp.a00_exp;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class A20_Database {
	
	/*
	 # 0708 정리 문제 #
		1. Dao의 주요 필드 4가지 역할을 기술하세요.
	
				private Connection con;
				private Statement stmt;
				private PreparedStatement pstmt; : sql을 실행하는 객체
				private ResultSet rs; : select의 결과를 2차원 형식으로 받는 객체
				필드는 각 기능 메서드에서 공통/중복적으로 사용되기 때문에 선언하여 참조변수로 활용할 수 있다.
				ex) setCon() 기능 메서드에 의해서 Connection 객체에 데이터를 할당 처리한다.
	
		2. jdbc 드라이버의 역할에 대하여 기술하세요.
	
			java로 서버에 접속하기 위해 복잡한 프로그램이 필요하다.
			이 중에서 공통적인 부분을 클래스로 만들어 압축하여 개발자의 서버 접속에 필요하는 대부분의 내용 중
			변경이 필요 없는 부분은 각 DB 서버 회사에서 만들어 제공하고 있다. 이것을 드라이버라고 한다.
			java database connection driver 접속할 때 메모리에 로딩하여 시작한다.
			
			jdbc 드라이버는 소켓 통신을 통해 여러 모듈을 필요로 하며 각 DB 서버를 다루는 회사에서 지원한다.
			(XX.jar 형태로 지원)
	
		3. 특정 서버 접속정보 처리 기능 객체와 메서드의 매개변수값을 기술하세요.
		
			1) jdbc 드라이버를 Class.forName("드라이버명") 메모리 로딩.
			
			2) DriverManager.getConnection("드라이버,접속IP,port,sid","계정","비밀번호")
				=> 결과 return값으로 Connection에 메모리를 할당 처리한다.
	
	
				public void setCon() throws SQLException {
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					String info = "jdbc:oracle:thin:@localhost:1521:xe";
					con = DriverManager.getConnection(info,"scott","tiger");
					System.out.println("Database에 연결 되었습니다!");
				}
	
		4. 기능 메서드(조회) 구현의 순서와 핵심 코드를 기술하세요.
		
			0) SQL 작성
				- 입력, 결과값 확인
					select *
					from emp
					where ename like '%'||'A'||'%'
					and job like '%'||'B'||'%';
					
			1) 기능 메서드의 구조를 만들기
				- 결과로 어떤 데이터를 가져올 것인가? return값 형식/객체 ArrayList
				- DB 서버에 입력 데이터는 무엇인가? 매개변수 선언
				- return할 객체 선언과 할당
				- public ArrayList<Emp> emplist(Emp sch) {
					ArrayList<Emp> list = new ArrayList<Emp>();
					
					return list;
				}
				  
			2) 공통 연결 메서드 호출 setCon()과 기본 try {} catch(SQLException) {} 예외처리
				Connection con 에 메모리가 로딩 된 상황
				
			3) Statement 필드에 선언한 대화겍체에 메모리 로딩
				stmt = con.createStatement();
				- 대화객체 만들기
				
			4) ResultSet 객체 만들기, stmt에 sql로 수행 된 결과 객체 메모리 로딩
				rs = stmt.executeQuery(sql);
				
			5) while문 if문을 통해서 rs의 next()로 행 단위로 이동하면서 rs.getXXX("컬럼명"|순서index)로 가져 온 데이터를 객체에 할당
			  while(rs.next()) {
			  	list.add(new EMP(rs.getInt("empno"),.......));
			  }
			
			6) 자원의 해제 : 역순위 자원헤제 처리
				rs.close(); stmt.close(); con.close();
				
			7) 기타 예외 내용 처리
	
           ---------------------------------------------------------------------------------------------------
	
			1) 연결 할 공통 메서드를 호출한다.
				try {
					setCon();
			
			2) SQL에 있는 컬럼명을 문자열로 할당한다.
				String sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno \r\n"
						+ "FROM emp02";
			
			3) Statement 객체를 생성 한다.
				stmt = con.createStatement();
			
			4) ResultSet 객체를 생성 후 DB를 불러온다.
				rs = stmt.executeQuery(sql);
			
			5) 생성한 역순으로 자원을 해제 한다.
				rs.close(); stmt.close(); con.close();
			
			6) 예외처리를 통해 기타 예외처리를 한다.
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
 			---------------------------------------------------------------------------------------------------
	
		5. ResultSet 객체의 주요 메서드와 그 기능을 기술하세요.
	
			SQL에서 조회 후 행의 위치에 따른 결과만 출력이 가능하다.
			
			한 행당 rs.next()로 건너뛸 수 있고, 해당 행의 정보를 출력하려면
			
			rs.next();
			System.out.println("해당 행의 정보 : " + rs.get데이터유형(컬럼명 or 인덱스(1)));
			
			로 출력이 가능하다.
			
		6. ResultSet의 ArrayList 변환 과정을 기술하세요.
			
			while문으로 반복하며 다음과 같이 변환한다.
			
			while(rs.next()) {
				System.out.print(rs.get데이터유형(컬럼명 or 인덱스(1)) + "\t");
				..
				..
				
				생성자.add(new VO(
							rs.get데이터유형(컬럼명 or 인덱스(1)),
							..
							..
						));
				}
				System.out.println("ArrayList의 데이터 수량 : " + 생성자.size());
	
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 위에서 설정이 다 되면 main() 메서드에서 해당 객체를 호출시킨다.
		A20_Database dao = new A20_Database();
//		dao.생성자();

	}

}
