package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A01_ServletStart
 */
@WebServlet(name = "start.do", urlPatterns = { "/start.do" })
public class A01_ServletStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_ServletStart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 # 화면 출력 처리
			JSP 호출 처리 내용
			1. MVC
				1) 요청 값에 대한 처리
					 HttpServletRequest request에 의해서 요청 값을 처리할 수 있다.
					 request.getParameter("요청값key");
				2) Model에 대한 처리
					request.setAttribute("모델명",모델값);
				3) View단에 대한 호출
					RequestDispatcher rd = request.getRequestDispatcher("호출할 JSP 선언");
					rd.forward();
		 */
		PrintWriter out = response.getWriter();
		out.print("<h2 align='center'> Hello Servlet </h2>");
		
	}

}
