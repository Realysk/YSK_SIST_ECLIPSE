package javaexp.a00_exp.a07;

	import java.sql.Connection;
	import java.sql.Date;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.ArrayList;

	import javaexp.a00_exp.z01_vo.Member;

	public class A02_Database {

	   /*
	        
	     4. 회원테이블 member를 만들고, id, pass받아 로그인 처리하는 프로그램을
	           PreparedStatement 처리 형식으로 만들어 보세요.
	           1) 회원 DB 테이블 만들기 및 데이터 입력 (member)
	              * 회원번호 아이디 패스워드 회원명 권한 포인트 등록일
	           2) SQL 작성 및 확인
	           3) VO 객체 작성 (member)
	           4) 기본 전역변수 및 공통 연결 메서드 선언
	           5) public void isertMember(Member ins)
	           6) ...
	           
	    */
	   

	   
	   // a06_DmlExp에서 mno기준으로 Member테이블을 수정처리하세요 [1조]

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
	      
	      String info = "jdbc:oracle:thin:@localhost:1521:xe";
	      
	      con = DriverManager.getConnection(info, "scott", "tiger");
	      System.out.println("접속성공");
	   }
	   
	   
	   public Member login(String id, String pass) {
	      Member mem = null;
	      
	      try {
	         setCon();
	         String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, pass);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
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
	         rs.close();
	         pstmt.close();
	         con.close();
	         
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      } catch(Exception e ) {
	         System.out.println(e.getMessage());
	      } finally {
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
	      
	      return mem;
	   }
	   
	   // 있는 여부만 리턴할때
	   public boolean hasMember(Member m) {
	      boolean hasMember = false;
	      
	      try {
	         setCon();
	         String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, m.getId());
	         pstmt.setString(2, m.getPass());
	         rs = pstmt.executeQuery();
	         hasMember = rs.next();
	         
	         rs.close();
	         pstmt.close();
	         con.close();
	         
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      } catch(Exception e ) {
	         System.out.println(e.getMessage());
	      } finally {
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
	      
	      return hasMember;
	   }


	   public void updateMem(Member m) {
	      
	      try {
	         setCon();
	         con.setAutoCommit(false);
	         String sql = " UPDATE MEMBER \r\n"
	               + "   SET pass = ?,\r\n"
	               + "      name = ?,\r\n"
	               + "      auth = ?,\r\n"
	               + "      point = point+?,\r\n"
	               + "      regdte = sysdate\r\n"
	               + "WHERE mno = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, m.getPass());
	         pstmt.setString(2, m.getName());
	         pstmt.setString(3, m.getAuth());
	         pstmt.setInt(4, m.getPoint());
	         pstmt.setInt(5, m.getMno());
	         
	         con.commit();

	         pstmt.close();
	         con.close();
	         
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	         try {
	            con.rollback();
	         } catch (SQLException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         }
	         e.printStackTrace();
	      } catch(Exception e ) {
	         System.out.println(e.getMessage());
	      } finally {
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
		   A02_Database dao = new A02_Database();
//	      Member m1 = dao.login("himan", "7777");
//	      System.out.println(m1.getName());
//	      
//	      
//	      System.out.println("회원등록여부 : "+dao.hasMember(new Member("higirl", "8888")));
//	      
//	      public Member(int mno, String id, String pass, String name, String auth, int point, String regdteS)
	      dao.updateMem(new Member(1004,"", "7777", "홍유나", "admin", 100, ""));
//	      Member m2 = dao.login("higirl", "7777");
//	      System.out.println(m2.getId());
//	      System.out.println(m2.getName());
	      
	   }

	
}
