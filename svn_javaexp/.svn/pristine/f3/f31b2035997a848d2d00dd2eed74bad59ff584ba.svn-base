package javaexp.z99_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javaexp.a00_exp.z01_vo.Member;

public class A06_DmlExp {
	// 필드 선언.
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// 공통메서드.
	public void setCon() throws SQLException{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:XE";
		con = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속성공!");
	}
	public Member login(String id, String pass) {
		Member mem = null;
		try {
			setCon();
			String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// Member(int mno, String id, String pass, String name, String auth, int point, Date regdte) 
				mem = new Member(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getDate(7)
					);
			}
			rs.close(); pstmt.close();con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return mem;
	}
	public boolean login(Member m) {
		boolean hasMember=false;
		try {
			setCon();
			String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			rs = pstmt.executeQuery();
			hasMember = rs.next();
			rs.close(); pstmt.close();con.close();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return hasMember;
	}
	public void updateMember(Member m) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE MEMBER\r\n"
					+ "	SET id = ?,\r\n"
					+ "		pass = ?,\r\n"
					+ "		name = ?,\r\n"
					+ "		auth = ?,\r\n"
					+ "		point = ?,\r\n"
					+ "		regdte = to_date(?,'YYYY/MM/DD')\r\n"
					+ "WHERE mno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getAuth());
			pstmt.setInt(5, m.getPoint());
			pstmt.setString(6, m.getRegdteS());
			pstmt.setInt(7, m.getMno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();con.close();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A06_DmlExp dao = new A06_DmlExp();
		// Member(int mno, String id, String pass, String name, String auth, int point, String regdteS)
		dao.updateMember(new Member(1004,"angel(upt)","8888","김수현","관리자",2000,"2021/07/30"));
		
		/*
		Member m = dao.login("himan", "7777");
		if(m!=null)
		System.out.println(m.getName());
		System.out.println("회원 등록 여부:"
				+dao.login(new Member("higirl1","8888")));
		*/
		// ex) Member 테이블을 mno 기준으로 수정 처리하세요  1조		

	}

}
