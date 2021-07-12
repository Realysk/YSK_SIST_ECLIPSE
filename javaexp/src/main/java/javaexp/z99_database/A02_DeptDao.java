package javaexp.z99_database;

// java.sql.* : 하위 모든 객체 자동 import
import java.sql.*;
import java.util.ArrayList;

import javaexp.z01_vo.Dept;
import javaexp.z01_vo.Emp;


public class A02_DeptDao {
	
	// ex) 조회문 select * from dept를 위한 A02_DeptDao.java를 만들고
	// 		공통 연결 메서드와 기능 메서드 (부서정보 조회) 틀을 만드세요.
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 공통 기능 메서드 setCon() 선언
	public void setCon() throws SQLException {
		// 1. jdbc 드라이버 메모리 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 특정 서버 접속
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		
		System.out.println("접속 성공");
	}
	
	// 조회 기능 메서드 선언 (아웃라인 구성해야함)
	public ArrayList<Dept> getDeptList() {
		ArrayList<Dept> dlist = new ArrayList<Dept>();

		return dlist;
	}
	
	// 1. SQL : DB와 대화문
	// 2. VO : 결과를 받을 JAVA 객체
	// 3. 메서드 아웃라인 : 입력 값, return 값 데이터
	// 4. 접속 공통 메서드 : 기본 예외처리
	// 5. Statement
	// 6. ResultSet = rs.next(), rs.getXXX()
	// 7. 자원 해제
	
	public Dept getDept(int deptno) {
		
		Dept d = null;
		
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM dept02\r\n"
					+ "WHERE deptno = " + deptno;
//			System.out.println("SQL : " + sql);
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				d = new Dept(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
					);
			}
			
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
		
		return d;
	}
	
	// ex) A02_DeptDao.java에서 부서정보를 등록하고 조회하세요.
	//		dept02 테이블 생성
	
	public void insertDept(Dept ins) {
		
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO dept02 VALUES(?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getDeptno());
			pstmt.setString(2, ins.getDname());
			pstmt.setString(3, ins.getLoc());
			
			pstmt.executeUpdate();
			con.commit();
			
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			System.out.println("SQL 예외 : " + e.getMessage());
			
			try {
				// 입력 중간 문제 발생, rollback 처리
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
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
		
	}
	
	// ex) A02_DeptDao.java 기존 소스를 활용하여 부서번호로 부서정보를 삭제하세요.
	
	public void deleteDept(int deptno) {
		
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "DELETE FROM dept02\r\n"
					+ "WHERE deptno = ?";
			
			pstmt.setInt(1, deptno);
			
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			System.out.println("SQL 예외 : " + e.getMessage());
			
			try {
				// 입력 중간 문제 발생, rollback 처리
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
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
		
	}	

		// 1. SQL : DB와 대화문
		// 2. VO : 결과를 받을 JAVA 객체
		// 3. 메서드 아웃라인 : 입력 값, return 값 데이터
		// 4. 접속 공통 메서드 : 기본 예외처리
		// 5. Statement
		// 6. ResultSet = rs.next(), rs.getXXX()
		// 7. 자원 해제
		

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_DeptDao dao = new A02_DeptDao();
//		try {
//			dao.setConn();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		Dept d = dao.getDept(10);
//		if(d != null) {
//			System.out.print(d.getDeptno() + "\t");
//			System.out.print(d.getDname() + "\t");
//			System.out.print(d.getLoc() + "\n");
//		} else {
//			System.out.println("데이터가 없습니다.");
//		}
		
//		dao.insertDept(new Dept(12, "총무", "강남"));
		
//		dao.deleteDept(0);
		
		for(Dept d:dao.getDeptList()) {
			System.out.print(d.getDeptno() + "\t");
			System.out.print(d.getDname() + "\t");
			System.out.print(d.getLoc() + "\n");
		}
		
	}

}
