package wannafit.content.funding;
// jspexp.z01_database.A05_PreparedDao
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import wannafit.content.vo.BusInfo_VO;
import wannafit.content.vo.Com_Info_VO;
import wannafit.content.vo.FunPro_VO;
import wannafit.content.vo.FunReq_VO;
import wannafit.content.vo.USER_VO;


public class FUN_dao {
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
    
    
    //2. 사업자등록증 조회 
    public ArrayList<BusInfo_VO> getbus() {
      ArrayList<BusInfo_VO> buslist = new ArrayList<BusInfo_VO>();
      try {
        setCon();
        String sql = "SELECT * FROM Wanna_busPerson";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
          buslist.add(
              new BusInfo_VO
              (rs.getString("wb_num"),
              rs.getString("wb_regNum"),
              rs.getString("wb_regTitle"),
              rs.getString("wb_regPath"))); 
             
        }        

        System.out.println("ArrayList의 데이터 갯수:" + buslist.size());
        rs.close();
        stmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return buslist;
    }
    
    
    //2. 사업자등록증등록 
    public void insertBus(BusInfo_VO businfo) {
      try {
        setCon();
        con.setAutoCommit(false);
        String sql =
            "INSERT INTO Wanna_busPerson values('wb'||lpad(Wanna_busPerson_seq.nextval, 5, 1),?,?,?)";
        pstmt = con.prepareStatement(sql);
        //pstmt.setString(1, businfo.getWb_num());
        pstmt.setString(1, businfo.getWb_regNum());
        pstmt.setString(2, businfo.getWb_regTitle());
        pstmt.setString(3, businfo.getWb_regPath());
        pstmt.executeUpdate();
        con.commit();
        pstmt.close();
        con.close();
        
        System.out.println("등록완료");
        
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
        try {
          // 입력 중간 문제 발생, rollback처리..
          con.rollback();
        } catch (SQLException e1) {
          // TODO Auto-generated catch block
          e1.printStackTrace();
        }
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
    }
    
    
    //3. 회원정보등록 
    public void insertUse(USER_VO userinfo) {
      try {
        setCon();
        con.setAutoCommit(false);
        String sql =
            "INSERT INTO Wanna_Member values(?,?,?,?,?,?,0,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userinfo.getWm_id());
        pstmt.setString(2, userinfo.getWm_pass());
        pstmt.setString(3, userinfo.getWm_email());
        pstmt.setString(4, userinfo.getWm_nick());
        pstmt.setString(5, userinfo.getWm_tel());
        pstmt.setString(6, userinfo.getWm_usrGroup());
       // pstmt.setInt(7, userinfo.getWm_repCnt());
        pstmt.setString(7, userinfo.getWm_imgSrc());
        pstmt.setString(8, userinfo.getWb_num());
        pstmt.executeUpdate();
        con.commit();
        pstmt.close();
        con.close();
        
      
        System.out.println("등록완료");
        
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
        try {
          // 입력 중간 문제 발생, rollback처리..
          con.rollback();
        } catch (SQLException e1) {
          // TODO Auto-generated catch block
          e1.printStackTrace();
        }
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
    }          
    
    
    //4. 기업정보등록 
    public void insertCom(Com_Info_VO cominfo) {
      try {
        setCon();
        con.setAutoCommit(false);
        String sql =
            "INSERT INTO Wanna_Business values(?,?, ?,?,?,?,?,?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, cominfo.getWm_id());
        pstmt.setString(2, cominfo.getBs_email());
        pstmt.setString(3, cominfo.getBs_sns());
        pstmt.setString(4, cominfo.getBs_number());
        pstmt.setString(5, cominfo.getBs_address());
        pstmt.setString(6, cominfo.getBs_ceo());
        pstmt.setString(7, cominfo.getBs_accname());
        pstmt.setString(8, cominfo.getBs_accnum());
        pstmt.setString(9, cominfo.getBs_accnum_name());
        pstmt.setString(10, cominfo.getBs_busname());
        pstmt.setString(11, cominfo.getBs_intro());
        pstmt.setString(12, cominfo.getBs_pic_url());
        pstmt.executeUpdate();
        con.commit();
        pstmt.close();
        con.close();
        
      
        System.out.println("등록완료");
        
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
        try {
          // 입력 중간 문제 발생, rollback처리..
          con.rollback();
        } catch (SQLException e1) {
          // TODO Auto-generated catch block
          e1.printStackTrace();
        }
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
    }     
    
    //5. 전체 조회 (사업자 신청) 
    
    
    //6. 펀딩상품리스트 
    public ArrayList<FunPro_VO> getfundinglist() {
      ArrayList<FunPro_VO> fundingprolist = new ArrayList<FunPro_VO>();
      try {
        setCon();
        String sql = "SELECT * FROM Wanna_Fundingprod where fp_state = '판매중'";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
          fundingprolist.add(
              new FunPro_VO
              (rs.getString("id"),
              rs.getString("wm_id"),
              rs.getString("fp_category"),
              rs.getString("fp_tagprice"),
              rs.getDate("fp_startdate"),
              rs.getDate("fp_enddate"),
              rs.getString("fp_title"),
              rs.getString("fp_intro"),
              rs.getInt("fp_people"),
              rs.getString("fp_state"),
              rs.getInt("fp_accprice"),
              rs.getString("fp_picurl"), 
              rs.getString("fp_content"))); 
             
        }         
        System.out.println("ArrayList의 데이터 갯수:" + fundingprolist.size());
        rs.close();
        stmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return fundingprolist;
    }

    public ArrayList<FunPro_VO> getDtfundinglist (String code) {
      ArrayList<FunPro_VO> fundingDlist = new ArrayList<FunPro_VO>();
      try {
        setCon();
        String sql = "SELECT *\r\n" + "FROM Wanna_Fundingprod\r\n" + "WHERE id = ?";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, code);

        rs = pstmt.executeQuery();
        while (rs.next()) {
          fundingDlist.add(
              new FunPro_VO
              (
              rs.getString("wm_id"),
              rs.getString("id"),
              rs.getString("fp_category"),
              rs.getString("fp_tagprice"),
              rs.getDate("fp_startdate"),
              rs.getDate("fp_enddate"),
              rs.getString("fp_title"),
              rs.getString("fp_intro"),
              rs.getInt("fp_people"),
              rs.getString("fp_state"),
              rs.getInt("fp_accprice"),
              rs.getString("fp_picurl"), 
              rs.getString("fp_content"))); 
             
        }         
        System.out.println("ArrayList의 데이터 갯수:" + fundingDlist.size());
        rs.close();
        pstmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return fundingDlist;
    }
    
    //7. 펀딩신청 
    public void insertfunding(FunReq_VO fundinfo) {
      try {
        setCon();
        con.setAutoCommit(false);
        String sql =
        "INSERT INTO Wanna_Funding_sup values('wfs'||lpad(Wanna_Funding_sup_seq.nextval, 7, 1),?,?,'후원','카드',?,?,?,?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        //pstmt.setString(1, fundinfo.getFs_num());
        pstmt.setString(1, fundinfo.getId());
        pstmt.setString(2, fundinfo.getWm_id());
        //pstmt.setString(1, fundinfo.getWp_class());
        //pstmt.setString(1, fundinfo.getWp_type());
        pstmt.setInt(3, fundinfo.getWp_price());
        pstmt.setString(4, fundinfo.getWp_address());
        pstmt.setString(5, fundinfo.getWp_cardnum());
        pstmt.setString(6, fundinfo.getWp_bank());
        pstmt.setString(7, fundinfo.getWp_accname());
        pstmt.setString(8, fundinfo.getWp_limitdate());
        pstmt.setString(9, fundinfo.getWp_birth());
        pstmt.setInt(10, fundinfo.getWp_install());
        
 
        
        pstmt.executeUpdate();
        con.commit();
        pstmt.close();
        con.close();
       
      
        System.out.println("펀딩신청등록완료");
        
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
        try {
          // 입력 중간 문제 발생, rollback처리..
          con.rollback();
        } catch (SQLException e1) {
          // TODO Auto-generated catch block
          e1.printStackTrace();
        }
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
    }       
    
    public ArrayList<FunPro_VO> getfundinglistAll() {
      ArrayList<FunPro_VO> fundingprolist = new ArrayList<FunPro_VO>();
      try {
        setCon();
        String sql = "SELECT * FROM Wanna_Fundingprod";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
          fundingprolist.add(
              new FunPro_VO
              (rs.getString("id"),
              rs.getString("wm_id"),
              rs.getString("fp_category"),
              rs.getString("fp_tagprice"),
              rs.getDate("fp_startdate"),
              rs.getDate("fp_enddate"),
              rs.getString("fp_title"),
              rs.getString("fp_intro"),
              rs.getInt("fp_people"),
              rs.getString("fp_state"),
              rs.getInt("fp_accprice"),
              rs.getString("fp_picurl"), 
              rs.getString("fp_content"))); 
             
        }         
        System.out.println("ArrayList의 데이터 갯수:" + fundingprolist.size());
        rs.close();
        stmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return fundingprolist;
    }
    
    
    public ArrayList<FunPro_VO> getfunlist(FunPro_VO sch) {
      ArrayList<FunPro_VO> funlist = new ArrayList<FunPro_VO>();
      try {
        setCon();
        String sql = "SELECT *\r\n" + "FROM Wanna_Fundingprod\r\n" + "WHERE fp_category LIKE '%'||?||'%'\r\n"
            + "AND fp_state LIKE '%'||?||'%'\r\n";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, sch.getFp_category());
        pstmt.setString(2, sch.getFp_state());

        rs = pstmt.executeQuery();
        while (rs.next()) {
          funlist.add(new FunPro_VO(
              rs.getString("wm_id"),
              rs.getString("id"),
              rs.getString("fp_category"),
              rs.getString("fp_tagprice"),
              rs.getDate("fp_startdate"),
              rs.getDate("fp_enddate"),
              rs.getString("fp_title"),
              rs.getString("fp_intro"),
              rs.getInt("fp_people"),
              rs.getString("fp_state"),
              rs.getInt("fp_accprice"),
              rs.getString("fp_picurl"),
              rs.getString("fp_content")));
        }
      
        System.out.println("펀딩(나의 관리내역)의 데이터 갯수:" + funlist.size());
        rs.close();
        pstmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return funlist;
    }
    
    
    public FunPro_VO getFundetail(String id) {
      FunPro_VO fundingdetail = null;
      try {
        setCon();
        String sql = "SELECT *\r\n" + "FROM Wanna_Fundingprod\r\n" + "WHERE id=" + id;
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
          fundingdetail = new FunPro_VO(
              rs.getString("wm_id"),
              rs.getString("id"),
              rs.getString("fp_category"),
              rs.getString("fp_tagprice"),
              rs.getDate("fp_startdate"),
              rs.getDate("fp_enddate"),
              rs.getString("fp_title"),
              rs.getString("fp_intro"),
              rs.getInt("fp_people"),
              rs.getString("fp_state"),
              rs.getInt("fp_accprice"),
              rs.getString("fp_picurl"),
              rs.getString("fp_content"));
        }
        
        rs.close();
        stmt.close();
        con.close();

      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        System.out.println("SQL 예외 발생~~" + e.getMessage());
      } catch (Exception e) {
        System.out.println("일반예외 발생:" + e.getMessage());
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
      return fundingdetail;
    }

    public static void main(String[] args) {
      // TODO Auto-generated method stub
     FUN_dao dao = new FUN_dao();
    // dao.getbus();
     //dao.insertBus(new BusInfo_VO("12382312434","쿠키날12","img22.JPG"));   
    // dao.getbus();
      dao.getfundinglist();

}
}