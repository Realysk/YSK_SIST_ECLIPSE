package javaexp.z99_database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

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
	
	public ArrayList<Emp_Dept> empDeptSch(Emp_Dept sch) {
		
		ArrayList<Emp_Dept> edlist = new ArrayList<Emp_Dept>();
		
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM emp e, dept d\r\n"
					+ "WHERE e.deptno = d.deptno\r\n"
					+ "AND ename LIKE '%'||'" + sch.getEname() + "'||'%'\r\n"
					+ "AND dname LIKE '%'||'" + sch.getDname() + "'||'%' ";
			System.out.println("SQL : " + sql);
			
			// ex) A04_DaoSch.java 부분 데이터 처리 및 main()에서 데이터 확인
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			/*
			 int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno,
			 String dname, String loc
			 */
			
			while(rs.next()) {
				edlist.add(new Emp_Dept(
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getString("job"),
						rs.getInt("mgr"),
						rs.getDate("hiredate"),
						rs.getDouble("sal"),
						rs.getDouble("comm"),
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
					));
			}
			
			System.out.println("검색 건수 : " + edlist.size());
			
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
		
		return edlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		A04_DaoSch dao = new A04_DaoSch();
		for(Emp_Dept ed:dao.empDeptSch(new Emp_Dept("A", "A"))) {
			System.out.print(ed.getEmpno() + "\t");
			System.out.print(ed.getEname() + "\t");
			System.out.print(ed.getJob() + "\t");
			System.out.print(ed.getSal() + "\t");
			System.out.print(ed.getComm() + "\t");
			System.out.print(ed.getDeptno() + "\t");
			System.out.print(ed.getDname() + "\t");
			System.out.print(ed.getLoc() + "\n");
		}

	}

}
