package javaexp.z99_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javaexp.z01_vo.Emp;

public class A03_DaoSch {
	// keyword 검색을 통한 처리.
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // 필수예외처리
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속성공!!");
	}
	// 1. sql문작성 ==> VO
	// 2. 메서드 선언 : 리턴데이터, 입력데이터에 맞는 객체
	// 3. 공통연결메서드 호출 및 기본예외처리.
	// 4. 대화객체 : sql 선언과 매개변수 처리
	// 5. 결과객체
	// 6. while을 통한 ArrayList할당
	// 7. 자원해제.
	// 8. main()를 통해 test
	public ArrayList<Emp> empSch(Emp sch){
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		try {
			setCon();
			String sql = "SELECT *\r\n"
					+ "FROM emp01\r\n"
					+ "WHERE ename LIKE '%'||'"+sch.getEname()+"'||'%'\r\n"
					+ "AND job LIKE '%'||'"+sch.getJob()+"'||'%' ";
			System.out.println("sql:"+sql);
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
					rs.getDouble("comm"),
					rs.getInt("deptno")
				));
			}
			System.out.println("검색 건수:"+emplist.size());
			rs.close(); stmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sql 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			if(rs!=null) { 
				try {
					rs.close();
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				} 
			}
			if(stmt!=null) { try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
			if(pstmt!=null) { try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
			if(con!=null) { try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
		}
		return emplist;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_DaoSch dao = new A03_DaoSch();
		ArrayList<Emp> elist = dao.empSch(new Emp("",""));
		for(Emp e:elist) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\t");
			System.out.print(e.getComm()+"\t");
			System.out.print(e.getDeptno()+"\n");
		}
	}
/*
ex) A04_DaoSch.java 부분 데이터 처리 및, main()에서 데이터 확인 2조
 * */
}
