package wannafit.content.groupfit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wannafit.content.vo.Groupfit;

/**
 * Servlet implementation class grpCRUD_Ctrl
 */
@WebServlet(name = "grpcrud.do", urlPatterns = { "/grpcrud.do" })
public class grpCRUD_Ctrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private grpServ service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public grpCRUD_Ctrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new grpServ();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String proc2 = request.getParameter("proc2");
		String wm_id = request.getParameter("wm_id");
		String gf_category = request.getParameter("gf_category");
		String gf_name = request.getParameter("gf_name");
		String gf_info = request.getParameter("gf_info");
		
		System.out.println("프로세스 확인 : " + proc2);
		System.out.println("ID : " + wm_id);
		System.out.println("유형 : " + gf_category);
		System.out.println("그룹핏 : " + gf_name);
		System.out.println("소개 : " + gf_info);
		
		if(proc2 == null) {
			response.sendRedirect("content\\groupfit\\GF006-add.jsp");
		} else {
			response.setContentType("text/html;charset=utf-8");
			
			if(proc2 != null) {
				if(proc2.equals("ins")) {
					Groupfit ins = new Groupfit(wm_id, gf_name, gf_category, gf_info);
					response.getWriter().print(service.insgrpJson(ins));
				}
				
				if(proc2.equals("upt")) {
					Groupfit upt = new Groupfit(wm_id, gf_name, gf_category, gf_info);
					response.getWriter().print(service.uptgrpJson(upt));
				}
				
				if(proc2.equals("del")) {
					Groupfit del = new Groupfit(wm_id);
					response.getWriter().print(service.delgrpJson(del));
				}
			}
			
		}		
		
	}

}
