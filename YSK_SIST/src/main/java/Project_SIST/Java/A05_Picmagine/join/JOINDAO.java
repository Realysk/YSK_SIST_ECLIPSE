package Project_SIST.Java.A05_Picmagine.join;

import java.sql.*;
import java.util.*;

public class JOINDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// DB 연결
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
	
	// 회원 정보 조회 메서드
	public ArrayList<JOINDTO> memberList() {
		
		ArrayList<JOINDTO> jlist = new ArrayList<JOINDTO>();
		
		try {
			
			setCon();
			
			String sql = "SELECT * FROM Picmagine_join ORDER BY memcode DESC";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
					
			while(rs.next()) {
				JOINDTO j = new JOINDTO();
				j.setMemcode(rs.getString(1));
				j.setName(rs.getString(2));
				j.setId(rs.getString(3));
				j.setPw(rs.getString(4));
				j.setTel(rs.getString(5));
				j.setEmail(rs.getString(6));
				jlist.add(j);
			}
						
			System.out.println("등록 된 회원 정보 수 : " + jlist.size());
			
			rs.close(); pstmt.close(); con.close();
			
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
		return jlist;
	}
	
	// 회원 등록 메서드
	public void Joined(JOINDTO ins) {
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Picmagine_join VALUES('PM' || pic_memcode.nextval, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			// '?' 갯수만큼 아래에 순서대로 할당
			
//			pstmt.setString(1, ins.getMemcode()); // 
			pstmt.setString(1, ins.getName());
			pstmt.setString(2, ins.getId());
			pstmt.setString(3, ins.getPw());
			pstmt.setString(4, ins.getTel());
			pstmt.setString(5, ins.getEmail());
			
			pstmt.executeUpdate();
			
			con.commit();
			
			pstmt.close(); con.close(); rs.close();
			
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
	
	// ID 찾기
	public ArrayList<JOINDTO> schID(JOINDTO sch) {
		
		ArrayList<JOINDTO> schid = new ArrayList<JOINDTO>();
			try {
				setCon();

				String sql = "SELECT * FROM Picmagine_join WHERE id LIKE '%'||'" + sch.getId() + "'||'%' ORDER BY memcode DESC";
				
				pstmt = con.prepareStatement(sql);
				
				// 추후에 ? 갯수만큼 순서 1, 2, ... 할당 처리
//				pstmt.setString(1, "%" + id + "%");
				
				rs = pstmt.executeQuery(sql);
				
				while(rs.next()) {
					schid.add(new JOINDTO(
							rs.getString("memcode"),
							rs.getString("name"),
							rs.getString("id"),
							rs.getString("pw"),
							rs.getString("tel"),
							rs.getString("email")
						));
				}

				rs.close(); pstmt.close(); con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
				System.out.println("SQL 예외 : " + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 : " + e.getMessage());
				
			} finally {
				
				if(rs != null) { try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(pstmt != null) { try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(con != null) { try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				
			}

		return schid;
	}
	
	public JOINDTO getschID(String id) {
		JOINDTO getid = null;
		
		try {
			setCon();
			String sql = "SELECT * FROM Picmagine_join WHERE id LIKE = " + id;
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			if(rs.next()) {
				getid = new JOINDTO(
							rs.getString("memcode"),
							rs.getString("name"),
							rs.getString("id"),
							rs.getString("pw"),
							rs.getString("tel"),
							rs.getString("email")
						);
			}
			rs.close(); con.close(); pstmt.close();
			
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
		return getid;
	}

	// ID 찾기
		public ArrayList<JOINDTO> schPW(JOINDTO sch) {
			
			ArrayList<JOINDTO> schid = new ArrayList<JOINDTO>();
				try {
					setCon();
	
					String sql = "SELECT * FROM Picmagine_join WHERE pw LIKE '%'||'" + sch.getPw() + "'||'%' ORDER BY memcode DESC";
					
					pstmt = con.prepareStatement(sql);
					
					// 추후에 ? 갯수만큼 순서 1, 2, ... 할당 처리
	//				pstmt.setString(1, "%" + id + "%");
					
					rs = pstmt.executeQuery(sql);
					
					while(rs.next()) {
						schid.add(new JOINDTO(
								rs.getString("memcode"),
								rs.getString("name"),
								rs.getString("id"),
								rs.getString("pw"),
								rs.getString("tel"),
								rs.getString("email")
							));
					}
	
					rs.close(); pstmt.close(); con.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					
					e.printStackTrace();
					System.out.println("SQL 예외 : " + e.getMessage());
					
				} catch(Exception e) {
					
					System.out.println("일반 예외 : " + e.getMessage());
					
				} finally {
					
					if(rs != null) { try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} }
					if(pstmt != null) { try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} }
					if(con != null) { try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} }
					
				}
	
			return schid;
		}

	public JOINDTO getschPW(String pw) {
				JOINDTO getid = null;
				
				try {
					setCon();
					String sql = "SELECT * FROM Picmagine_join WHERE pw LIKE = " + pw;
					
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery(sql);
					
					if(rs.next()) {
						getid = new JOINDTO(
									rs.getString("memcode"),
									rs.getString("name"),
									rs.getString("id"),
									rs.getString("pw"),
									rs.getString("tel"),
									rs.getString("email")
								);
					}
					rs.close(); con.close(); pstmt.close();
					
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
				return getid;
			}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		JOINDAO dao = new JOINDAO();
		ArrayList<JOINDTO> jlist = dao.memberList();
				
		// 등록
//		dao.Joined(new JOINDTO("PM1004", "마길동", "makil1", "1020", "010-3948-0000", "makil@gmail.com"));
				
//		// ID 찾기
//		for(JOINDTO jo:dao.schID(new JOINDTO())) {
//			System.out.print(jo.getMemcode() + "\t");
//			System.out.print(jo.getName() + "\t");
//			System.out.print(jo.getId() + "\t");
//			System.out.print(jo.getPw() + "\t");
//			System.out.print(jo.getTel() + "\t");
//			System.out.print(jo.getEmail() + "\t");
//		}
//		
//		JOINDTO j = dao.getschID("hong");
//		
//		if(j != null) {
//			
//			System.out.println(j.getMemcode() + "\t");
//			System.out.println(j.getName() + "\t");
//			System.out.println(j.getId() + "\t");
//			System.out.println(j.getPw() + "\t");
//			System.out.println(j.getTel() + "\t");
//			System.out.print(j.getEmail() + "\n");
//			
//			System.out.println(j.getName() + "님의 ID는 " + j.getId() + " 입니다.");
//			
//		} else {
//			System.out.println("해당 회원 정보가 없습니다.");
//		}
		
		// PW 찾기
//		for(JOINDTO jo:dao.schPW(new JOINDTO())) {
//			System.out.print(jo.getMemcode() + "\t");
//			System.out.print(jo.getName() + "\t");
//			System.out.print(jo.getId() + "\t");
//			System.out.print(jo.getPw() + "\t");
//			System.out.print(jo.getTel() + "\t");
//			System.out.print(jo.getEmail() + "\t");
//		}
//		
//		JOINDTO j = dao.getschPW("hong");
//		
//		if(j != null) {
//			
//			System.out.println(j.getMemcode() + "\t");
//			System.out.println(j.getName() + "\t");
//			System.out.println(j.getId() + "\t");
//			System.out.println(j.getPw() + "\t");
//			System.out.println(j.getTel() + "\t");
//			System.out.print(j.getEmail() + "\n");
//			
//			System.out.println(j.getName() + "님의 PW는 " + j.getPw() + " 입니다.");
//			
//		} else {
//			System.out.println("해당 회원 정보가 없습니다.");
//		}
		
		// 조회
		for(JOINDTO j:dao.memberList()) {
			System.out.print(j.getMemcode() + "\t"); 
			System.out.print(j.getName() + "\t"); 
			System.out.print(j.getId() + "\t"); 
			System.out.print(j.getPw() + "\t"); 
			System.out.print(j.getTel() + "\t"); 
			System.out.print(j.getEmail() + "\n"); 
		}

	}

}