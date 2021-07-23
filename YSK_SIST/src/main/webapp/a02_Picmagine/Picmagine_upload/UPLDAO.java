package Project_SIST.Java.A05_Picmagine.upload;
// Project_SIST.Java.A05_Picmagine.upload.UPLDAO
import java.util.*;
import java.sql.*;

public class UPLDAO {

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
	
	
	// 게시물 조회 메서드
	public ArrayList<UPLDTO> getUplList() {
		ArrayList<UPLDTO> upllist = new ArrayList<UPLDTO>();
		try {
			setCon();
			String sql = "SELECT * FROM Picmagine_upload";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				upllist.add(new UPLDTO(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6),
							rs.getString(7)
						));
			}
			
			/*
			 	private String title; // 게시물 제목
				private String contents; // 게시물 내용
				private String pic_file; // 파일명
				private String tag; // 태그
				private String storyname; // 스토리 제목
				private String storycontents; // 스토리 설명
				private String stroytitle; // 스토리 주제
			 */
			
			System.out.println("등록 된 게시물 데이터 수 : " + upllist.size());
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
		return upllist;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> upllist = dao.getUplList();
		
		// 조회
		for(UPLDTO u:dao.getUplList()) {
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