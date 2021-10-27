package wannafit.content.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import wannafit.content.vo.User;

public class JoinDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public JoinDAO() {
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
	
	
	public boolean isIdCk(String id) {
		boolean isCheck = false;
		
		try {
			setCon();
			
			String sql = "SELECT * FROM Wanna_Member \r\n"
					+ "WHERE wm_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			isCheck = rs.next();
			System.out.println("[DAO] isCheck" + isCheck);
			System.out.println("[DAO] 아이디 중복확인 완료");
			
			rs.close(); pstmt.close(); con.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반예외 발생 : "+e.getMessage());
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
		
		return isCheck;
	}
	
	public boolean isNickCk(String nick) {
		boolean isCheck = false;
		
		try {
			setCon();
			
			String sql = "SELECT * FROM Wanna_Member \r\n"
					+ "where wm_nick = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			isCheck = rs.next();
			System.out.println("[DAO] 닉네임 중복확인 완료");
			
			rs.close(); pstmt.close(); con.close();
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
		return isCheck;
	}

	public String join(User user) {
		String result = "등록실패";
		
		try {
			
			setCon();
			con.setAutoCommit(false);
			
			// 회원 필수정보
			// 회원 필수 정보 : 아이디(pk), 패스, 이메일, 닉네임, 번호, 회원구분, 신고횟수, 프로필이미지, 사업자정보번호(fk)
			
			String sql1 = "INSERT INTO Wanna_Member values(?, ?, ?, ?, "
					+ "?, 100, 0, ?, null)";
			
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, user.getWm_id());
			pstmt.setString(2, user.getWm_pass());
			pstmt.setString(3, user.getWm_email());
			pstmt.setString(4, user.getWm_nick());
			pstmt.setString(5, user.getWm_tel());
			pstmt.setString(6, user.getWm_imgSrc());
			pstmt.executeUpdate();		
			
			// 일반 회원의 선택정보
			// 일반 회원의 선택정보 : 아이디(pk), 성별, 연령대, 운동분야유무, 가입이유
			String sql2 = "INSERT INTO Wanna_Mem_Com values(?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, user.getWm_id());
			pstmt.setString(2, user.getWm_gender());
			pstmt.setInt(3, user.getWm_age());
			pstmt.setInt(4, user.getWm_sports());
			pstmt.setString(5, user.getWm_result());
			pstmt.executeUpdate();
			
			con.commit();
			result = "등록성공";
			System.out.println("[DAO] 회원가입 완료");
			
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
