package javaexp.z99_database;

import java.sql.*;
import java.util.ArrayList;

import javaexp.z01_vo.Emp;

public class A03_DaoSch {
	
	// keyword 검색을 통한 처리

		private Connection con;
		private Statement stmt;
		private PreparedStatement pstmt;
		private ResultSet rs;

		public void setCon() throws SQLException {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String info = "jdbc:oracle:thin:@localhost:1521:xe"; // 개인 DB
			con = DriverManager.getConnection(info,"scott","tiger"); // 개인 DB 로그인 정보
			System.out.println("접속 성공!");
		}
		
		// 1. SQL문 작성 => VO
		// 2. 메서드 선언 : 리턴 데이터, 입력 데이터에 맞는 객체
		// 3. 공통 연결 메서드 호출 및 기본 예외처리
		// 4. 대화 객체 : SQL 선언과 매개변수 처리
		// 5. 결과 객체
		// 6. while을 통한 ArrayList 할당
		// 7. 자원 해제
		// 8. main()을 통해 test
			
		public ArrayList<Emp> empSch(Emp sch) {
			
			ArrayList<Emp> emplist = new ArrayList<Emp>();
			
			try {
				setCon();
				String sql = "SELECT *\r\n"
						+ "FROM emp01\r\n"
						+ "WHERE ename LIKE '%'||'" + sch.getEname() + "'||'%'\r\n"
						+ "AND job LIKE '%'||'" + sch.getJob() + "'||'%' ";
				System.out.println("SQL : " + sql);
				
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					emplist.add(new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getDouble("comm"),
							rs.getInt("deptno")
						));
				}
				
				System.out.println("검색 건수 : " + emplist.size());
				
				rs.close(); stmt.close(); con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
				System.out.println("SQL 예외 : " + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 : " + e.getMessage());
				
			} finally {
				
				if(rs != null) { try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(stmt != null) { try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(pstmt != null) { try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(con != null) { try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				
			}
			
			return emplist;
		}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		A03_DaoSch dao = new A03_DaoSch();
		ArrayList<Emp> elist = dao.empSch(new Emp("A", "A"));
		for(Emp e:elist) {
			System.out.print(e.getEmpno() + "\t");
			System.out.print(e.getEname() + "\t");
			System.out.print(e.getJob() + "\t");
			System.out.print(e.getSal() + "\t");
			System.out.print(e.getComm() + "\t");
			System.out.print(e.getDeptno() + "\n");
		}

	}

}