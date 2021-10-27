	package wannafit.content.partner.trainer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import wannafit.content.vo.Reserve;
import wannafit.content.vo.Trainer;

public class TrainerDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public TrainerDAO() {
		super();
	}
	
	public void setCon() throws SQLException {
		try {	
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속 성공!!");		
	}
	
	public String insertTr(Trainer tr) {
		String result = "입력실패";
		
		try {
			setCon();
			con.setAutoCommit(false);
			
			// 회원 필수정보
			// 회원 필수 정보 : 아이디(pk), 패스, 이메일, 닉네임, 번호, 회원구분, 신고횟수, 프로필이미지, 사업자정보번호(fk)
			String sql1 = "INSERT INTO Wanna_Member values(?, ?, ?, ?, "
					+ "?, 200, 0, ?, null)";
			
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, tr.getWm_id());
			pstmt.setString(2, tr.getWm_pass());
			pstmt.setString(3, tr.getWm_email());
			pstmt.setString(4, tr.getWm_nick());
			pstmt.setString(5, tr.getWm_tel());
			pstmt.setString(6, tr.getWm_imgSrc());
			pstmt.executeUpdate();		
			
			String sql2 = "INSERT INTO Wanna_Trainer values(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, tr.getWm_id());
			pstmt.setString(2, tr.getWt_gender());
			pstmt.setInt(3, tr.getWt_age());
			pstmt.setInt(4, tr.getWt_sports());
			pstmt.setString(5, tr.getWt_info());
			pstmt.executeUpdate();
			
			con.commit();
			result = "등록성공";
			System.out.println("[트레이너DAO] 회원가입 완료");
			
			pstmt.close(); con.close();

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반예외 발생 :"+e.getMessage());
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
		return result;
	}
}
