package jspexp.z01_database;

import java.sql.*;
import java.util.*;

import jspexp.z02_vo.*;

public class StudentDAO {
	
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
	public ArrayList<Studentexp1> getStuList() {
		ArrayList<Studentexp1> stulist = new ArrayList<Studentexp1>();
		try {
			setCon();
			String sql = "SELECT * FROM Studentexp1";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				stulist.add(new Studentexp1(
							rs.getInt("sno"),
							rs.getString("name"),
							rs.getInt("kor"),
							rs.getInt("eng"),
							rs.getInt("math")
						));
			}
			System.out.println("ArrayList의 데이터 갯수 : " + stulist.size());
			rs.close(); stmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생~~"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생:"+e.getMessage());
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
		return stulist;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		StudentDAO dao = new StudentDAO();
		ArrayList<Studentexp1> stulist = dao.getStuList();
		
		// 조회
		for(Studentexp1 s:dao.getStuList()) {
			System.out.print(s.getSno()+"\t");
			System.out.print(s.getName()+"\t");
			System.out.print(s.getKor()+"\t");
			System.out.print(s.getEng()+"\t");
			System.out.print(s.getEng()+"\n");
		}
		
	}
}
