package wannafit.content.partner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import wannafit.content.vo.FitnessCenter_VO;
import wannafit.content.vo.Groupfit;

public class fitnessCenterDAO {
	Connection con;
	PreparedStatement pstmt;
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

	// 헬스장 회원 정보 조회

public ArrayList<FitnessCenter_VO> fc(){
	ArrayList<FitnessCenter_VO> fclist = new ArrayList<FitnessCenter_VO>();
	
	return fclist;
	
/*	try {
		setCon();		
		String sql = "SELECT * FROM Wanna_Groupfit ORDER BY gf_grpkey DESC";	
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			fclist.add(new FitnessCenter_VO(
					rs.getString(1)));
		}catch{
	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
		} 

}
	} */
}

public ArrayList<FitnessCenter_VO> FcList() {
	// TODO Auto-generated method stub
	return null;
}
}
