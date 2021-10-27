package javaexp.z99_database;

// java.sql.* : 하위 모든 객체 자동 import 처리..
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javaexp.z01_vo.Dept;
import javaexp.z01_vo.Emp;

public class A02_DeptDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 공통 기능 메서드 setConn() 선언..
	public void setConn() throws SQLException {
		// 1. jdbc 드라이버 메모리 로딩.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 특정 서버 접속.
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공");
	}
	// 조회 기능 메서드 선언.
	public ArrayList<Dept> getDeptList(){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		try {
			setConn();
			String sql = "select * \r\n"
					+ "FROM dept02";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dlist.add(new Dept(
							rs.getInt("deptno"),
							rs.getString("dname"),
							rs.getString("loc")
						));
			}
			rs.close(); stmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(stmt!=null)
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}		
		return dlist;
	}
	// 1. sql : DB와 대화문
	// 2. VO : 결과를 받을 java 객체
	// 3. 메서드 틀(입력, return할 데이터.)
	// 4. 접속 공통 메서드 : 기본예외처리.
	// 5. Statement
	// 6. ResultSet = rs.next(), rs.getXXX()
	// 7. 자원 해제
	public Dept getDept(int deptno) {
		Dept d = null;
		
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM dept02\r\n"
					+ "WHERE deptno = "+deptno;
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
			System.out.println("DB 예외:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(stmt!=null)
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		return d;
	}
	
	
	// 1. sql : DB와 대화문
	// 2. VO : 결과를 받을 java 객체
	// 3. 메서드 틀(입력, return할 데이터.)
	// 4. 접속 공통 메서드 : 기본예외처리.
	// 5. Statement
	// 6. ResultSet = rs.next(), rs.getXXX()
	// 7. 자원 해제
	public void insertDept(Dept ins) {
		
		try {
			setConn();
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO dept02 values(?,?,?)";
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
			System.out.println("DB 예외:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
	public void deleteDept(int deptno) {
		
		try {
			setConn();
			con.setAutoCommit(false);
			
			String sql = "DELETE FROM dept02 WHERE deptno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			pstmt.executeUpdate();
			con.commit();	
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 예외:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_DeptDao dao = new A02_DeptDao();
		dao.deleteDept(11);
		//dao.insertDept(new Dept(12,"총무","강남"));
		
		for(Dept d:dao.getDeptList()) {
			System.out.print(d.getDeptno()+"\t");
			System.out.print(d.getDname()+"\t");
			System.out.print(d.getLoc()+"\n");
		}
		
	}

}
