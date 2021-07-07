package javaexp.z99_database;

// java.sql.* : 하위 모든 객체 자동 import
import java.sql.*;
import java.util.ArrayList;

import javaexp.z01_vo.Dept;


public class A02_DeptDao {
	
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	// 공통 기능 메서드 setConn() 선언
	public void setConn() throws SQLException {
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
	
	// 조회 기능 메서드 선언
	public ArrayList<Dept> getDeptList() {
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		return dlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_DeptDao dao = new A02_DeptDao();
		try {
			dao.setConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
