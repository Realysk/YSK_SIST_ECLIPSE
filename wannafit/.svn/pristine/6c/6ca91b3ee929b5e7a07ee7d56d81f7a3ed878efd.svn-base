package wannafit.content.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import wannafit.content.vo.User;

// 회원관리 DAO
// 주소 WANNAFIT.user.UserDAO
public class UserDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public User login(String id, String pass) {
		User user = null;
		boolean isLogin = false;
				
		try {
			setCon();
			
			String sql = "SELECT * FROM Wanna_Member wm, Wanna_Member_Group wmg\r\n"
					+ "WHERE wm.wm_usrgroup = wmg.wm_usrgroup\r\n"
					+ "AND wm_id = ? \r\n"
					+ "AND wm_pass = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			// 일단 로그인정보만
			if(rs.next()) {
				isLogin = true;
				user = new User(rs.getString(1),
								rs.getString(2),
								rs.getString(11));
			}
			
			System.out.println(isLogin?"로그인 성공":"로그인 실패");
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반예외 발생  "+e.getMessage());
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
		return user;
	}
	
	
	// 회원정보 조회 (전체 회원)
	public ArrayList<User> getMemberList(){
		ArrayList<User> memlist = new ArrayList<User>();
		try {
			setCon();
			String sql = "SELECT wm_id, wm_pass, wm_email, wm_nick, wm_tel FROM Wanna_Member";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				memlist.add(new User(
							rs.getString("wm_id"),
							rs.getString("wm_pass"),
							rs.getString("wm_email"),
							rs.getString("wm_nick"),
							rs.getString("wm_tel")
						));
			}
			System.out.println("ArrayList의 데이터 갯수:"+memlist.size());
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
		return memlist;
	}
	
	// 회원정보 조회 (단일)
	public User getMember(String wm_id){
		User mem = null;
		try {
			setCon();
			String sql = "SELECT wm_id, wm_pass, wm_email, wm_nick, wm_tel FROM Wanna_Member WHERE wm_id = ?";
					// WHERE id = "+id; ==> WHERE id = '"+id+"'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wm_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				mem = new User(
							rs.getString("wm_id"),
							rs.getString("wm_pass"),
							rs.getString("wm_email"),
							rs.getString("wm_nick"),
							rs.getString("wm_tel")
							);
			}
			rs.close(); pstmt.close(); con.close();
			
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
		return mem;
	}
	
	public void uptMember(User upt){
		try {
			
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE Wanna_Member\r\n"
					+ "		SET wm_pass = ?,\r\n"
					+ "			wm_email = ?,\r\n"
					+ "			wm_nick = ?,\r\n"
					+ "			wm_tel = ?\r\n"
					+ "		WHERE wm_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getWm_pass());
			pstmt.setString(2, upt.getWm_email());
			pstmt.setString(3, upt.getWm_nick());
			pstmt.setString(4, upt.getWm_tel());
			pstmt.setString(5, upt.getWm_id());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생~~"+e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}
	public void delMember(String wm_id){
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "DELETE FROM Wanna_Member WHERE wm_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wm_id);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생~~"+e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}		
}
