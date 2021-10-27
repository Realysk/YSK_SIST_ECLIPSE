package wannafit.content.funding;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wannafit.content.vo.FunPro_VO;


/**
 * Servlet implementation class FUN_Ctrl
 */
@WebServlet(name = "fundingsup.do", urlPatterns = {"/fundingsup.do"})
public class FUN_com_ctrl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  // 1. 서비스 선언
  private FUN_serv service;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public FUN_com_ctrl() {
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
    request.setCharacterEncoding("utf-8");
    String fp_category = request.getParameter("category");
    String fp_state = request.getParameter("fp_state");    // 문자열 변환 처리
    String proc = request.getParameter("proc");
    String id = request.getParameter("id");
    System.out.println("id"+id);
    System.out.println("proc"+proc);

       if(proc!=null) {
         System.out.println("category:"+fp_category);
         System.out.println("state:"+fp_state);
         response.setContentType("text/html;charset=utf-8");
         
         if(proc.equals("sch")) {
           System.out.println("category:"+fp_category);
           System.out.println("state:"+fp_state);
             response.getWriter().print(service.getFunList(new FunPro_VO(fp_category,fp_state)));
         }
         
         if(proc.equals("detail")) {
           System.out.println("detail실행");
           System.out.println(proc);
           System.out.println(id);
           response.sendRedirect("content\\fun_com\\FUN-COM-UI-03.jsp?id="+id);
          // response.getWriter().print(service.getJsonFunding(id));
       }
       
     
        
      }else {
      response.sendRedirect("content\\fun_com\\FUN-COM-UI-02.jsp");

      
      
    }
  }
}
