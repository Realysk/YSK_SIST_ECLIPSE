package Project_SIST.Java.A05_Picmagine.upload;
// Project_SIST.Java.A05_Picmagine.upload.UPLDTO
import java.util.*;

import java.sql.*;

public class UPLDAO {

	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
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
			
			String sql = "SELECT * FROM artworks ORDER BY artno DESC";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UPLDTO u = new UPLDTO();
				u.setArtno(rs.getString(1));
				u.setArtcategory(rs.getString(2));
				u.setArtimgtitle(rs.getString(3));
				u.setArttitle(rs.getString(4));
				u.setArtcontent(rs.getString(5));
				u.setTag(rs.getString(6));
				u.setArtdate(rs.getString(7));
				u.setArtpicauth(rs.getString(8));
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
	public UPLDTO Uploaded(UPLDTO ins) {
		UPLDTO u = new UPLDTO();
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			// auth = 작가로 처리
			String sql = "INSERT INTO artworks VALUES('wk'||artno.nextval, ?, ?, ?, ?, ?, sysdate, '작가')";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getArtcategory());
			pstmt.setString(2, ins.getArtimgtitle());
			pstmt.setString(3, ins.getArttitle());
			pstmt.setString(4, ins.getArtcontent());
			pstmt.setString(5, ins.getTag());
//			pstmt.setString(6, ins.getArtpicauth()); // 작가는 기본으로 주어지므로 주석 처리
			
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close();
			
			// 위에서 게시물 등록 후 커밋 후에 게시물 조회 리스트까지 같이 출력
			String sql2 = "SELECT * FROM artworks ORDER BY artno DESC";
			
//			pstmt = con.prepareStatement(sql2);
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql2);
			
			if(rs.next()) {
//				UPLDTO u = new UPLDTO();
				u.setArtno(rs.getString(1));
				u.setArtcategory(rs.getString(2));
				u.setArtimgtitle(rs.getString(3));
				u.setArttitle(rs.getString(4));
				u.setArtcontent(rs.getString(5));
				u.setTag(rs.getString(6));
				u.setArtdate(rs.getString(7));
				u.setArtpicauth(rs.getString(8));
				// upllist.add(u);
			} 
			
//			System.out.println("번호확인" + u.getArtno());
			
			stmt.close(); pstmt.close(); con.close();
			
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
		return u;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> upllist = dao.uploadList();
		
		// 등록
//		dao.Uploaded(new UPLDTO("", "", "", "", "", "", "", ""));
		
		// 조회
		for(UPLDTO u:dao.uploadList()) {
			System.out.print(u.getArtno() + "\t");
			System.out.print(u.getArtcategory() + "\t");
			System.out.print(u.getArtimgtitle() + "\t");
			System.out.print(u.getArttitle() + "\t");
			System.out.print(u.getArtcontent() + "\t");
			System.out.print(u.getTag() + "\t");
			System.out.print(u.getArtdate() + "\t");
			System.out.print(u.getArtpicauth() + "\n");
		}

	}

}