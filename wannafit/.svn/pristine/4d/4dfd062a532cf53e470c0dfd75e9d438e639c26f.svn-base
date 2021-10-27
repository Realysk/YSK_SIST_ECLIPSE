package wannafit.content.reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import wannafit.content.vo.Reserve;
import wannafit.content.vo.Reserve_Schedule;
import wannafit.content.vo.Trainer;

public class ReserveDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReserveDAO() {
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
	
	public ArrayList<Trainer> getTrainerList(Trainer tr) {
		ArrayList<Trainer> tList = new ArrayList<Trainer>();
		
		try {
			setCon();
			
			// 트레이너(Trainer) VO에 저장 
			String sql = "SELECT * \r\n"
					+ "FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws\r\n"
					+ "WHERE wm.wm_id = wt.wm_id\r\n"
					+ "AND wt.wt_sports = ws.ws_num\r\n"
					+ "AND wm.wm_nick LIKE '%' ||?||'%'\r\n"
					+ "AND ws.ws_title LIKE '%'||?||'%'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tr.getWm_nick());
			pstmt.setString(2, tr.getWsk_name());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tList.add(new Trainer(
							rs.getString("wm_id"),
							rs.getString("wm_nick"),
							rs.getString("wm_imgSrc"),
							rs.getString("ws_title"),
							rs.getString("wt_info")
				));
			}
			
			System.out.println("[ReserveDAO] 조회된 리스트크기:" + tList.size());
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생:"+e.getMessage());
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
		
		return tList;
	}
	
	public Trainer getTrainerInfo(String wm_id) {
		Trainer tr = null;
		
		try {
			setCon();
			
			String sql = "SELECT wm.wm_id, wm_nick, wm_tel, wm_imgSrc, \r\n"
					+ "	wt_gender, wt_age, wt_info, ws_title\r\n"
					+ "FROM Wanna_Member wm, Wanna_Trainer wt, Wanna_Sport_Group ws\r\n"
					+ "WHERE wm.wm_id = wt.wm_id\r\n"
					+ "AND wt.wt_sports = ws.ws_num\r\n"
					+ "AND wm.wm_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wm_id);
			rs = pstmt.executeQuery();
			
			//String wm_id, String wm_nick, int wm_tel, String wm_imgSrc, String wt_gender, int wt_age,
			//String wt_info, String wsk_name
			if(rs.next()) {
				tr = new Trainer(rs.getString(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getInt(6),
								rs.getString(7),
								rs.getString(8)
							);
				System.out.println("[ReserveDB] 트레이너상세 조회완료");
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생~~"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생:"+e.getMessage());
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
		return tr;
	}
	
	
	public ArrayList<Reserve_Schedule> getSchedule(String wm_id){
		ArrayList<Reserve_Schedule> scdList = new ArrayList<Reserve_Schedule>();
		
		System.out.println(wm_id);
		try {
			setCon();

			// 트레이너의 아이디를 이용해 예약일정 추출
			String sql = "SELECT wrs_num, wrs_title, "
					+ "to_char(wrs_date, 'YYYY-MM-DD') wrs_day,\r\n"
					+ "	to_char(wrs_date, 'HH24:MI') wrs_time, "
					+ "wrs_price, wrs_step, wm_id\r\n"
					+ "FROM Wanna_Reserve_Schedule \r\n"
					+ "WHERE wm_id = ?\r\n"
					+ "AND wrs_step = '예약대기'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wm_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				scdList.add(new Reserve_Schedule(		
						rs.getString("wrs_num"),
						rs.getString("wrs_title"),
						rs.getString("wrs_day"),
						rs.getString("wrs_time"),
						rs.getInt("wrs_price"),
						rs.getString("wrs_step"),
						rs.getString("wm_id")));
			}
			System.out.println("[ReserveDB] 예약일정 조회완료");
			
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
		return scdList;
	}
	
	// 날짜 확인용
	public Date getScheduleDate(String wm_id){
		Date day = new Date();
		
		System.out.println(wm_id);
		try {
			setCon();

			// 트레이너의 아이디를 이용해 예약일정 추출
			String sql = "SELECT wrs_date \r\n"
					+ "FROM Wanna_Reserve_Schedule \r\n"
					+ "WHERE wm_id = ?\r\n";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wm_id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				day = rs.getDate(1);
			}
			
			System.out.println("[ReserveDB] 예약날짜 확인");
			
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
		return day;
	}
	
	public boolean insertReserve(Reserve inrev) {
		boolean isResult = false;
		
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Wanna_Reserve values"
					+ "('wr'||lpad(wanna_Reserve_seq.nextval, "
					+ "4, 0), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, inrev.getWr_content());
			pstmt.setString(2, inrev.getWr_kind());
			pstmt.setInt(3, inrev.getWr_price());
			pstmt.setString(4, inrev.getWr_bank());
			pstmt.setString(5, inrev.getWr_code());
			pstmt.setString(6, inrev.getWr_expDate());
			pstmt.setString(7, inrev.getWr_birth());
			pstmt.setInt(8, inrev.getWr_month());
			pstmt.setString(9, inrev.getWrs_num());
			pstmt.setString(10, inrev.getWm_id());
			pstmt.executeUpdate();
			
			
			// 예약일정의 진행단계 업데이트
			String sql2 = "UPDATE Wanna_Reserve_Schedule "
					+ "SET wrs_step = '예약완료' WHERE wrs_num = ?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, inrev.getWrs_num());
			pstmt.executeUpdate();
			
			isResult = true;
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("일반예외 발생 : "+e.getMessage());
		} finally {
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
		return isResult;
	}
}
