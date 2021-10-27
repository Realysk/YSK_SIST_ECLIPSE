package wannafit.content.mypage.schedule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import wannafit.content.vo.*;



public class ScheduleDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public void setCon() throws SQLException {
		// 1. 드라이버 메모리 로딩..
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
	
	
	
	public void insetSchedule(Schedule ins){
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO Schedule01 values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getSnum());
			pstmt.setString(2, ins.getTitle());
			pstmt.setString(3, ins.getWork1());
			pstmt.setString(4, ins.getWork2());
			pstmt.setString(5, ins.getWork3());
			pstmt.setString(6, ins.getWork4());
			pstmt.setString(7, ins.getDate());
			pstmt.setString(8, ins.getComment());
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
	public ArrayList<Schedule> getSchedule(String Snum){
		ArrayList<Schedule> Schedulelist = new ArrayList<Schedule>();
		// 1. 연결 처리.
		try {
			setCon();
			// 2. 부서 정보 받아 sql 선언.
			String sql = "SELECT *FROM Schedule01 WHERE SNum= ?";
			pstmt = con.prepareStatement(sql);
			// 추후에 ?  갯수만큼 순서 1, 2, ..할당 처리.
			pstmt.setString(1, Snum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Schedulelist.add(new Schedule(
						rs.getString("Snum"),
						rs.getString("title"),
						rs.getString("work1"),
						rs.getString("work2"),
						rs.getString("work3"),
						rs.getString("work4"),
						rs.getString("date01"),
						rs.getString("comment01")
					));
			}
			// 5. 자원해제..	
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
		return Schedulelist;
	}
	
	public static void main(String[] args) {
		
		
		// TODO Auto-generated method stub
		ScheduleDao dao = new ScheduleDao();
		
	}

	
}
