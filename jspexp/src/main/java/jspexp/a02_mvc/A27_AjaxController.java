package jspexp.a02_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;

/**
 * Servlet implementation class A25_AjaxController
 */
@WebServlet(name = "schMem.do", urlPatterns = { "/schMem.do" })
public class A27_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
    public A27_AjaxController() {
		super();
		service = new CommonService();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");

		if(id==null) {
			request.getRequestDispatcher("a14_mvc\\a07_mvc_DB3.jsp").forward(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8");
			
			response.getWriter().print(service.getMember(id));
			// {"id":"himan"}
		}
	}

}
