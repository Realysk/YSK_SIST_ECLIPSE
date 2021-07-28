package jspexp.z01_database;
// jspexp.z01_database.A05_PreparedDao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z02_vo.Dept;
import jspexp.z02_vo.Emp;


public class A05_PreparedDao {
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
	public ArrayList<Emp> getEmpList() {
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		try {
			setCon();
			String sql = "SELECT * \r\n"
					+ "FROM emp02";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				emplist.add(new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getInt("comm"),
							rs.getInt("deptno")
						));
			}
			System.out.println("ArrayList의 데이터 갯수:"+emplist.size());
			rs.close(); stmt.close(); con.close();
			
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
		return emplist;
	}
	//  ex) 기능 메서드 추가..
	/*
	SELECT deptno, empno, ename, job, sal
	FROM emp02
	WHERE deptno=10 처리하는 기능메서드를 추가하세요 [6조]
	 * */
	// 조건을 받아서 데이터 처리..
	/*
	# PareparedStatement 객체 활용..
	 * 
	 * */
	
	
	
	public ArrayList<Emp> empList2(int deptno){
		ArrayList<Emp> list = new ArrayList<Emp>();
		// 1. 연결 처리.
		try {
			setCon();
			// 2. 부서 정보 받아 sql 선언.
			String sql = "SELECT *\r\n"
					+ "	FROM emp02\r\n"
					+ "	WHERE deptno= ? ";
			pstmt = con.prepareStatement(sql);
			// 추후에 ?  갯수만큼 순서 1, 2, ..할당 처리.
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
		return list;
	}
	//  ex) 기능 메서드 추가..
	/*
	SELECT deptno, empno, ename, job, sal
	FROM emp02
	WHERE deptno=10 처리하는 기능메서드를 추가하세요 [6조]
	 * */
	// 조건을 받아서 데이터 처리..
	public ArrayList<Emp> empList3(int deptno){
		ArrayList<Emp> list = new ArrayList<Emp>();
		// 1. 연결 처리.
		try {
			setCon();
			// 2. 부서 정보 받아 sql 선언.
			String sql = "SELECT deptno, empno, ename, job, sal\r\n"
					+ "	FROM emp02\r\n"
					+ "	WHERE deptno="+deptno;
			/*
			ex) 문자열을 받으면, ''
			 * WHERE ename='CLARK';
			 * */
			/*
			String name = "CLARK";
			String sql2 = "SELECT deptno, empno, ename, job, sal\r\n"
					+ "	FROM emp02\r\n"
					+ "WHERE ename='"+name+"'"; 
			*/
			// 3. Statement
			stmt = con.createStatement();
			// 4. ResultSet
			rs = stmt.executeQuery(sql);
			//    1) while()
			while(rs.next()) {
				System.out.print(rs.getInt(1)+"\t");
				System.out.print(rs.getInt(2)+"\t");
				System.out.print(rs.getString(3)+"\t");
				System.out.print(rs.getString(4)+"\t");
				System.out.print(rs.getDouble(5)+"\n");
			}
			// 5. 자원해제..	
			rs.close(); stmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	// emp 조회 ==> ArrayList<Emp> 담기 처리..
	// # 기능 메서드 선언..
	// 틀만들기
	// 1) 최종 결과값에 대한 확인 ==> 객체를 return 처리 
	// ==> 리턴유형, 실제리턴할 객체
	// 2) 최종 결과를 위해 입력할 데이터 확인 ==> VO객체로 만들기|입력데이터 변수로 선언
	// ---------------------------------------------------------------
	// 내용추가.
	// 3) 
	// 단일 객체 처리..
	// 1) 리턴값 단일 객체로 변경 (리턴유형, 객체변경);
	// 2) sql 변경..
	// 3) if(rs.next()) emp = new Emp(.....);
	public Emp getEmp(int empno){
		Emp emp=null;
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM emp02\r\n"
					+ "WHERE empno="+empno;
			stmt = con.createStatement();
			rs= stmt.executeQuery(sql);
			if(rs.next()) {
				emp = new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getInt("comm"),
							rs.getInt("deptno")
							);
			}
			rs.close(); stmt.close(); con.close();
			
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
		return emp;
	}
	public ArrayList<Emp> getPreparedEmpList(Emp sch) {
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM emp02\r\n"
					+ "WHERE ename LIKE '%'||?||'%'\r\n"
					+ "AND job LIKE '%'||?||'%'\r\n"
					+ "ORDER BY empno desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getEname());
			pstmt.setString(2, sch.getJob());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				emplist.add(new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getInt("comm"),
							rs.getInt("deptno")
						));
			}
			System.out.println("ArrayList의 데이터 갯수:"+emplist.size());
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
		return emplist;
	}
	/*
	1) 기능 메서드 선언.
		public void insertEmp(Emp ins)
	2) 연결 공통 메서드 호출..
	3) con.setAutocommit(false);
		자동 autocommit 발생 방지..
	4) sql 선언..
		insert into emp02 values(emp_seq.nextval,?,?,sysdate,?,?,?);	
	5) PreparedStatement 처리
		pstmt.setXXXX(1, 데이터);	
		pstmt.setXXXX(2, 데이터);	
		pstmt.setXXXX(3, 데이터);
	6) executeUpdate()
	7) con.commit();
	8) 자원해제처리.		
	9) 예외 처리 - rollback();	
	 * */
	public void insertEmp(Emp ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO emp02 values(emp_seq_01.nextval, ?,?,?,sysdate,?,?,?)";
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
	/*
	1) 기능 메서드 선언.
		public void insertEmp(Emp ins)
	2) 연결 공통 메서드 호출..
	3) con.setAutocommit(false);
		자동 autocommit 발생 방지..
	4) sql 선언..
		insert into emp02 values(emp_seq.nextval,?,?,sysdate,?,?,?);	
	5) PreparedStatement 처리
		pstmt.setXXXX(1, 데이터);	
		pstmt.setXXXX(2, 데이터);	
		pstmt.setXXXX(3, 데이터);
	6) executeUpdate()
	7) con.commit();
	8) 자원해제처리.		
	9) 예외 처리 - rollback();	
	 * */
	public void updateEmp(Emp upt){
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE emp02\r\n"
					+ "	SET ename = ?,\r\n"
					+ "		job = ?,\r\n"
					+ "		mgr = ?,\r\n"
					+ "		hiredate = TO_date(?,'YYYY/MM/DD'),\r\n"
					+ "		sal = ?,\r\n"
					+ "		comm = comm+?,\r\n"
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
	/*
	1) 기능 메서드 선언.
		public void insertEmp(Emp ins)
	2) 연결 공통 메서드 호출..
	3) con.setAutocommit(false);
		자동 autocommit 발생 방지..
	4) sql 선언..
		insert into emp02 values(emp_seq.nextval,?,?,sysdate,?,?,?);	
	5) PreparedStatement 처리
		pstmt.setXXXX(1, 데이터);	
		pstmt.setXXXX(2, 데이터);	
		pstmt.setXXXX(3, 데이터);
	6) executeUpdate()
	7) con.commit();
	8) 자원해제처리.		
	9) 예외 처리 - rollback();	
	 * */
	public void deleteEmp(int empno){
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
		// ex) A02_DeptDao.java 기존 소스를 활용하여 부서번호로 부서정보를 
		// 삭제하세요 [3조]
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
	// 1. return 타입, 매개변수,
	// 2. SQL 삽입
	// 3. VO 데이터 처리
	public ArrayList<Dept> getDeptList(Dept sch) {
		ArrayList<Dept> deptlist = new ArrayList<Dept>();
		try {
			setCon();
			String sql = " SELECT * \r\n"
					+ " FROM dept02\r\n"
					+ " WHERE dname LIKE '%'||?||'%'\r\n"
					+ " AND loc LIKE '%'||?||'%'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				deptlist.add(new Dept(
							rs.getInt("deptno"),
							rs.getString("dname"),
							rs.getString("loc")
						));
			}
			System.out.println("ArrayList의 데이터 갯수:"+deptlist.size());
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
		return deptlist;
	}
	// 1. return 타입, 매개변수,
	// 2. SQL 삽입
	// 3. VO 데이터 처리
	public boolean login(String id2, String pw2) {
		boolean hasMember = false;
		try {
			setCon();
			String sql = "SELECT * FROM MEMBER WHERE id=? AND pass=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id2);
			pstmt.setString(2, pw2);
			
			rs = pstmt.executeQuery();
			
			hasMember = rs.next(); // 데이터가 있으면 true/false
			
			System.out.println("입력 값 ID :" + id2);
			System.out.println("입력 값 PW :" + pw2);
			System.out.println("등록 여부 :" + hasMember);
			
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
		return hasMember;
	}
	
	/*
	1) 기능 메서드 선언.
		public void insertEmp(Emp ins)
	2) 연결 공통 메서드 호출..
	3) con.setAutocommit(false);
		자동 autocommit 발생 방지..
	4) sql 선언..
		insert into emp02 values(emp_seq.nextval,?,?,sysdate,?,?,?);	
	5) PreparedStatement 처리
		pstmt.setXXXX(1, 데이터);	
		pstmt.setXXXX(2, 데이터);	
		pstmt.setXXXX(3, 데이터);
	6) executeUpdate()
	7) con.commit();
	8) 자원해제처리.		
	9) 예외 처리 - rollback();	
	 * */
	public void insertEmp2(Emp ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO emp02 values(emp_seq_01.nextval, ?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getEname());
			pstmt.setString(2, ins.getJob());
			pstmt.setInt(3, ins.getMgr());
			pstmt.setString(4, ins.getHiredateS());
			pstmt.setDouble(5, ins.getSal());
			pstmt.setDouble(6, ins.getComm());
			pstmt.setInt(7, ins.getDeptno());
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
	/*
	1) 기능 메서드 선언.
		public void insertEmp(Emp ins)
	2) 연결 공통 메서드 호출..
	3) con.setAutocommit(false);
		자동 autocommit 발생 방지..
	4) sql 선언..
		insert into emp02 values(emp_seq.nextval,?,?,sysdate,?,?,?);	
	5) PreparedStatement 처리
		pstmt.setXXXX(1, 데이터);	
		pstmt.setXXXX(2, 데이터);	
		pstmt.setXXXX(3, 데이터);
	6) executeUpdate()
	7) con.commit();
	8) 자원해제처리.		
	9) 예외 처리 - rollback();	
	 * */
	public void insertDept(Dept ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO dept02 values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getDeptno());
			pstmt.setString(2, ins.getDname());
			pstmt.setString(3, ins.getLoc());
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
	// ex) 조회문 select * from dept를 위한 A02_DeptDao.java를 만들고,
	//     공통 연결메서드와 기능메서드(부서정보조회) 틀을 만드세요 1조
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A05_PreparedDao dao = new A05_PreparedDao();
		
		dao.login("himan", "7777");
		
		System.out.println("Dept 테스트 : " + dao.getDeptList(new Dept(0, "", "")).size());
		
		//ArrayList<Emp> elist = dao.getEmpList();
		/*
		//dao.empList2(30);
		Emp e = dao.getEmp(7369);
		if(e!=null) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getSal()+"\n");
			
		}else {
			System.out.println("데이터가 없습니다.");
		}
		public Emp(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno) {
			UPDATE emp02
				SET ename = ename||'(승진)',
					job = '차장',
					mgr = 7780,
					hiredate = TO_date('2021/01/01','YYYY/MM/DD'),
					sal = sal+1000,
					comm = comm+300,
					deptno = 20
			WHERE empno = 7937;			
		*/
		//dao.insertEmp(new Emp(0,"김미나","과장",7780,"",6000,1000,10));
		//dao.updateEmp(new Emp(7937,"김소현(수정)","대리",7780,"2021/07/09",5000,1000,10));
//		dao.deleteEmp(7935);
		
		for(Emp e:dao.getPreparedEmpList(new Emp("",""))) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
 
		
	}

}