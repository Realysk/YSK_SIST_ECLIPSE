package javaexp.z99_database;

import java.sql.*;
import java.util.ArrayList;

import javaexp.z01_vo.Emp;
import javaexp.z01_vo.Emp_Dept;

public class A04_DaoSch {
	
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
	
	public ArrayList<Emp> empDeptSch(Emp_Dept sch) {
		
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM emp e, dept d\r\n"
					+ "WHERE e.deptno = d.deptno\r\n"
					+ "AND ename LIKE '%'||'" + sch.getEname() + "'||'%'\r\n"
					+ "AND dname LIKE '%'||'" + sch.getDname() + "'||'%' ";
			System.out.println("SQL : " + sql);
			
			
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
		
		A04_DaoSch dao = new A04_DaoSch();
		dao.empDeptSch(new Emp_Dept("A","A"));

	}

}
