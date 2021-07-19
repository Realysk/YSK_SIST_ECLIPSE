package javaexp.z05_project.PICMAGINE;

import java.sql.*;

public class FILEDAO {
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// DB 연결
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
	
	// DB에 넘길 데이터 설정 (태그 추가하게 되면 DTO에도 추가해야함)

	public int upload(String fileName, String fileRealName) {
		
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO uploadFile VALUES (?, ?)";
			
			pstmt = con.prepareStatement(sql);

//			pstmt.setString(1, upload_id);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
//			pstmt.setString(4, uploaded);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			System.out.println("SQL 예외 : " + e.getMessage());
			
			try {
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
		
		return -1;
	
}
	

}
