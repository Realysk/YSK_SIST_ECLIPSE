package jspexp.z01_database;
// jspexp.z01_database.A05_PreparedDao
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jspexp.z02_vo.Emp;

public class A05_PreparedDao {

		private Connection con;
		private Statement stmt;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public void setCon() throws SQLException {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String info = "jdbc:oracle:thin:@localhost:1521:xe"; // 개인 DB
			con = DriverManager.getConnection(info,"scott","tiger"); // 개인 DB 로그인 정보
			System.out.println("접속 성공!");
		}
		
		public ArrayList<Emp> getEmpList() {
			ArrayList<Emp> emplist = new ArrayList<Emp>();
			
			try {
				setCon();

				String sql = "SELECT * \r\n"
						+ "FROM emp02";

				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				int rowCnt2 = 1;
				System.out.println("번호\t부서번호\t사원번호\t사원명\t직책\t관리자번호\t입사일\t급여\tcomm\t부서번호");
			
				while(rs.next()) {
					System.out.print(rowCnt2++ + "\t");

					System.out.print(rs.getInt(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
					System.out.print(rs.getString(3) + "\t");
					System.out.print(rs.getInt(4) + "\t");
					System.out.print(rs.getDate(5) + "\t");
					System.out.print(rs.getDouble(6) + "\t");
					System.out.print(rs.getDouble(7) + "\t");
					System.out.print(rs.getInt(8) + "\n");
				
					emplist.add(new Emp(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
							));
					}
					System.out.println("ArrayList의 데이터 수량 : " + emplist.size());
				
				rs.close(); stmt.close(); con.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL 예외 발생!!" + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 발생!!" + e.getMessage());
				
			} finally {
				
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			return emplist;
		}

		// 조건을 받아서 데이터 처리
		/*
		 # PreparedStatement 객체 활용
		 */
		public ArrayList<Emp> emplist2(int deptno) {
			
			ArrayList<Emp> list = new ArrayList<Emp>();
			// 1. 연결 처리
				try {
					setCon();
					
					// 2. 부서 정보 받아 sql 선언
					String sql = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE deptno = ?";
					
					pstmt = con.prepareStatement(sql);
					// 추후에 ? 갯수만큼 순서 1, 2, ... 할당 처리
					pstmt.setInt(1, deptno);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						list.add(new Emp(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
							));
					}
					
					// 5. 자원 해제
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
					if(stmt != null) { try {
						stmt.close();
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

			return list;
		}
		
		public ArrayList<Emp> emplist3(int deptno) {
			
			ArrayList<Emp> list = new ArrayList<Emp>();
			// 1. 연결 처리
				try {
					setCon();
					
					// 2. 부서 정보 받아 sql 선언
					String sql = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE deptno = " + deptno;
					
					/*
					 ex) 문자열을 받으면 ''
					 	WHERE ename='CLARK';
					 */
					/*
					String name = "CLARK";
					String sql2 = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE ename = '" + name + "' ";
					*/

					stmt = con.createStatement();

					rs = stmt.executeQuery(sql);

					while(rs.next()) {
						System.out.print(rs.getInt(1)+"\t");
						System.out.print(rs.getInt(2)+"\t");
						System.out.print(rs.getString(3)+"\t");
						System.out.print(rs.getString(4)+"\t");
						System.out.print(rs.getDouble(5)+"\n");
					}

					rs.close(); stmt.close(); con.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			return list;
		}

		public Emp getEmp(int empno) {
			Emp emp = null;

			try {
				setCon();

				String sql = "SELECT *\r\n"
						+ "FROM emp02\r\n"
						+ "WHERE empno="+empno;

				stmt = con.createStatement();

				if(rs.next()) {
					System.out.print(rs.getInt(8) + "\n");

					emp = new Emp(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
							);
					}
				
				// 5. 자원 해제 : 생성 된 역순으로 자원을 해제해준다.
				rs.close(); stmt.close(); con.close();
				
				// 6. 예외처리를 통한 기타 예외처리
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL 예외 발생!!" + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 발생!!" + e.getMessage());
				
			} finally {
				
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			return emp;
		}
		
	public ArrayList<Emp> getPreparedEmpList(Emp sch) {
		
		ArrayList<Emp> emp02list = new ArrayList<Emp>();
			try {
				setCon();

				String sql = "SELECT *\r\n"
						+ "FROM emp02\r\n"
						+ "WHERE ename LIKE '%'||?||'%'\r\n"
						+ "AND job LIKE '%'||?||'%'\r\n"
						+ "ORDER BY empno desc";
				
				pstmt = con.prepareStatement(sql);
				// 추후에 ? 갯수만큼 순서 1, 2, ... 할당 처리
				pstmt.setString(1, sch.getEname());
				pstmt.setString(2, sch.getJob());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					emp02list.add(new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getDouble("comm"),
							rs.getInt("deptno")
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
				if(stmt != null) { try {
					stmt.close();
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

		return emp02list;
		
	}
	
	/*
		1) 기능 메서드 선언
			public void insertEmp(Emp ins)
		
		2) 연결 공통 메서드 호출
		
		3) con.setAutocommit(false);
			자동 autocommit 발생 방지
		
		4) SQL 선언
			insert into emp02 values(emp_seq.nextVal,?,?,sysdate,?,?,?);
			
		5) preparedStatement 처리
			pstmt.setXXXX(1, 데이터);
			pstmt.setXXXX(2, 데이터);
			pstmt.setXXXX(3, 데이터);
		
		6) executeUpdate()
		
		7) con.commit();
		
		8) 자원 해제
		
		9) 예외 처리 - rollback();	 
	 */

	public void insertEmp(Emp ins) {
		
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "INSERT INTO emp02 VALUES(emp_seq_01.nextval,?,?,?,sysdate,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, ins.getEname());
				pstmt.setString(2, ins.getJob());
				pstmt.setInt(3, ins.getMgr());
				pstmt.setDouble(4, ins.getSal());
				pstmt.setDouble(5, ins.getComm());
				pstmt.setInt(6, ins.getDeptno());
				
				pstmt.executeUpdate();
				con.commit();
				
				pstmt.close(); con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
				System.out.println("SQL 예외 : " + e.getMessage());
				
				try {
					// 입력 중간 문제 발생, rollback 처리
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 : " + e.getMessage());
				
			} finally {
				
				if(rs != null) { try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(stmt != null) { try {
					stmt.close();
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
		
	}

	/*
		1) 기능 메서드 선언
			public void insertEmp(Emp ins)
		
		2) 연결 공통 메서드 호출
		
		3) con.setAutocommit(false);
			자동 autocommit 발생 방지
		
		4) SQL 선언
			insert into emp02 values(emp_seq.nextVal,?,?,sysdate,?,?,?);
			
		5) preparedStatement 처리
			pstmt.setXXXX(1, 데이터);
			pstmt.setXXXX(2, 데이터);
			pstmt.setXXXX(3, 데이터);
		
		6) executeUpdate()
		
		7) con.commit();
		
		8) 자원 해제
		
		9) 예외 처리 - rollback();	 
	 */
	
	public void updateEmp(Emp upt) {
		
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "UPDATE emp02\r\n"
						+ "	SET ename = ?\r\n"
						+ "		job = ?,\r\n"
						+ "		mgr = ?,\r\n"
						+ "		hiredate = to_date(?,'YYYY/MM/DD'),\r\n"
						+ "		sal = ?,\r\n"
						+ "		comm = comm + ?,\r\n"
						+ "		deptno = ?\r\n"
						+ "WHERE empno = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, upt.getEname());
				pstmt.setString(2, upt.getJob());
				pstmt.setInt(3, upt.getMgr());
				pstmt.setString(4, upt.getHiredateS());
				pstmt.setDouble(5, upt.getSal());
				pstmt.setDouble(6, upt.getComm());
				pstmt.setInt(7, upt.getDeptno());
				pstmt.setInt(8, upt.getEmpno());
				
				pstmt.executeUpdate();
				con.commit();
				
				pstmt.close(); con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
				System.out.println("SQL 예외 : " + e.getMessage());
				
				try {
					// 입력 중간 문제 발생, rollback 처리
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 : " + e.getMessage());
				
			} finally {
				
				if(rs != null) { try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} }
				if(stmt != null) { try {
					stmt.close();
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
		
	}
	
	public void deleteEmp(int empno) {
		
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "DELETE FROM emp02\r\n"
					+ "WHERE empno = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, empno);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			System.out.println("SQL 예외 : " + e.getMessage());
			
			try {
				// 입력 중간 문제 발생, rollback 처리
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} catch(Exception e) {
			
			System.out.println("일반 예외 : " + e.getMessage());
			
		} finally {
			
			if(rs != null) { try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
			if(stmt != null) { try {
				stmt.close();
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
	
}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		A05_PreparedDao dao = new A05_PreparedDao();
		
//		ArrayList<Emp> emplist = dao.getEmpList();
//		dao.emplist2(10);
		/*
		Emp e = dao.getEmp(7369);
		if(e != null) {
			System.out.print(e.getEmpno() + "\t");
			System.out.print(e.getEname() + "\t");
			System.out.print(e.getSal() + "\n");
		} else {
			System.out.println("데이터가 없습니다.");
		}
		public Emp(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno)
		
		*/
		
//		dao.insertEmp(new Emp(0,"김미나","과장",7780,"",6000,1000,10));
		
		/*
		UPDATE emp02
			SET ename = ename ||'(승진)',
				job = '차장',
				mgr = 7780,
				hiredate = to_date('2021/01/01','YYYY/MM/DD'),
				sal = sal + 1000,
				comm = comm + 300,
				deptno = 20
		WHERE empno = 7936;
		 */
		
		dao.updateEmp(new Emp(7937, "김소현(수정)", "대리", 7780, "2021/07/09", 5000, 1000, 10));
		
//		dao.deleteEmp(7935);
		
		for(Emp e:dao.getPreparedEmpList(new Emp("",""))) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		
		// ex) A02_DeptDao.java에서 부서정보를 등록하고 조회하세요.
		//		dept05 테이블 생성
		
		// ex) Member 테이블을 mno 기준으로 수정하세요.
		
	}
}