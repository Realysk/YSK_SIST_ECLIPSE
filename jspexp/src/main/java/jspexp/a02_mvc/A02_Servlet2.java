package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A02_Servlet2
 */
@WebServlet(name = "serv02.do", urlPatterns = { "/serv02.do" })
public class A02_Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_Servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ex) servlet A02_Servlet2.java serv02.do로 만들어 물건명, 가격, 수량은 JAVA 변수로 h3로 출력하세요.
		response.setContentType("text/html; charset=UTF-8");
		
		// 1. 요청 값을 받아서 동적인 처리
		String pnameS = request.getParameter("pname");
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		
		PrintWriter out = response.getWriter();
		
		String pname = (pnameS != null)?pnameS:"";
		int price = (priceS != null)?Integer.parseInt(priceS):0;
		int cnt = (cntS != null)?Integer.parseInt(cntS):0;
		out.print("<h3 align='center'> " + "물건명 : " + pname + " </h3>");
		out.print("<h3 align='center'> " + "가격 : " + price + " </h3>");
		out.print("<h3 align='center'> " + "수량 : " + cnt + " </h3>");
		out.print("<h3 align='center'> " + "총계 : " + (price*cnt) + " </h3>");
		// serv02.do?pname=사과&price=3000&cnt=5
		
		// ex) A03_Servlet3.java 요청 값이 없을 때와 있을 때를 분리하여 id=himan&pass=7777 없을 때는 로그인 되지 않음, 있을 때는 해당 id와 pass를 출력하세요.
	}

}
