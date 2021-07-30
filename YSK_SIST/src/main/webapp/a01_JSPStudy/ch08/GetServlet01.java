package ch08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServlet01
 */
@WebServlet("/ch08/getServlet01")
public class GetServlet01 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter(); 
		
		String msg = request.getParameter("msg");
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Get Servlet01</h1>");
		out.println("msg : " + msg);
		out.println("</body>");
		out.println("</html>");
	}

}
