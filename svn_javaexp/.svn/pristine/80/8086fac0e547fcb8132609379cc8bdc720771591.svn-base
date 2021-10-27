package javaexp.z99_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javaexp.z01_vo.Emp;
import javaexp.z01_vo.Emp_Dept;

public class A04_DaoSch {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
	}
	// 1. sql문작성 ==> VO
	// 2. 메서드 선언 : 리턴데이터, 입력데이터에 맞는 객체
	// 3. 공통연결메서드 호출 및 기본예외처리.
	// 4. 대화객체 : sql 선언과 매개변수 처리
	// 5. 결과객체
	// 6. while을 통한 ArrayList할당
	// 7. 자원해제.
	// 8. main()를 통해 test
	public ArrayList<Emp_Dept> empDeptSch(Emp_Dept sch) {
		ArrayList<Emp_Dept> edlist = new ArrayList<Emp_Dept>();
		try {
			setCon();
			String sql = "SELECT *\r\n" + "FROM emp e, dept d\r\n" 
					+ "WHERE e.deptno = d.deptno\r\n"
					+ "AND ename LIKE '%'||'" + sch.getEname()+ "'||'%'\r\n" 
					+ "AND dname LIKE '%'||'"+ sch.getDname() + "'||'%'";
			System.out.println("sql문 : " + sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			/*
			Emp_Dept(int empno, String ename, String job, 
					 int mgr, Date hiredate, double sal, 
					 double comm, int deptno,
			         String dname, String loc) 
			         
각 조별로 현재 DB 처리 내용 이해 정도와 혹, 특정한 부분 이해가 안되거나 
개념 설명이 필요한 부분 요청 해주세요.. ~ 12:45			         
			 * */
			while(rs.next()) {
				edlist.add(new Emp_Dept(
					rs.getInt("empno"),	
					rs.getString("ename"),	
					rs.getString("job"),	
					rs.getInt("mgr"),	
					rs.getDate("hiredate"),	
					rs.getDouble("sal"),	
					rs.getDouble("comm"),	
					rs.getInt("deptno"),	
					rs.getString("dname"),	
					rs.getString("loc")	
				));
			}
			System.out.println("데이터 건수:"+edlist.size());
			rs.close();stmt.close();con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
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
			if (pstmt != null) {
				try {
					pstmt.close();
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

		return edlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_DaoSch dao = new A04_DaoSch();
		//dao.empDeptSch(new Emp_Dept("A","A"));
		for(Emp_Dept ed:dao.empDeptSch(new Emp_Dept("A","A"))) {
			System.out.print(ed.getEname()+"\t");
			System.out.print(ed.getJob()+"\t");
			System.out.print(ed.getDname()+"\t");
			System.out.print(ed.getLoc()+"\n");
		}
	}
/*
			         
각 조별로 현재 DB 처리 내용 이해 정도와 혹, 특정한 부분 이해가 안되거나 
개념 설명이 필요한 부분 요청 해주세요.. 
조장님은 확인된 내용 메시지 주세요. ~ 12:45	 
 */
}
