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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h2 align='center'> Hello Servlet </h2>");
		out.print("<h2 align='center'> 안녕하세요 .(한글처리) </h2>");
		String name="홍길동";
		int num01 = 25;
		int num02 = 25;
		out.print("<h2 align='center'> " + name + ":" + (num01+num02) + " </h2>");
		// ex) servlet A02_Servlet2.java serv02.do로 만들어 물건명, 가격, 수량은 JAVA 변수로 h3로 출력하세요.
		
	}

}
