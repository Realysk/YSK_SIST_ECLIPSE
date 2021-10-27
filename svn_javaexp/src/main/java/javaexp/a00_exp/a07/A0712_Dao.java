package javaexp.a00_exp.a07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javaexp.a00_exp.z01_vo.Product;

public class A0712_Dao {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 완료!");
	}

	// 조회
	public ArrayList<Product> plist(Product sch) {
		ArrayList<Product> plist = new ArrayList<Product>();
		try {
			setCon();
			String sql = "SELECT * \r\n"
					+ "FROM product\r\n"
					+ "WHERE name LIKE '%'||?||'%'\r\n"
					+ "AND price BETWEEN ? AND ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getName());
			pstmt.setInt(2, sch.getFr_price());
			pstmt.setInt(3, sch.getTo_price());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				plist.add(new Product(
					rs.getString(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getInt(4)
				));
			}
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {

			if (rs != null) {
				try {
					rs.close();
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

		return plist;
	}

	// 등록

	// 수정

	// 조회
	public void insertProd(Product ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO product values('PRO'||prod_seq.nextval,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getName());
			pstmt.setInt(2, ins.getPrice());
			pstmt.setInt(3, ins.getCnt());
			pstmt.executeUpdate();
			pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
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
	}

	// 등록
	
	// 수정
	
	// 조회
	public void updateProd(Product upt) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE product\r\n"
					+ "	SET name = ?,\r\n"
					+ "	    price = ?,\r\n"
					+ "	    cnt = ?\r\n"
					+ "	WHERE pno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getName());
			pstmt.setInt(2, upt.getPrice());
			pstmt.setInt(3, upt.getCnt());
			pstmt.setString(4, upt.getPno());
			pstmt.executeUpdate();
			pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
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
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A0712_Dao dao = new A0712_Dao();
		dao.updateProd(new Product("PRO1006","망고",2000,9999));
		for(Product pro:dao.plist(new Product("",0,9999))) {
			System.out.print(pro.getPno()+"\t");
			System.out.print(pro.getName()+"\t");
			System.out.print(pro.getPrice()+"\t");
			System.out.print(pro.getCnt()+"\n");
		}
		/*
		 * 3. DML 처리 순서를 정리하세요. 1) sql 작성 : 생성 및 insert, update, delete, sequence 2)
		 * 조건이나 입력할 데이터를 받은 구조 VO 클래스 선언 3) con.autoCommit(false); 4) pstmt =
		 * con.preparedStatement(sql) 5) 매개변수 처리 pstmt.setXXXX(순서, 데이터);
		 * pstmt.setXXXX(순서, 데이터); 6) rs = pstmt.executeUpdate(); 7) con.commit(); 8)
		 * 자원해제 6) 예외처리(SQLException) 블럭에 con.rollback()
		 * 
		 * 4. PreparedStatement를 활용하여, Product 테이블을 만들고, 물건정보 등록, 조회, 수정 처리하세요. 1) 테이블
		 * 생성, sql 작성 2) VO 객체 생성 3) 공통 전역변수, 공통 기능 메서드 setConn() 선언.. 4) 기능메서드 리턴값 선언..
		 * 5) sql 변수 선언.. ...
		 * 
		 * 
		 */
	}

}
