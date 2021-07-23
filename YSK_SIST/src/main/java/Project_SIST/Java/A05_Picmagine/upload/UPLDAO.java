package Project_SIST.Java.A05_Picmagine.upload;

import java.util.*;

import java.sql.*;

public class UPLDAO {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
		System.out.println("===== DATABASE에 연결되었습니다. =====");		
	}
	
	
	// 게시물 조회 메서드
	public ArrayList<UPLDTO> getUplList() {
		ArrayList<UPLDTO> upllist = new ArrayList<UPLDTO>();
		try {
			setCon();
			String sql = "SELECT * FROM Picmagine_upload";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				upllist.add(new UPLDTO(
							rs.getString("title"),
							rs.getString("contents"),
							rs.getString("pic_file"),
							rs.getString("tag"),
							rs.getString("storyname"),
							rs.getString("storycontents"),
							rs.getString("stroytitle")
						));
			}
			
			/*
			 	private String title; // 게시물 제목
				private String contents; // 게시물 내용
				private String pic_file; // 파일명
				private String tag; // 태그
				private String storyname; // 스토리 제목
				private String storycontents; // 스토리 설명
				private String stroytitle; // 스토리 주제
			 */
			
			System.out.println("등록 된 게시물 데이터 수 : " + upllist.size());
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
		return upllist;
	}

	// 게시물 등록 메서드
	public void insertUPLList(UPLDTO ins) {
		try {
			setCon();
			
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO Picmagine_upload VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getTitle());
			pstmt.setString(2, ins.getContents());
			pstmt.setString(3, ins.getPic_file());
			pstmt.setString(4, ins.getTag());
			pstmt.setString(5, ins.getStoryname());
			pstmt.setString(6, ins.getStorycontents());
			pstmt.setString(7, ins.getStroytitle());
			
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
	
	// 게시물 수정 메서드
	public void uptUPLList(UPLDTO upt) {
		
		try {
			
			setCon();
			
			con.setAutoCommit(false);
			
//			String sql = "UPDATE emp02\r\n"
//					+ "	SET ename = ?,\r\n"
//					+ "		job = ?,\r\n"
//					+ "		mgr = ?,\r\n"
//					+ "		hiredate = TO_date(?,'YYYY/MM/DD'),\r\n"
//					+ "		sal = ?,\r\n"
//					+ "		comm = comm+?,\r\n"
//					+ "		deptno = ?\r\n"
//					+ "WHERE empno = ?";
			
			String sql = " ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, upt.getTitle());
			pstmt.setString(2, upt.getContents());
			pstmt.setString(3, upt.getPic_file());
			pstmt.setString(4, upt.getTag());
			pstmt.setString(5, upt.getStoryname());
			pstmt.setString(6, upt.getStorycontents());
			pstmt.setString(7, upt.getStroytitle());
			
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
	}
	
	public void deleteEmp(int empno) { // 삭제할 데이터유형 데이터 지정
		try {
			setCon();
			
			con.setAutoCommit(false);
			
//			String sql = "DELETE FROM emp02\r\n"
//					+ "WHERE empno = ?";
			
			String sql = " ";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, empno);
			
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
			System.out.println("일반 예외 발생:" + e.getMessage());
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
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UPLDAO dao = new UPLDAO();
		
		ArrayList<UPLDTO> upllist = dao.getUplList();

		// 등록
//		dao.insertUPLList(new UPLDTO()); // JSP 파일에서 입력한 데이터를 여기다 어떻게 넣는지...?
//		데이터를 입력받는 화면은 JSP 파일로 다시 만들어서 서로 연동하면 되는건가...?
		
		// 수정
//		dao.uptUPLList(new UPLDTO("","","","","","",""));
		
		// 삭제
//		dao.deleteUPLList(삭제할 데이터);
		 
		// 조회
		for(UPLDTO u:dao.getUplList()) {
			System.out.print(u.getTitle() + "\t");
			System.out.print(u.getContents() + "\t");
			System.out.print(u.getPic_file() + "\t");
			System.out.print(u.getTag() + "\t");
			System.out.print(u.getStoryname() + "\t");
			System.out.print(u.getStorycontents() + "\t");
			System.out.print(u.getStroytitle() + "\n");
		}

	}

}