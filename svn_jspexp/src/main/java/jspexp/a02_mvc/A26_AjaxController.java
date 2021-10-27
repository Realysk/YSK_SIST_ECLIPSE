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
@WebServlet(name = "schEmp.do", urlPatterns = { "/schEmp.do" })
public class A26_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
	public A26_AjaxController() {
		super();
		service = new CommonService();
	}
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empnoS = request.getParameter("empno");

		if (empnoS == null) {
			request.getRequestDispatcher("a14_mvc\\a06_mvc_DB.jsp").forward(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(service.getJsonEmp(Integer.parseInt(empnoS)));
			// {"name":"홍길동"}
		}	   
		
	}

}
