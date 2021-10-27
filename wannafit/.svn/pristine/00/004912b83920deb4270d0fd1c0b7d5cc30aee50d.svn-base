package wannafit.content.mypage.mytr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import wannafit.content.vo.Reserve;
import wannafit.content.vo.Reserve_Schedule;

public class MyTrDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MyTrDAO() {
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
		System.out.println("[TrainerDB] 접속 성공");		
	}
	
	// 예약내역 조회
	public ArrayList<Reserve> getReserveList(String id){
		ArrayList<Reserve> revList = new ArrayList<Reserve>();
		
		try {
			setCon();
			
			String sql = "SELECT wr.*, wrs_title, to_char(wrs_date, 'YYYY-MM-DD') wrs_day, \r\n"
					+ "	to_char(wrs_date, 'HH24:MI') wrs_time, wrs_step\r\n"
					+ "FROM Wanna_Reserve wr, Wanna_Reserve_Schedule wrs\r\n"
					+ "WHERE wr.wrs_num = wrs.wrs_num\r\n"
					+ "AND wrs.wm_id = ?\r\n"
					+ "AND wrs.wrs_step = '예약완료'\r\n"
					+ "ORDER BY wr_num asc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			//Reserve(String wr_num, String wr_content, String wr_kind, int wr_price, String wr_bank, String wr_code,
			//		String wr_expDate, String wr_birth, int wr_month, String wrs_num, String wm_id, String wrs_title,
			//		String wrs_day, String wrs_time, String wrs_step) 
			
			while(rs.next()){
				revList.add(new Reserve(rs.getString(1), 
										rs.getString(2),
										rs.getString(3), 
										rs.getInt(4),
										rs.getString(5), 
										rs.getString(6),
										rs.getString(7), 
										rs.getString(8),
										rs.getInt(9), 
										rs.getString(10),
										rs.getString(11), 
										rs.getString(12),
										rs.getString(13), 
										rs.getString(14),
										rs.getString(15)));
			}
			
			System.out.println("[트레이너DAO] 예약내역 조회 :" + revList.size());
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생 : "+e.getMessage());
		} finally {
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
		return revList;
	}
	
	// 예약일정 조회
	public ArrayList<Reserve_Schedule> getScheduleList(String id){
		ArrayList<Reserve_Schedule> schList = new ArrayList<Reserve_Schedule>();
		
		try {
			setCon();
			
			String sql = "SELECT wrs_num, wrs_title, "
					+ "to_char(wrs_date, 'YYYY') wrs_year, \r\n"
					+ "	to_char(wrs_date, 'MM') wrs_mon, "
					+ "to_char(wrs_date, 'DD') wrs_nday, \r\n"
					+ "	to_char(wrs_date, 'HH24') wrs_hour, "
					+ "to_char(wrs_date, 'MI') wrs_min, \r\n"
					+ "	wrs_price, wrs_step, wm_id\r\n"
					+ "FROM Wanna_Reserve_Schedule \r\n"
					+ "WHERE wm_id = ?\r\n"
					+ "AND wrs_step = '예약대기'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			//(String wrs_num, String wrs_title, String wrs_year, String wrs_mon, String wrs_nday,
			//		String wrs_hour, String wrs_min, int wrs_price, String wrs_step, String wm_id)
			
			while(rs.next()){
				schList.add(new Reserve_Schedule(
										rs.getString(1), 
										rs.getString(2),
										rs.getString(3), 
										rs.getString(4),
										rs.getString(5), 
										rs.getString(6),
										rs.getString(7),
										rs.getInt(8),
										rs.getString(9),
										rs.getString(10)));
			}
			
			System.out.println("[트레이너DAO] 예약일정 조회 :" + schList.size());
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생 : "+e.getMessage());
		} finally {
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
		return schList;
	}
	
	public void detailSchedule(String wrs_num) {
		Reserve_Schedule rSch = null;
		try {
			setCon();
			
			String sql = "";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wrs_num);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				rSch = new Reserve_Schedule(
						
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insSchedule(Reserve_Schedule ins){
		try {
			
			setCon();
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Wanna_Reserve_Schedule VALUES\r\n"
					+ "('wrs'||lpad(Wanna_Reserve_Schedule_seq.nextval, 4, 0), \r\n"
					+ "?, to_date(?, 'YYYY-MM-DD HH24:MI'), ?, '예약대기', ?)";

			//public Reserve_Schedule(String wrs_num, String wrs_title, String wrs_dateS, 
			//		int wrs_price, String wrs_step, String wm_id)

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getWrs_title());
			pstmt.setString(2, ins.getWrs_dateS());
			pstmt.setInt(3, ins.getWrs_price());
			pstmt.setString(4, ins.getWm_id());
			pstmt.executeUpdate();
			
			System.out.println("[TrainerDB] 예약일정 추가");
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
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
	}
	
	public void uptSchedule(Reserve_Schedule upt){
		try {
			
			setCon();
			con.setAutoCommit(false);
			
			String sql = "UPDATE Wanna_Reserve_Schedule \r\n"
					+ "SET wrs_title = ?, wrs_date = to_date"
					+ "(?, 'YYYY-MM-DD HH24:MI'), \r\n"
					+ "wrs_price = ?, wrs_step = ? \r\n"
					+ "WHERE wrs_num = ? AND wm_id = ?";
			
			//public Reserve_Schedule(String wrs_num, String wrs_title, String wrs_dateS, 
			//		int wrs_price, String wrs_step, String wm_id)
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getWrs_title());
			pstmt.setString(2, upt.getWrs_dateS());
			pstmt.setInt(3, upt.getWrs_price());
			pstmt.setString(4, upt.getWrs_step());
			pstmt.setString(5, upt.getWrs_num());
			pstmt.setString(6, upt.getWm_id());
			pstmt.executeUpdate();
			
			System.out.println("[TrainerDB] 예약일정 수정");
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
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
	}
	
	public void delSchedule(String wrs_num, String wm_id){
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "DELETE FROM Wanna_Reserve_Schedule \r\n"
					+ "WHERE wrs_num = ? AND wm_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wrs_num);
			pstmt.setString(2, wm_id);
			pstmt.executeUpdate();

			System.out.println("[TrainerDB] 예약일정 삭제");
			con.commit();
			pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
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
