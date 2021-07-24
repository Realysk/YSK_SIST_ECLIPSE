package Project_SIST.Java.A05_Picmagine.upload;
// Project_SIST.Java.A05_Picmagine.upload.UPLDTO
import java.util.*;

import java.sql.*;

public class UPLDAO {

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
	
	
	// 게시물 조회 메서드
	public ArrayList<UPLDTO> uploadList() {
		
		ArrayList<UPLDTO> upllist = new ArrayList<UPLDTO>();
		
		try {
			
			setCon();
			
			String sql = "SELECT * FROM Picmagine_upload";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UPLDTO u = new UPLDTO();
				u.setTitle(rs.getString(1));
				u.setContents(rs.getString(2));
				u.setPic_file(rs.getString(3));
				u.setTag(rs.getString(4));
				u.setStoryname(rs.getString(5));
				u.setStorycontents(rs.getString(6));
				u.setStroytitle(rs.getString(7));
				upllist.add(u);
			}
						
			System.out.println("등록 된 게시물 데이터 수 : " + upllist.size());
			
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
		return upllist;
	}

	// 게시물 등록 메서드
	public void Uploaded(UPLDTO ins) {
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Picmagine_upload VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getTitle());
			pstmt.setString(2, ins.getContents());
			pstmt.setString(3, ins.getPic_file());
			pstmt.setString(4, ins.getTag());
			pstmt.setString(5, ins.getStoryname());
			pstmt.setString(6, ins.getStorycontents());
			pstmt.setString(7, ins.getStroytitle());
			
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
		
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> upllist = dao.uploadList();
		
		// 등록
//		dao.Uploaded(new UPLDTO());	
		
		// 조회
		for(UPLDTO u:dao.uploadList()) {
			System.out.print(u.getTitle() + "\t");
			System.out.print(u.getContents() + "\t");
			System.out.print(u.getPic_file() + "\t");
			System.out.print(u.getTag() + "\t");
			System.out.print(u.getStoryname() + "\t");
			System.out.print(u.getStorycontents() + "\t");
			System.out.print(u.getStroytitle() + "\n");
		}

	}

}