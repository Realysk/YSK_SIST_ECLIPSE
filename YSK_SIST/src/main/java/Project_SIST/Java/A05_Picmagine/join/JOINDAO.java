package Project_SIST.Java.A05_Picmagine.join;

import java.sql.*;
import java.util.*;

public class JOINDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
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
		System.out.println("\n===== DATABASE에 연결되었습니다. =====\n");		
	}
	
	// 회원정보 조회 메서드
	public ArrayList<JOINDTO> memberList() {
		
		ArrayList<JOINDTO> jolist = new ArrayList<JOINDTO>();
		
		try {
			
			setCon();
			
			String sql = "SELECT * FROM Picmagine_join";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JOINDTO j = new JOINDTO();
				j.setMemcode(rs.getString(1));
				j.setName(rs.getString(1));
				j.setId(rs.getString(1));
				j.setPw(rs.getString(1));
				j.setTel(rs.getString(1));
				j.setEmail(rs.getString(1));
				jolist.add(j);
			}
						
			System.out.println("등록 된 회원 정보 수 : " + jolist.size());
			
//			rs.close(); pstmt.close(); con.close();
			
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
		return jolist;
	}
	
	// 회원 등록 메서드
	public void Joined(JOINDTO ins) {
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Picmagine_join VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getMemcode());
			pstmt.setString(2, ins.getName());
			pstmt.setString(3, ins.getId());
			pstmt.setString(4, ins.getPw());
			pstmt.setString(5, ins.getTel());
			pstmt.setString(6, ins.getEmail());
			
			pstmt.executeUpdate();
			
			con.commit();
			
//			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		JOINDAO jdao = new JOINDAO();
		ArrayList<JOINDTO> jolist = jdao.memberList();
		
		// 등록
//		jdao.Joined(new JOINDTO());
		
		// 조회
		for(JOINDTO j:jdao.memberList()) {
			System.out.println(j.getMemcode() + "\t"); 
			System.out.println(j.getName() + "\t"); 
			System.out.println(j.getId() + "\t"); 
			System.out.println(j.getPw() + "\t"); 
			System.out.println(j.getTel() + "\t"); 
			System.out.println(j.getEmail() + "\n"); 
		}

	}

}