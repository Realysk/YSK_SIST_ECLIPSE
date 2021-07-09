package javaexp.z99_database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import javaexp.a00_exp.z01_vo.Member;

public class A06_DmlExp {

				// 필드 선언
				private Connection con;
				private PreparedStatement pstmt;
				private ResultSet rs;
				
				// 공통 메서드
				public void setCon() throws SQLException {
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					String info = "jdbc:oracle:thin:@localhost:1521:XE";
					con = DriverManager.getConnection(info,"scott","tiger");
					System.out.println("Database On");
				}
				
				public void updateMember(Member m) {
					
					try {
						setCon();
						con.setAutoCommit(false);
						String sql = "UPDATE member02\r\n"
								+ "	SET id = ?,\r\n"
								+ "		pass = ?,\r\n"
								+ "		name = ?,\r\n"
								+ "		auth = ?,\r\n"
								+ "		point = ?,\r\n"
								+ "		regdte = to_date(?,'YYYY/MM/DD')\r\n"
								+ "WHERE mno = ?";
						
		// int mno, String id, String pass, String name, String auth, int point, String regdteS
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, m.getId());
						pstmt.setString(2, m.getPass());					
						pstmt.setString(3, m.getName());					
						pstmt.setString(4, m.getAuth());					
						pstmt.setInt(5, m.getPoint());					
						pstmt.setString(6, m.getRegdteS());
						pstmt.setInt(7, m.getMno());
						
						pstmt.executeUpdate();
						con.commit();
						
						pstmt.close(); con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
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

		A06_DmlExp dao = new A06_DmlExp();
		
		//int mno, String id, String pass, String name, String auth, int point, String regdteS
		dao.updateMember(new Member(1004,"angel(upt)","8888","김수현","관리자",2000,"2021/07/30"));

	}

}
