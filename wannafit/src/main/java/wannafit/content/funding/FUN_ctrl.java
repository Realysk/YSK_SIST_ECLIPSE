package wannafit.content.funding;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wannafit.content.vo.FunReq_VO;


/**
 * Servlet implementation class FUN_Ctrl
 */
@WebServlet(name = "funding.do", urlPatterns = {"/funding.do"})
public class FUN_ctrl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  // 1. 서비스 선언
  private FUN_serv service;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public FUN_ctrl() {
    super();
    // TODO Auto-generated constructor stub
    // 서비스 생성자 객체 선언
    service = new FUN_serv();
  }

  /**
   * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
   */
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub

    // 문자열 변환 처리
    request.setCharacterEncoding("utf-8");
    String proc = request.getParameter("proc");
    System.out.println("proc"+proc);
    //String fs_num =request.getParameter("fs_num"); //펀딩후원번호 
   //String wp_class  =request.getParameter("wp_class"); //결제분류(후원/예약)
   // String wp_type  =request.getParameter("wp_type") ; //결제방법 (카드.계좌)
    String wp_price = request.getParameter("wp_price") ;//결제금액
    System.out.println(wp_price);
    String wp_address =request.getParameter("wp_address") ;//주소
    System.out.println(wp_address);
    String wp_cardnum =request.getParameter("wp_cardnum") ;//카드번호
    System.out.println(wp_cardnum);
    String wp_bank  =request.getParameter("wp_bank");//은행명
    System.out.println(wp_bank);
    String wp_accname  =request.getParameter("wp_accname");//예금주명
    System.out.println(wp_accname);
    String wp_limitdate =request.getParameter("wp_limitdate");//유효기간
    System.out.println(wp_limitdate);
    String wp_birth = request.getParameter("wp_birth");//생년월일
    System.out.println(wp_birth);
    String wp_install = request.getParameter("wp_install");//할부기간 
    System.out.println(wp_install);
    String id = request.getParameter("id");
   System.out.println(id);
   

      if(proc!=null) {
       
      if(proc.equals("funding")) {
        int wp_priceS = Integer.parseInt(wp_price);//결제금액
        int wp_installS =Integer.parseInt(wp_install);
        System.out.println("입력받는부분!****************");
       
      FunReq_VO fundinfo = new FunReq_VO();
      //fundinfo.getFs_num();
      fundinfo.setId(id); //상품번호 
      System.out.println(id);
      fundinfo.setWm_id("heyjinss"); //아이디 
      System.out.println("heyjinss");
      //fundinfo.getWp_type();
      //fundinfo.getWp_class();
      fundinfo.setWp_price(wp_priceS);
      System.out.println(wp_priceS);
      fundinfo.setWp_address(wp_address);
      System.out.println(wp_address);
      fundinfo.setWp_cardnum(wp_cardnum);
      System.out.println(wp_cardnum);
      fundinfo.setWp_bank(wp_bank);
      fundinfo.setWp_accname(wp_accname);
      fundinfo.setWp_limitdate(wp_limitdate);
      fundinfo.setWp_birth(wp_birth);
      fundinfo.setWp_install(wp_installS);
      service.insertfunding(fundinfo);
      System.out.println("ctr단 펀딩 등록성공");
     /* 
      "INSERT INTO Wanna_Funding_sup values('wfs'||lpad(Wanna_Funding_sup_seq.nextval, 7, 1),?,?,'후원','카드',?,?,?,?,?,?,?,?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, fundinfo.getFs_num());
      pstmt.setString(2, fundinfo.getId());
      pstmt.setString(3, fundinfo.getWm_id());
      //pstmt.setString(1, fundinfo.getWp_class());
      //pstmt.setString(1, fundinfo.getWp_type());
      pstmt.setInt(4, fundinfo.getWp_price());
      pstmt.setString(5, fundinfo.getWp_address());
      pstmt.setString(6, fundinfo.getWp_cardnum());
      pstmt.setString(7, fundinfo.getWp_bank());
      pstmt.setString(8, fundinfo.getWp_accname());
      pstmt.setString(9, fundinfo.getWp_limitdate());
      pstmt.setString(10, fundinfo.getWp_birth());
      pstmt.setInt(11, fundinfo.getWp_install());
*/
      }
      if(proc.equals("complete")) {
      response.sendRedirect("content\\funding\\FUN-UI-04-01.jsp");

     
     
       }
      }else {
      response.sendRedirect("content\\funding\\FUN-UI-01.jsp");

      
      
    }
  }
}
