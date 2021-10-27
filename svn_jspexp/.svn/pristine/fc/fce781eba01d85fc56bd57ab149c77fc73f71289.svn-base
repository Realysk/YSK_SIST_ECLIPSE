package jspexp.a02_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A25_AjaxController
 */
@WebServlet(name = "ckAdult.do", urlPatterns = { "/ckAdult.do" })
public class A25_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ageS = request.getParameter("age");

		if (ageS == null) {
			request.getRequestDispatcher("a14_mvc\\a05_mvcAjax2.jsp").forward(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8");
			int age = Integer.parseInt(ageS);
			response.getWriter().print((age >= 18) ? "성인" : "미성년");
		}	   
		
	}

}
