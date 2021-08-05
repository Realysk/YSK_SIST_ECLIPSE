package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A03_Servlet3
 */
@WebServlet(name = "serv03.do", urlPatterns = { "/serv03.do" })
public class A03_Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_Servlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ex) A03_Servlet3.java 요청 값이 없을 때와 있을 때를 분리하여 id=himan&pass=7777 없을 때는 로그인 되지 않음, 있을 때는 해당 id와 pass를 출력하세요.
		response.setContentType("text/html; charset=UTF-8");
		String idS = request.getParameter("id");
		String passS = request.getParameter("pass");
		PrintWriter out = response.getWriter();
		String id = (idS != null) ? idS : "";
		int pass = (passS != null) ? Integer.parseInt(passS) : 0;
		if(idS == null || idS == null) {
			out.print("<h2 align='center'> 로그인되어있지 않습니다. </h2>");
		} else {
			out.print("<h2 align='center'> ID : " + id + "</h2>");
			out.print("<h2 align='center'> PASS : " + pass + "</h2>");
		}
		
	}

}
