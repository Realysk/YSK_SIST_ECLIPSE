package wannafit.content.mapfit;

import java.sql.*;
import java.util.*;
import java.util.Date;

import wannafit.content.vo.*;

// wannafit.content.mapfit.mapDAO
public class mapDAO {
	Connection con;
	Statement stmt;
	ResultSet rs;

	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("\n -데이터 베이스 연결-\n");
	}

	public ArrayList<map_VO> getGymList() {
		ArrayList<map_VO> mList = new ArrayList<map_VO>();
		try {
			
			setCon();
			String sql = "SELECT * \r\n"
					+ "FROM Wanna_mapfit";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				mList.add(new map_VO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4)));
			}
			
			System.out.println("[맵핏DAO] 헬스장조회 성공");
			
		} catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("SQL 예외 발생 : " + e.getMessage());
	      } catch (Exception e) {
	        System.out.println("일반예외 발생 : " + e.getMessage());
	      } finally {
	        if (rs != null) {
	          try {
	            rs.close();
	          } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	          }
	        }
	        if (stmt != null) {
	          try {
	            stmt.close();
	          } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	          }
	        }
	        if (con != null) {
	          try {
	            con.close();
	          } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	          }
	        }
	      }
		return mList;
	}
}