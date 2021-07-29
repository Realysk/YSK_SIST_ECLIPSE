package jspexp.z01_database;

import java.sql.*;
import java.util.*;

import jspexp.z02_vo.*;

public class MemberDAO {
	
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
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
//		String info = "jdbc:oracle:thin:@110.93.182.83:1521:xe";
		con = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("===== DATABASE에 연결되었습니다. =====");		
	}
	
	// DB 조회 메서드
	public ArrayList<Member> getMemList() {
		ArrayList<Member> memlist = new ArrayList<Member>();
		try {
			setCon();
			String sql = "SELECT * FROM Member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memlist.add(new Member(
							rs.getString("id"),
							rs.getString("pass"),
							rs.getString("name"),
							rs.getString("auth"),
							rs.getInt("point")
						));
			}
			System.out.println("ArrayList의 데이터 갯수 : " + memlist.size());
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외 발생 : " + e.getMessage());
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
			
		}
		return memlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		ArrayList<Member> memlist = dao.getMemList();
		
		// 조회
		for(Member m:dao.getMemList()) {
			System.out.print(m.getId()+"\t");
			System.out.print(m.getPw()+"\t");
			System.out.print(m.getName()+"\t");
			System.out.print(m.getAuth()+"\t");
			System.out.print(m.getPoint()+"\n");
		}

	}

}
