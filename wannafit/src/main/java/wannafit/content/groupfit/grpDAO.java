package wannafit.content.groupfit;

import java.sql.*;
import java.util.*;
import java.util.Date;

import wannafit.content.vo.*;

public class grpDAO {
	
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
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
		System.out.println("\n===== DATABASE에 연결되었습니다. =====\n");		
	}
	
	// 그룹핏 조회 메서드
	public ArrayList<Groupfit> grpList() {
		
		ArrayList<Groupfit> grplist = new ArrayList<Groupfit>();
		
		try {
			
			setCon();
			
			String sql = "SELECT * FROM Wanna_Groupfit ORDER BY gf_grpkey DESC";
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
					
			while(rs.next()) {
				grplist.add(new Groupfit (
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)
					));
			}
			
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
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	

		}
		return grplist;
	}
	
	// 그룹핏 등록
	public void insGrpfit(Groupfit ins) {
		
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Wanna_Groupfit VALUES('GF'||(gf_grpkey.nextval), ?, ?, ?, ?, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getWm_id());
			pstmt.setString(2, ins.getGf_name());
			pstmt.setString(3, ins.getGf_category());
			pstmt.setString(4, ins.getGf_info());
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}
	
	// 그룹핏 정보 수정
	public void uptGrpfit(Groupfit upt){
		
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "UPDATE Wanna_Groupfit\r\n"
					+ "	SET gf_name = ?,\r\n"
					+ "		gf_category = ?,\r\n"
					+ "		gf_info = ?\r\n"
					+ "	WHERE wm_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, upt.getGf_name());
			pstmt.setString(2, upt.getGf_category());
			pstmt.setString(3, upt.getGf_info());
			pstmt.setString(4, upt.getWm_id());
			
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}
	
	// 그룹핏 삭제 메서드
	public void delGrpfit(String wm_id) {
		
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "DELETE FROM Wanna_Groupfit WHERE wm_id = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, wm_id);
			
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close(); con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
			try {
				// 입력 중간 문제 발생, rollback처리..
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	}
	
	// 그룹핏 검색 메서드 (여러 항목)
	public ArrayList<Groupfit> schArryGrpfit(Groupfit sch) {
		
		ArrayList<Groupfit> schgrp = new ArrayList<Groupfit>();
		
		try {
			
			setCon();
			
			String sql = "SELECT gf.gf_name, gf.gf_category, wm.wm_id, gf.gf_date\r\n"
					+ "FROM Wanna_Member wm, Wanna_Groupfit gf\r\n"
					+ "WHERE wm.wm_id = gf.wm_id\r\n"
					+ "AND gf.gf_name LIKE '%'||?||'%'\r\n"
					+ "AND wm.wm_id LIKE '%'||?||'%'\r\n"
					+ "ORDER BY gf.gf_date DESC";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sch.getGf_name());
			pstmt.setString(2, sch.getWm_id());
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				schgrp.add(new Groupfit(
							rs.getString("gf_name"),
							rs.getString("gf_category"),
							rs.getString("wm_id"),
							rs.getDate("gf_date")
						));
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생 : " + e.getMessage());
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
		return schgrp;
	}

	// 그룹핏 검색 메서드 (단일)
	public Groupfit schGrpfit(String wm_id, String gf_name) {
		
		Groupfit grp = null;
		
		try {
			
			setCon();
			
			String sql = "SELECT gf.gf_name, gf.gf_category, wm.wm_info, wm.wm_id\\r\\n\"\r\n"
					+ "					+ \"FROM Wanna_Member wm, Wanna_Groupfit gf\\r\\n\"\r\n"
					+ "					+ \"WHERE wm.wm_id = gf.wm_id\\r\\n\"\r\n"
					+ "					+ \"AND gf.gf_name LIKE '%'||?||'%'\\r\\n\"\r\n"
					+ "					+ \"AND wm.wm_id LIKE '%'||?||'%'\\r\\n\"\r\n"
					+ "					+ \"ORDER BY gf.gf_date DESC";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, wm_id);
			pstmt.setString(2, gf_name);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				grp = new Groupfit(
							rs.getString("gf_name"),
							rs.getString("gf_category"),
							rs.getString("wm_info"),
							rs.getString("wm_id")
						);
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생 : " + e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외 발생 : " + e.getMessage());
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
		return grp;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		grpDAO gdao = new grpDAO();
		
		ArrayList<Groupfit> grplist = gdao.grpList();
		
		// 그룹핏 정보 등록 (테스트 완료)
		//gdao.insGrpfit(new Groupfit("0907테스트그룹3", "친목", "0907테스트입니다!"));
		
		// 그룹핏 정보 수정 (테스트 완료)
		//gdao.uptGrpfit(new Groupfit("himan01", "워너핏컴퍼니", "친목", "환영합니다!"));
		
		// 그룹핏 정보 삭제 (테스트 완료)
		//gdao.delGrpfit("himan07");
		
		// 그룹핏 정보 검색 리스트 (테스트 완료)
		for(Groupfit g:gdao.schArryGrpfit(new Groupfit("워","h"))) {
			System.out.print(g.getGf_name() + "\t");
			System.out.print(g.getGf_category() + "\t");
			System.out.print(g.getWm_id() + "\t");
			System.out.print(g.getGf_date() + "\n");
		}
		
		// 그룹핏 정보 조회 (테스트 완료)
//		for(Groupfit g:gdao.grpList()) {
//			System.out.print(g.getGf_grpkey() + "\t");
//			System.out.print(g.getWm_id() + "\t");
//			System.out.print(g.getGf_category() + "\t");
//			System.out.print(g.getGf_name() + "\t");
//			System.out.print(g.getGf_info() + "\t");
//			System.out.print(g.getGf_dateS() + "\n");
//		}

	}
	
}
