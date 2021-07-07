package javaexp.z99_database;

import java.beans.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.jdi.connect.spi.Connection;

import javaexp.z01_vo.Dept;

public class A02_DeptDao {
	
	private Connection con;
// 2. 서버와 대화를 하는 객체
	private Statement stmt;
	private PreparedStatement pstmt;
// 3. 결과값을 받는 객체
	private ResultSet rs;
	
	// 공통기능 메서드 (연결처리하는 기능메서드)
	public void setCon() throws SQLException {
		// 1. 드라이버 메모리 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 특정 서버 접속
		// 1) 서버 정보
		String info = "jdbc:oracle:thin:@localhost:1521:xe"; // 개인 DB
//		String info = "jdbc:oracle:thin:@110.93.182.83:1521:xe"; // 학원 고정IP
		java.sql.Connection con = DriverManager.getConnection(info,"scott","tiger"); // 개인 DB 로그인 정보
//		java.sql.Connection con = DriverManager.getConnection(info,"system","1111"); // 학원 DB 로그인 정보
		System.out.println("접속 성공!");
	}
	
	public ArrayList<Dept> getDeptList() {
		ArrayList<Dept> deptlist = new ArrayList<Dept>();
		
		
		return deptlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		A02_DeptDao dao = new A02_DeptDao();
		try {
			dao.setCon();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

	}

}
