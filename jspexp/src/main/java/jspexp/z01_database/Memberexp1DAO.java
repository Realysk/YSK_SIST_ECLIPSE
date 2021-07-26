package jspexp.z01_database;

import java.sql.*;
import java.util.*;

import jspexp.z02_vo.*;

public class Memberexp1DAO {
	
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
	public ArrayList<Memberexp1> getMemList() {
		ArrayList<Memberexp1> memlist = new ArrayList<Memberexp1>();
		try {
			setCon();
			String sql = "SELECT * FROM memberexp1 ORDER BY mno_exp1 DESC";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				memlist.add(new Memberexp1(
							rs.getString("mno_exp1"),
							rs.getString("id"),
							rs.getString("pass"),
							rs.getString("name"),
							rs.getString("point"),
							rs.getString("auth")
						));
			}
			System.out.println("ArrayList의 데이터 갯수 : " + memlist.size());
			rs.close(); stmt.close(); con.close();
			
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
		
		Memberexp1DAO dao = new Memberexp1DAO();
		ArrayList<Memberexp1> memlist = dao.getMemList();
		
		// 조회
		for(Memberexp1 m:dao.getMemList()) {
			System.out.print(m.getMno_exp1()+"\t");
			System.out.print(m.getId()+"\t");
			System.out.print(m.getPass()+"\t");
			System.out.print(m.getName()+"\t");
			System.out.print(m.getPoint()+"\t");
			System.out.print(m.getAuth()+"\n");
		}

	}

}
